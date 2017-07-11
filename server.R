library(cowplot)


shinyServer(function (input,output){
  
  
  main_dat <- callModule(domain_server, "domain", dat = tar_dat)
  
  callModule(main_select_server, "main_menu", dat = main_dat)
  
  #het_ind <- callModule(het_server, "het_select")
  uncer_ind <- callModule(uncer_server, "uncer_select")
  main_char_str <- callModule(main_char_str_server, "main_menu", dat = main_dat)
  plot_outcome <- callModule(plot_outcome_server, "p_outcome")
  
  tab_tar_dat <- callModule(league_data_select, "uncer_select", 
                            dat = tar_dat, main_char_str = main_char_str)   
  tab_tot_dat <- callModule(league_data_select, "uncer_select", 
                            dat = tot_dat, main_char_str = main_char_str)
  
  plot_tar_dat <- callModule(plot_data_select, "null", dat = tar_dat, 
                             main_char_str = main_char_str, plot_outcome = plot_outcome)
  plot_tot_dat <- callModule(plot_data_select, "null", dat = tot_dat, 
                             main_char_str = main_char_str, plot_outcome = plot_outcome)
  
  plot_height <- callModule(plot_height_server, "null", plot_dat = plot_tar_dat)
  
  plot_tar_nest <- callModule(plot_nest_server, "null", plot_dat = plot_tar_dat, plot_outcome = plot_outcome) 
  plot_tot_nest <- callModule(plot_nest_server, "null", plot_dat = plot_tot_dat, plot_outcome = plot_outcome) 
  
  callModule(plot_tar_render, "plot_tar", plot_height = plot_height,
             dat = plot_tar_nest)
  callModule(plot_tot_render, "plot_tot",plot_height = plot_height, 
             dat = plot_tot_nest)
  
#  callModule(plot_scatter_server, "plot_cep", plot_dat = plot_tar_dat)
  
  tar_league_table <- callModule(table_server, "null", dat = tab_tar_dat, uncer_ind = uncer_ind)
  tot_league_table <- callModule(table_server, "null", dat = tab_tot_dat, uncer_ind = uncer_ind)
  
  callModule(table_render, "table_tar", tar_league_table)
  callModule(table_render, "table_tot", tot_league_table)
  
  #  callModule(plot_tot_server, id = "plot_tot", plot_dat = plot_tot_dat, plot_outcome = plot_outcome, plot_height = plot_height, theme_league = theme_league)
  #  callModule(plot_scatter_server, id = "plot_cep", dat = tab_tar_dat)
  
})





 






