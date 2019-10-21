# AUTHENTIFICATION
# GET TOKEN FROM OSF.IO > SETTINGS > PERSONAL ACCESS TOKENS > CREATE TOKENS
  library(osfr)
  osf_auth("ADD TOKEN HERE")
  
## USE EXITING COMPONENT
# GET NODE INFORMATION OF SURVEY COMPONENT
cr_project_survey <- osf_retrieve_node("djs2p")     # FILL IN HERE THE NAME OF THE NODE

# PUSH CODEBOOK TO THE NODE
cr_project_survey %>%
  osf_upload("3_codebooks/codebook1.html", overwrite = T)