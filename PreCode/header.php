    <body <?php body_class(); ?> data-offset="90" data-target=".navigation" data-spy="scroll" id="page-top">
        <header>
            <h1>4Sale by owner</h1>
		</header>
		<div id="page" class="hfeed site wrapper">
		<a class="skip-link screen-reader-text" href="#content"><?php _e( 'Skip to content', 'zoner-lite' ); ?></a>
		
		<!-- Navigation -->
		<div class="navigation" role="banner">
			<?php zoner_seconadry_navigation(); ?>
			<div class="container">
				<header class="navbar" id="top">
					<div class="navbar-header">
						<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
							<span class="sr-only"><?php _e('Toggle navigation', 'zoner-lite'); ?></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<?php zoner_get_logo(); ?>
					</div>
					<?php zoner_get_main_nav(); ?>
				</header><!-- /.navbar -->
			</div><!-- /.container -->
		</div><!-- /.navigation -->
		<!-- end Navigation -->
		<?php zoner_get_home_slider(); ?>
		<div id="page-content" class="site-main">

        <?php
            include('classes/databaseClass.php');
            include('classes/loginClass.php');
            include('classes/productClass.php');
            include('classes/conversationClass.php');
            include('classes/adminClass.php');
            $databaseObj     = new Database();
            $loginObj        = new Login();
            $productObj      = new Product();
            $conversationObj = new Conversation();
            $adminObj        = new Admin();
            session_start();
            $range = null;
            $user_id = null;
            $bannedUser = null;          
           
            if (isset($_SESSION['USERNAME'])) {
                $range = $loginObj->getRangeType($_SESSION['USERNAME']);
                $user_id = $loginObj->getUserId();
                $bannedUser = $loginObj->checkBannedUsers($user_id);
            }
           
            if ($loginObj->isLoggedIn() && count($bannedUser) == 1) {
        ?>
               <aside id="loggedMenu" >
               <button type="button" onClick="window.location.href='logout.php'">Logout</button>
                </aside>
               <?php
            }
            elseif($loginObj->isLoggedIn() && strcmp($range, "Regular") === 0){
        ?>
        <aside id="loggedMenu" >
            <button type="button" onClick="window.location.href='index.php'">Home</button>
            <button type="button" onClick="window.location.href='userProfile.php'">Profile</button>
            <button type="button" onClick="window.location.href='messenger.php'">Messages</button>
            <button type="button" onClick="window.location.href='product.php'" >Upload</button>
            <button  type="button" onClick="window.location.href='displayApartments.php'">Your places</button>
            <button type="button" onClick="window.location.href='search.php'">Search</button>
            <button type="button" onClick="window.location.href='logout.php'">Logout</button>
            <?php echo "Logged in as: " . $_SESSION['USERNAME']; ?>
        </aside>
        <?php
          }elseif($loginObj->isLoggedIn() && strcmp($range, "Admin") === 0) {
        ?>
        <aside id="loggedMenu" >
            <button type="button" onClick="window.location.href='index.php'">Home</button>
            <button type="button" onClick="window.location.href='userProfile.php'">Profile</button>
            <button type="button" onClick="window.location.href='adminPanel.php'">Admin</button>
            <button type="button" onClick="window.location.href='messenger.php'">Messages</button>
            <button type="button" onClick="window.location.href='product.php'" >Upload</button>
            <button  type="button" onClick="window.location.href='displayApartments.php'">Your places</button>
            <button type="button" onClick="window.location.href='search.php'">Search</button>
            <button type="button" onClick="window.location.href='logout.php'">Logout</button>
            <?php echo "Logged in as: " . $_SESSION['USERNAME']; ?>
        </aside>
        <?php
          } else{
        ?>
        <aside id="unloggedMenu">
            <button type="button" onClick="window.location.href='index.php'">Home</button>
            <button type="button" onClick="window.location.href='search.php'">Search</button>
            <button type="button" onClick="window.location.href='login.php'" >Login</button>
            <button type="button" onClick="window.location.href='signUp.php'">Sign Up</button>
        </aside>
        
        <?php 
            } 
            ?>
        <section id="content">