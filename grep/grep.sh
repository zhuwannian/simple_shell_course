



grep "\$config\[\'hostname\'\]"  ~/code/baiweilianCode/zwnxbbll_local_eco_OMPV2/application/config/database.php | awk '{print $3}' | cut -d ';' -f 1 



