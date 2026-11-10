*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://dummyjson.com

*** Keywords ***
Conectar na API DummyJSON
    Create Session    dummyApi    ${BASE_URL}    disable_warnings=1