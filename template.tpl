___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Item Array Augmenter - Shopify ID",
  "description": "",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "itemsArray",
    "displayName": "Items Array",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "marketCode",
    "displayName": "Market Code (e.g., GB) Use ISO codes only",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

// Require the necessary GTM APIs
const getType = require('getType');

// Get the data from the template fields
const originalItems = data.itemsArray;
const market = data.marketCode || ''; // Get the market code, or default to an empty string

// Check if it's a valid array
if (getType(originalItems) !== 'array') {
  return [];
}

// Transform the array
const formattedItems = originalItems.map(item => {

  // Check if the item is an object with valid string IDs
  if (getType(item) === 'object' && 
      getType(item.item_id) === 'string' && 
      getType(item.item_variant) === 'string') {
    
    const productId = item.item_id;
    const variantId = item.item_variant;
    
    // Build the new ID. 
    // If market is 'GB', result is 'shopify_GB_123_456'
    // If market is blank, result is 'shopify__123_456' (which is fine)
    item.item_id = 'shopify_' + market + '_' + productId + '_' + variantId;
    
    // Also add the parent_product_id as a custom dimension
    item.item_group_id = productId;
  }
  
  // Return the modified item
  return item;
});

// Return the final formatted array
return formattedItems;


___TESTS___

scenarios: []


___NOTES___

Created on 04/11/2025, 15:00:53


