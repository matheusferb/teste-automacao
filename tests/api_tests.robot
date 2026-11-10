*** Settings *****************************************************************
Resource    ../resources/common.resource
Suite Setup    Conectar na API DummyJSON

*** Test Cases ***************************************************************
Cenario 01: Deve retornar uma lista de produtos com sucesso (GET)
    # Cria uma sessão HTTP apontando para a API base
    Create Session    dummyApi    ${BASE_URL}    disable_warnings=1

    # Realiza a requisição GET na rota de produtos
    ${response}=    GET On Session    dummyApi    /products/1

    # Valida o código de status HTTP (200 OK)
    Should Be Equal As Numbers    ${response.status_code}    200

    # Valida dados do corpo da resposta (JSON)
    ${body}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${body}[title]   Essence Mascara Lash Princess

Cenario 02: Deve realizar login com sucesso simulando autenticação (POST)
    Create Session    dummyApi    ${BASE_URL}    disable_warnings=1

    # Dados para envio no POST (Payload)
    &{usuario}=    Create Dictionary    username=emilys    password=emilyspass

    # Realiza a requisição POST para autenticação
    ${response}=    POST On Session    dummyApi    /auth/login    json=${usuario}

    # Valida se o login foi bem-sucedido (200 OK)
    Should Be Equal As Numbers    ${response.status_code}    200

    # Valida que o token de acesso foi retornado no corpo da resposta
    ${body}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${body}    token


*** Keywords ***
Dictionary Should Contain Key
    [Arguments]    ${arg1}    ${arg2}
    # TODO: implement keyword "Dictionary Should Contain Key".
    Fail    Not Implemented
