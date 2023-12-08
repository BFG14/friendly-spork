    response_csci=$(curl "https://testregistrar.nu.edu.kz/my-registrar/course-registration/json?_dc=1701705021987&method=registerSections&sections=instance_24152_component_28544_section_1-instance_24152_component_28545_section_6&userid=202376612" --compressed -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0" -H "Accept: */*" -H "Accept-Language: en-US,en;q=0.5" -H "Accept-Encoding: gzip, deflate, br" -H "X-Requested-With: XMLHttpRequest" -H "DNT: 1" -H "Connection: keep-alive" -H "Referer: https://testregistrar.nu.edu.kz/my-registrar/course-registration/selected" -H "Cookie: ${COOKIE}" -H "Sec-Fetch-Dest: empty" -H "Sec-Fetch-Mode: cors" -H "Sec-Fetch-Site: same-origin" -k -s)
    echo "csci:";
    if echo "$response_csci" | grep -q "Registration Successful"; then
        echo -e "${GREEN}success${NC}"
    elif echo "$response_csci" | grep -q "PREREQUISITE ERROR"; then
        echo -e "${YELLOW}prerequisite error${NC}"
    elif echo "$response_csci" | grep -q "again"; then
        echo -e "${BLUE}already registered${NC}"
    elif echo "$response_csci" | grep -q "You are not authorized"; then
        echo -e "${RED}authorization error${NC}"
    elif echo "$response_csci" | grep -q "is full"; then
        echo -e "${RED}FULL${NC}"
    else
        echo -e "unknown response:"
        echo "$response_csci"
    fi