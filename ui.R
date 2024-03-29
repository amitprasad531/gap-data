shinyUI(
  navbarPage(
  "SDG GAP Indicators Database and Metadata",
  tabPanel("Database",
  sidebarLayout(
    sidebarPanel(
      HTML(paste(span("Data compiled from ", style="font-weight: bold;"), 
                 a(href="https://unstats.un.org/sdgs/indicators/database", "UNSD SDG Database"), 
                 " and ", 
                 a(href="https://www.who.int/gho/en/", "WHO Global Health Observatory"), " 2019")), br(), br(),
      checkboxGroupInput("region_data", "Select Regions",
                         choices = levels(gap$Region),
                         selected = levels(gap$Region)),
      pickerInput("country_data", "Select Countries (from dropdown list)",
                  choices = c(levels(gap$Country)),
                  selected = sample(levels(gap$Country), 15),
                  multiple = TRUE,
                  options = list(title = "Select Countries",
                                 size = 15,
                                 `actions-box` = TRUE)), br(),
      pickerInput("indicators_data", "Select Indicators (from dropdown list)",
                  choices = gap_colnames,
                  multiple = TRUE,
                  selected = sample(gap_colnames, 10),
                  options = list(title = "Select Indicators",
                                 `actions-box` = TRUE,
                                 size = 15)
      ), br(),
      sliderInput("year_data", "Select Year Range",
                  min = 2000, max = 2018,
                  value = c(2013, 2016),
                  sep = ""),
      prettySwitch("latest", "Latest Available",
                   status = "success", fill = TRUE), 
      HTML(paste(span("Note: ", style="font-weight: bold;"), 
                 "If Latest Available is selected then year range will be invalid")), br(), br(),
      downloadButton("downloadData", "Download Data"),
      width = 3
    ),
    mainPanel(
      DT::dataTableOutput("database")
    )
  )
  ),
  tabPanel("Metadata",
    sidebarLayout(
      sidebarPanel(
        HTML(paste(span("Source: ", style="font-weight: bold;"), 
                   a(href="https://unstats.un.org/sdgs/metadata/", "UNSD SDG Metadata"),
                   " and ",
                   a(href="http://bit.ly/gpw13-metadata", "WHO GPW13 Programmatic Indicators Metadata 2019"))), br(), br(),
        selectInput("indicator_meta", "Select Indicator",
                    choices = gap_choices_full,
                    selected = "ihr"),
        width = 3
      ),
      mainPanel(
        htmlOutput("indicatorMetadata"), br(),
        fluidRow(
          column(6, htmlOutput("indicator_name")),
          column(6, htmlOutput("indicator_definition"))
        ), hr(),
        fluidRow(
          column(6, htmlOutput("indicator_numerator")),
          column(6, htmlOutput("indicator_denominator"))
        ), hr(),
        fluidRow(
          column(6, htmlOutput("indicator_methods")),
          column(6, htmlOutput("indicator_limitations"))
        ), hr(),
        fluidRow(
          column(6, htmlOutput("indicator_data_source")),
          column(6, htmlOutput("indicator_data_avail"))
        )
      )
    )
  )
))
