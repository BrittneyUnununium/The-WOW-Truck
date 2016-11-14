<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/png" href="http://thewowtruckspokane.com/icon.png" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>The WOW Truck - Menu</title>
<meta name="description" content="The WOW Truck - Spokane, WA. The food truck with BIG CITY taste, we are sure to WOW you." />
<meta name="keywords" content="food, delivery, spokane, online, order" />

		<style type="text/css">
			BODY {
				background: url(/images/menu-bg.jpg) no-repeat center top #000;
			}
		</style>

		<link href="/css/common.css" rel="stylesheet" type="text/css" />
		<link href="/css/menu.css" rel="stylesheet" type="text/css" />

	</head>
	<body>

		<div class="Wrapper">


		<!-- LOGO AREA -->

		<div class="Header" style="text-align: center;">
		<img src="images/header_banner2.png" alt="" style="width: 726px; height: 50px;" />
		</div>

			<!-- NAVIGATION BAR -->
			<div class="WrapperBG Navigation">
				<div>
					<a href="/">HOME</a><a href="menu.php" class="selected">MENU</a><a href="contact.php">CONTACT US</a>
				</div>
			</div>

			<!-- CONTENT AREA -->
			<div class="WrapperBG Content">
				<h2>Menu</h2><br />

	<script type="text/javascript">

		function showProduct(image, name)
		{
			var
				body = document.getElementsByTagName('body')[0],
				wrap = document.createElement('div'),
				base = document.createElement('div'),
				bimg = document.createElement('img');

			function hide()
			{
				wrap.parentNode.removeChild(wrap);
				base.parentNode.removeChild(base);
			}

			wrap.className = 'MenuItemPreviewWrap';
			base.className = 'MenuItemPreviewBase';
			wrap.onclick = hide;
			base.onclick = hide;

			base.appendChild(bimg);
			base.appendChild(document.createElement('div')).innerHTML = name;
			body.appendChild(wrap);

			bimg.src = image;
			bimg.onload = function()
			{
				body.appendChild(base);
				base.style.width = (bimg.offsetWidth + 30) + 'px';
				base.style.marginLeft = -(base.offsetWidth  / 2) + 'px';
				base.style.marginTop  = -(base.offsetHeight / 2) + 'px';
			};

		}

	</script><div class="Menu"><?php

		require('includes/db.php');

		$side = false;
		$rs_cats = $DB->query('SELECT c.id, c.name, c.desc, c.side FROM categories c ORDER BY c.side, c.rank');
		while ($cat = $rs_cats->next()) {

			if ($side !== $cat['side']) {
				if ($side) {echo '</div></div>';}
				echo '<div style="float: ' . $cat['side'] . '; width: 49.9%;"><div style="padding: 10px;">';
				$side = $cat['side'];
			}

			echo
				'<h1>' . htmlentities($cat['name']) . '</h1>' .
				($cat['desc'] ? '<h3>' . htmlentities($cat['desc']) . '</h3>' : '') .
				'<div class="MenuItems">';

			$rs_items = $DB->query(array('SELECT i.name, i.desc, i.image, i.price FROM items i WHERE i.category_id = ? ORDER BY i.rank, i.name', $cat['id']));
			while ($item = $rs_items->next()) {
				if ($item['price']) {
					echo
						'<div class="MenuItem" onclick="showProduct(\'' . '/menu_images/l_' . $item['image'] . '\', \'' . htmlentities($item['name']) . '\');">' .
							'<img src="' . '/menu_images/' . $item['image'] . '" alt="" />' .
							'<div>' . htmlentities($item['name']) . '</div>' .
							($item['desc'] ? '<div>' . htmlentities($item['desc']) . '</div>' : '') .
							'<div>$ ' . number_format($item['price'] / 100, 2, '.', ',') . '</div>' .
						'</div>';
				} else
				if ($item['name']) {
					echo '<h2>' . htmlentities($item['name']) . '</h2>';
				}
				if ($item['desc']) {
					echo '<h3>' . htmlentities($item['desc']) . '</h3>';
				}
			}
			$rs_items->free();

			echo
				'</div>';

		}
		$rs_cats->free();
		if ($side) {echo '</div></div>';}

	?><div style="clear: both;"></div></div>
				<br />
				<br />
				<h2>Take-Out & Delivery</h2><br />
				<strong><u>TAKE-OUT</u></strong><br />
				<strong>CALL IN YOUR ORDER 30 MINUTES IN ADVANCE</strong><br />
				<br />
				<strong><u>DELIVERY</u></strong><br />
				<strong>CALL US TO REQUEST AN ORDER DELIVERY</strong><br />
				<br />
				<strong><u>DELIVERY MINIMUM</u></strong><br />
				<strong>$20.00 ORDER</strong><br />
				<br />
				<strong>$3.00 DELIVERY FEE</strong><br />
				<strong>15% TIP AUTOMATICALLY CHARGED</strong><br />
				<br />
				<br />
				<br />
				<h2> Business Hours</h2><br />
				<strong><u>OPEN 7 DAYS A WEEK</u></strong><br />
				<br />
				<strong>MONDAY-THURSDAY</strong><br />
				8am - 7pm<br />
				<strong>FRIDAY</strong><br />
				8am - 8pm<br />
				<strong>SATURDAY</strong><br />
				9am -  8pm<br />
				<strong>SUNDAY</strong><br />
				11am - 6pm<br />
                                <br />
				<strong>(509) 768-1349</strong><br />
				<br />
				<br />
			</div>
		</div>

		<div class="Footer">
			<div class="Wrapper">
				<br />
				<strong>MONDAY-THURSDAY</strong><br />
				8am - 7pm<br />
				<strong>FRIDAY</strong><br />
				8am - 8pm<br />
				<strong>SATURDAY</strong><br />
				9am -  8pm<br />
				<strong>SUNDAY</strong><br />
				11am - 6pm
				<p>
				<br />
				<strong>We deliver and do take-out!</strong><br />
				<strong>(Call 30 minutes in advance.)</strong><br />
				<strong>(509) 768-1349</strong><br />
				<p>
				<br />
				© 2014  | The WOW Truck. All rights reserved.
				<br />
				Website created by <a href="http://www.clinic4pc.com/" style="color: #c7a900;">www.clinic4pc.com</a>
				<p>
				<br />
			</div>
		</div>

	</body>
</html>