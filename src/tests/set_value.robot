*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
Setting value to 10 changes counter to 10
    Go To  ${HOME_URL}
    Input Text  new_value  10
    Click Button  aseta
    Page Should Contain  nappia painettu 10 kertaa

Setting value and then incrementing works
    Go To  ${HOME_URL}
    Input Text  new_value  5
    Click Button  aseta
    Page Should Contain  nappia painettu 5 kertaa
    
    Click Button  Paina
    Page Should Contain  nappia painettu 6 kertaa

Setting value to zero from a non-zero value
    Go To  ${HOME_URL}
    Click Button  Nollaa
    Click Button  Paina
    Page Should Contain  nappia painettu 1 kertaa

    Input Text  new_value  0
    Click Button  aseta
    Page Should Contain  nappia painettu 0 kertaa
