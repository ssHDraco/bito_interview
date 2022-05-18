*** Settings ***
Library    Selenium2Library
Library    String


*** Test Cases ***
Check Google and Apple Version
    # get version in google play
    Open Browser    https://play.google.com/store/apps/details?id=com.bitoex.bitoproapp    chrome

    Click Element    xpath=//*[text()="關於這個應用程式"]//ancestor::header//i[contains(@class, "google-material-icons")]
    Wait Until Element Is Visible   xpath=//div[@role="dialog"]
    ${google_version}=    Get Text    xpath=//*[text()="版本"]//following-sibling::div

    Close browser

    # get version in apple store
    Open Browser    https://apps.apple.com/tw/app/bitopro/id1393007496    chrome

    ${apple_version_with_tile}=    Get Text    xpath=//p[contains(@class, "whats-new__latest__version")]
    ${apple_version_str_list}=    Split String   ${apple_version_with_tile}
    ${apple_version}=    Set variable    ${apple_version_str_list[-1]}

    Close browser

    # check both versions are equql
    Should be equal    ${google_version}    ${apple_version}

    [Teardown]    Close browser
