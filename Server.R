library(shiny)
library(datasets)
library(ggplot2)

shinyServer(function(input, output) {
  
    datay <- reactive({
   
				yaxis<-switch(input$ycol,
                "Ozone" = "Ozone",
                "Solar Radiation" = "Solar.R",
                "Wind" = "Wind",
                "Temperature" = "Temp",
				"Ozone")
				
				yaxis
					})
	
	datax <- reactive({	
						
				
				xaxis<-switch(input$xcol,
                "May" = "5",
                "June" = "6",
                "July" = "7",
                "August" = "8",
				"September"="9",
                "5")
				
				xaxis			
					})
					
    observe({
	
			if(input$submit > 0)
			isolate({

	output$test1 <- renderText({
							"Ozone: Mean ozone in parts per billion from 1300 to 1500 hours at Roosevelt Island.\nSolar.R: Solar radiation in Langleys in the frequency band 4000–7700 Angstroms from 0800 to 1200 hours at Central Park.\nWind: Average wind speed in miles per hour at 0700 and 1000 hours at LaGuardia Airport.\nTemp: Maximum daily temperature in degrees Fahrenheit at La Guardia Airport."
	})		
	output$test2 <- renderPlot({
							ggplot(airquality[airquality$Month==datax(),],aes_string(x="Day",y=datay())) + geom_bar(position=position_dodge(), stat="identity", fill="steelblue") + ggtitle(paste("Air quality factor ",datay(),"for New York city for the month of",input$xcol,"and year 1973"))
							
							})
							
						})
			})				
	})
	#renderUI
	#renderText
	#renderPlot
	#renderPrint
	#renderTable
	#renderImage
			
			
