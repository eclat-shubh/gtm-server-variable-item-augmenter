# Server-Side Item Array Augmenter

This is a **Server-Side Google Tag Manager Variable Template** designed to augment your `items` array. It's particularly useful for Shopify stores needing to create custom item ID formats for GA4 and Google Ads.

## Features

* **Custom ID Formatting:** Overwrites the `item_id` with a custom format (e.g., `shopify_GB_123_456`).
* **Parent ID:** Adds the original product ID as `parent_product_id`, perfect for an item-scoped custom dimension in GA4.
* **Configurable Market:** Lets you define a market code (e.g., GB, US, FR) to be prefixed to the new ID.

## How to Use

1.  **Install:** Add this template to your Server-Side GTM container from the Community Template Gallery.
2.  **Create a Variable:**
    * Go to **Variables** > **New**.
    * Choose your new template: **`Item Array Augmenter - Shopify ID`**.
    * In the **"Items Array"** field, input your existing items variable (e.g., `{{ed - items}}` or `{{Event Data - ecommerce.items}}`).
    * In the **"Market Code"** field, type your market prefix (e.g., `GB`).
    * Save the variable as (e.g., `{{Items - Formatted for GA4}}`).
3.  **Apply with a Transformation:**
    * Go to **Transformations** > **New**.
    * Choose **Augment event**.
    * Under **Parameters to Augment**, add a parameter:
        * **Name:** `items`
        * **Value:** `{{Items - Formatted for GA4}}` (the variable you just created).
    * Under **Affected Tags**, choose the tags (e.g., your GA4 and Google Ads tags) that should receive this new array.
    * Save the transformation.
