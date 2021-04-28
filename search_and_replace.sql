UPDATE wp_options SET option_value = replace(option_value, 'https://originalsite.com', 'http://dev.local.com') WHERE option_name = 'home' OR option_name = 'siteurl';
UPDATE wp_posts SET guid = replace(guid, 'https://originalsite.com','http://dev.local.com');
UPDATE wp_posts SET post_content = replace(post_content, 'https://originalsite.com', 'http://dev.local.com');
UPDATE wp_postmeta SET meta_value = replace(meta_value,'https://originalsite.com','http://dev.local.com');
