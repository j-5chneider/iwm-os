# AUTHENTIFICATION
# GET TOKEN FROM OSF.IO > SETTINGS > PERSONAL ACCESS TOKENS > CREATE TOKENS
  library(osfr)
  osf_auth("ADD TOKEN HERE")

# GET THE DATA FROM YOUR SURVEY
  library(formr)
  formr_connect(email = 'juergen.schneider@uni-tuebingen.de', password = '123secure' ) # DON'T WORRY IT'S A TEMPORARY PASSWORD
  data_raw <- formr_raw_results(survey_name = 'tmp_1')   # FILL IN YOUR SURVEY NAME HERE
  write.csv(data_raw, file = "data/raw_data.csv")        # SAVE THE DATA LOCALLY


  
### HOW TO SYCRONIZE DATA WITH OSF ###
  
## OPTION 1: CREATE A NODE WITHIN A PROJECT
# GET THE NODE NAME OF YOUR PROJECT FROM OSF
  cr_project <- osf_retrieve_node("jzuxb")
  
# CREATE  A COMPONENT IN THE PROJECT
  cr_project %>%
    osf_create_component("survey data", category = "data") %>%  # YOU CAN RENAME THE COMPONENT OTHER THAN 'survey data'
    osf_upload("data/raw_data.csv", overwrite = T) %>%          # PUSH THE DATA TO OSF
    osf_open()                                                  # CHECK IT OUT ON OSF


## OPTION 2: USE EXITING COMPONENT
# GET NODE INFORMATION OF DATA COMPONENT
cr_project_data <- osf_retrieve_node("s7wfd")     # FILL IN HERE THE NAME OF THE NODE

# PUSH DATA TO THE NODE
cr_project_data %>%
  osf_upload("data/raw_data.csv", overwrite = T)


## GET DATA FROM THE NODE
osf_retrieve_file("https://osf.io/p68gk/") %>% 
  osf_download(path="data/raw_data.csv", overwrite = T)

