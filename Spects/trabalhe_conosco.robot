*** Settings ***
Documentation       Envio de currículo para  a Prime Control-Thiago Costa de Jesus
Library             SeleniumLibrary
Resource            ${EXECDIR}/page/trabalhe_conosco.robot
Suite Setup         Open Browser  about:blank  chrome
Suite Teardown      Close Browser

*** Variables ***
${url}=  https://www.primecontrol.com.br/trabalhe-conosco/

*** Test Cases ***
 Enviar Curriculo
     Go To                              ${url}
     Wait Until Element Is Visible      ${trabalheconosco.btnAccept}        6
     Click Element                      ${trabalheconosco.btnAccept}
     Click Element                      ${trabalheconosco.btncadastrarcurriculo}
     Switch Window                      New
     Input Text                         ${trabalheconosco.nome}         ${preencheFormulario.nome}
     Input Text                         ${trabalheconosco.cargo}        ${preencheFormulario.cargo}
     Input Text                         ${trabalheconosco.salario}      ${preencheFormulario.salario}
     Input Text                         ${trabalheconosco.email}        ${preencheFormulario.email}
     Input Text                         ${trabalheconosco.telefone}     ${preencheFormulario.telefone}
     Select From List By Value          ${trabalheconosco.cbmPais}      ${preencheFormulario.cbmPais}
     Input Text                         ${trabalheconosco.estado}       ${preencheFormulario.estado}
     Input Text                         ${trabalheconosco.cidade}       ${preencheFormulario.cidade}
     Input Text                         ${trabalheconosco.bairro}       ${preencheFormulario.bairro}
     Input Text                         ${trabalheconosco.endereço}     ${preencheFormulario.endereço}
     Input Text                         ${trabalheconosco.cep}          ${preencheFormulario.cep}
     Input Text                         ${trabalheconosco.resumo}       ${preencheFormulario.resumo}
     Choose File                        ${trabalheconosco.curriculo}    ${EXECDIR}/Spects/curriculo_thiagocostadejesus.pdf
     Wait Until Page Contains           curriculo_thiagocostadejesus.pdf  30
     Scroll Element Into View           ${trabalheconosco.btnfinalizar}
     Click Element                      ${trabalheconosco.termo}
     Wait Until Element Is Enabled      ${trabalheconosco.btnfinalizar}      6
     Click Element                      ${trabalheconosco.btnfinalizar}
     Wait Until Element Contains        ${trabalheconosco.sucesso}       ${preencheFormulario.sucesso}


