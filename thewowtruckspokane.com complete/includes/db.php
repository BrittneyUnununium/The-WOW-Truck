<?php

	class DB_Connection
	{

		var $database_id = 0;
		var $query_count = 0;

		function DB_Connection($server, $username, $password, $database, $persistent = true)
		{
			$this->database_id = ($persistent ? @mysql_pconnect($server, $username, $password) : @mysql_connect($server, $username, $password))
				or die('Could not connect to database!');
			@mysql_select_db($database, $this->database_id)
				or die('Could not select database!');
		}

		function query($command, $page_size = 0, $page_num = 1)
		{
			$record_count = 0;

			if (is_array($command)) {$j = array_shift($command); $k = array();
				foreach ($command as $i) {if (is_int($i) || is_float($i)) {$k[] = $i;} else if (is_bool($i)) {$k[] = $i ? 1 : 0;} else {$k[] = '"' . $this->escape($i) . '"';}}
				for ($i = 0, $f = 0, $command = ''; $i < strlen($j); ++$i) {$c = $j[$i];
					if ($f) {if ($f & 2) {$f &= ~2;} else if ($c === $q) {$f = 0;} else if ($c === '\\') {$f |= 2;}} else if (strpos('"\'`', $c) !== false) {$f = 1; $q = $c;}
					$command .= (!$f && $c === '?') ? array_shift($k) : $c;
				}
			}
			if (!$page_size) {
				$query_id = mysql_query($command, $this->database_id);
			} else {
				$page_size    = max($page_size, 1);
				$page_num     = max($page_num, 1);
				$position     = strpos(strtoupper($command), 'SELECT') + 6;
				$query_id     = mysql_query(substr($command, 0, $position) . ' SQL_CALC_FOUND_ROWS' . substr($command, $position) . ' LIMIT ' . ($page_size * ($page_num - 1)) . ',' . $page_size, $this->database_id);
				$record_count = $this->lookup('SELECT FOUND_ROWS()');
			}

			++$this->query_count;
			if (is_resource($query_id)) {
				return new DB_Recordset($query_id, $page_size, $page_num, $record_count);
			} else
			if ($query_id) {
				$insert_id = mysql_insert_id($this->database_id);
				return $insert_id ? $insert_id : mysql_affected_rows($this->database_id);
			}
			return false;
		}

		function lookup($command, $default = '')
		{
			$query  = $this->query($command);
			$result = (mysql_num_fields($query->query_id) > 1) ?
				(($record = $query->next()) ? $record : $default) :
				(($record = $query->next(MYSQL_NUM)) ? $record[0] : $default);
			$query->free();
			return $result;
		}

		function getArray($command, $indexes = null, $values = null)
		{
			$result = array();
			$query  = $this->query($command);
			$count  = mysql_num_fields($query->query_id);

			if (!$indexes) {$indexes = array(mysql_field_name($query->query_id, 0));} else
			if (!is_array($indexes)) {$indexes = array($indexes);}
			if (!$values)  {$values = ($count < 3) ? array(mysql_field_name($query->query_id, min(1, $count - 1))) : array();} else
			if (!is_array($values))  {$values = array($values);}

			while ($record = $query->next()) {
				$entry = &$result;
				foreach ($indexes as $index) {
					$record_index = ($index === '#') ? count($entry) : $record[$index];
					if (!isset($entry[$record_index])) {$entry[$record_index] = array();}
					$entry = &$entry[$record_index];
				}
				if (!$values)             {$entry = $record;} else
				if (count($values) === 1) {$entry = $record[$values[0]];} else
				                          {foreach ($values as $value) {$entry[$value] = $record[$value];}}
			}
			$query->free();

			return $result;
		}

		function escape($string)
		{
			return mysql_real_escape_string($string, $this->database_id);
		}

	}

	class DB_Recordset
	{

		var $query_id = 0;
		var $position = 0;
		var $count    = 0;

		function DB_Recordset($query_id = 0, $page_size = 0, $page_num = 1, $record_count = 0)
		{
			$this->query_id = $query_id;
			if (!$page_size) {
				$this->count = mysql_num_rows($this->query_id);
			} else {
				$this->count      = $record_count;
				$this->page_start = min(1 + ($page_size * ($page_num - 1)), $record_count);
				$this->page_end   = min($page_size * $page_num, $record_count);
				$this->page_size  = $page_size;
				$this->page_num   = $page_num;
				$this->page_count = (($record_count - ($record_count % $page_size)) / $page_size) + (($record_count % $page_size) > 0 ? 1 : 0);
			}
		}

		function free()
		{
			mysql_free_result($this->query_id);
		}

		function next($result_type = MYSQL_ASSOC)
		{
			++$this->position;
			return mysql_fetch_array($this->query_id, $result_type);
		}

		function fields()
		{
			$fields = array();
			for ($i = 0, $j = mysql_num_fields($this->query_id); $i < $j; ++$i) {
				$fields[] = mysql_fetch_field($this->query_id, $i);
			}
			return $fields;
		}

	}

	$DB = new DB_Connection('thewowtruckspokaneco.ipagemysql.com', 'thewowtruck', 'thewowtruck', 'twt_57up1dd6n4m3');

