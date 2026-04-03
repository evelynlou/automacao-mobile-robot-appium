*** Settings ***
Library    AppiumLibrary

*** Variables ***

${campo_nome}    	    test-Username
${campo_senha}    	    test-Password
${login}                test-LOGIN

*** Keywords ***

Abrir o aplicativo
    Open Application
    ...    remote_url=http://127.0.0.1:4723  
    ...    platformName=Android    
    ...    deviceName=emulator-5554
    ...    app=app/app.apk
    ...    automationName=UiAutomator2
    ...    appWaitActivity=com.swaglabsmobileapp.MainActivity
    ...    noSign=${True}
    ...    appWaitDuration=20000
    ...    uiautomator2ServerInstallTimeout=180000
    ...    adbExecTimeout=180000

Fechar o aplicativo
    Close All Applications

Digitar o termo "${nome}" no campo username
    Wait Until Element Is Visible    accessibility_id=${campo_nome}
    Click Element    accessibility_id=${campo_nome}
    Input Text    accessibility_id=${campo_nome}    text=${nome}
    

Digitar o termo "${senha}" no campo password
    Sleep    3s
    Click Element    accessibility_id=${campo_senha}
    Input Text    accessibility_id=${campo_senha}    text=${senha}

Validar login inválido
    Click Element    accessibility_id=${login}
    Wait Until Element Is Visible    accessibility_id=test-Error message

Validar login com sucesso
    Click Element    accessibility_id=${login}
    Wait Until Element Is Visible    accessibility_id=test-Cart