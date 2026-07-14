{ config,libs, pkgs, ... }:
{
services.wordpress.sites."siteecommerce.local" = {
    database.createLocally = true; 
    settings = {
        FS_METHOD = "direct";
      };
    themes = let 
      kadence = pkgs.fetchzip { 
       url = "https://downloads.wordpress.org/theme/kadence.zip";
       sha256 = "sha256-+n9tdg6i9UzOfXzZ6WxFrrZTOqiGNsEA8OEuS79ibss=";
     };
    in {
       inherit kadence;
    };
    plugins = let 
	kadence-starter-templates = pkgs.fetchzip { 
       url = "https://downloads.wordpress.org/plugin/kadence-starter-templates.2.3.1.zip";
       sha256 = "sha256-+qHyshWzXYJlfY4guRfcNNBUe+ellTkYNZ5SPjw3M8A=";
     };	
	kadence-blocks = pkgs.fetchzip { 
	url = "https://downloads.wordpress.org/plugin/kadence-blocks.3.7.2.zip";
	sha256 = "sha256-0nKM4GFyw6xKvLNSf4S2Q3laqCwQvap3tq5s+NzJUNo=";
       }; 	
    in {
       inherit kadence-starter-templates kadence-blocks;
   };
 };
}