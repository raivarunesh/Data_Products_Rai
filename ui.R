library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
    
  # Application title
  titlePanel("Air quality factors for the year 1973."),
  
  # Sidebar with controls to select the random distribution type
  # Note the use of the br() element to introduce extra vertical spacing
  
  sidebarLayout(
    sidebarPanel(
        radioButtons("ycol", "Columns:",
                   c("Ozone" = "Ozone",
                     "Solar Radiation" = "Solar Radiation",
                     "Wind" = "Wind",
                     "Temperature" = "Temperature")),
        			   
		br(),
		
		# Limit the user to select only dates between
		# 01st May 1973 to 31st September 1973.
		#dateInput("date", "Date:", value = "1973-05-01", format = "dd/M/yyyy",
		#		   min="1973-05-01", max="1973-09-30", startview = 'year'),
		selectInput("xcol", "Month", c("May","June","July","August","September")),		   
		actionButton("submit","Submit")
    ),
    
	mainPanel(
	  #tabPanel("Table", tableOutput("table"))
      verbatimTextOutput("test1"),
	  plotOutput("test2")
	  #tableOutput("test")
	  #htmlOutput
	  #plotOutput
	  #imageOutput
	  )
    )
  )
)