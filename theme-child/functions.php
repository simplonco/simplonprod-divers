<?php
//////////////////////////
// Generic child theme //
// By SimplonProd     //
///////////////////////


////////////
// CSS

add_action( 'wp_enqueue_scripts', 'theme_enqueue_styles' );

function theme_enqueue_styles() {
    wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'child-style',
        get_stylesheet_directory_uri() . '/style.css',
        array('parent-style')
    );
}

//////////////////
// TRANSLATIONS

// Load translation files from your child theme instead of the parent theme
/*
 * UNCOMMENT IF NEEDED
 * REPLACE XXX BY PARENT'S THEME TEXT DOMAIN
function my_child_theme_locale() {
    load_child_theme_textdomain( XXX, get_stylesheet_directory() . '/languages' );
}
add_action( 'after_setup_theme', 'my_child_theme_locale' );*/


///////////////
// FUNCTIONS

function get_user_role() {
    global $current_user;
    $user_roles = $current_user->roles;
    $user_role = array_shift($user_roles);
    return $user_role;
}


///////////
// MAIN //
/////////

//Give editor access to the theme options
$role = get_role('editor'); 
$role->add_cap('edit_theme_options');


//remove admin bar
show_admin_bar(false);

///////////////////////
// Clients right gestion
add_action('admin_init', 'sp_remove_menu_pages');

//TO BE CONFIGURED
//FILL THE TABLE WITH ALL THE URLS TO BE REMOVED FROM THE ADMIN
$tabPagesRemoved = [
	/*
	 * Example :
	 "edit.php?post_type=tmonials",
	 "edit.php?post_type=projects"
	*/
];

function sp_remove_menu_pages() {
    if (get_user_role() == "editor") {
	foreach($tabPagesRemoved as $page){
	        remove_menu_page($page);
	}
    }
}

