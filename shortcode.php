<?php

/**
 * External Database Shortcode
 */
function retrieve_external_database() {
    static $external_db = null;
    if($external_db === null) {
        $external_db = new wpdb(
            'DB-USER', 'DB-PASSWORD', 'DB-TABLE', 'DB-SERVER'
        );
    }
    return $external_db;
}

//Function to load shortcode content
function external_db_shortcode_sots() {
  //Get database
    $db = retrieve_external_database();

  //If no connection, return error
    if($db->error) {
        return '<p>External database connection error.</p>';
    }

  //Get all records from the Items table and store them
    $item_results = $db->get_results(
        "SELECT * FROM Items ORDER BY Item_ID"
    );

  //If no records are detected, return that
    if(!$item_results) {
        return '<p>No records available.</p>';
    } 

  //Output string to store all HTML that will be placed on the page
    $output = '';

  //Loop through each item
    foreach ($item_results as $record) :
      //Add the item name as a header
        $output .= "<div class=\"outer-content-container\"><h2 class=\"item-name-text\">" . $record->Name . "</h2>";

      //Add the image using the image url
        $output .= '<img src="' . $record->Img_URL . '" alt="' . $record->Name . ' Icon">';

      //Add the text for the item rarity
        $output .= "<div class=\"inner-text-content-container\"><p class=\"rarity-text\"><strong>Rarity: </strong>" . $record->Rarity . "</p>";

      //Add the text for the item version
		    $output .= "<p class=\"version-text\"><strong>Version: </strong>" . $record->Version . ".0</p>";
      
      //Add the text for the item description 
        $output .= "<p class=\"description-text\">" . $record->Description . "</p></div>";

      //Add the text for the item details
		    $output .= "<div class=\"item-details-container\"><h4 class=\"item-details-header\">Details</h4><p class=\"item-details-text\">" . $record->Details . "</p></div>";
	
	//Run a check if other versions of the item have existed before
	if($record->Version > 1) {
		
		//Get the results for that previous item history
		$item_history_results = $db->get_results(
		"SELECT * FROM ItemHistory WHERE ItemID = " . $record->Item_ID
		);

    //Loop through each item version
		foreach ($item_history_results as $item_variant) :

      //Add a container, version, and description of that item version
			$output .= "<div class=\"item-history-container\"><hr>";
			$output .= "<p class=\"historic-version-text\"><strong>Version: </strong>" . $item_variant->VersionNum . ".0</p>";
      $output .= "<p class=\"historic-description-text\">" . $item_variant->Description . "</p></div>";
		endforeach;
	}

  //Closing div for the outer-content-container class
	$output .= "</div>";
	
    endforeach;

  //Return the output HTML to the browser
    return $output;
}

//Add the shortcode to WordPress
add_shortcode('external_db_content_sots', 'external_db_shortcode_sots');
