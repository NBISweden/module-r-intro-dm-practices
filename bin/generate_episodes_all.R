rmd_files <- Sys.glob(file.path(getwd(), '_episodes_rmd', '*.Rmd'))

for (rmd_file_path in rmd_files){
  rmd_file_name <- basename(rmd_file_path)
  episode_name <- substr(rmd_file_name,1,nchar(rmd_file_name)-nchar(".Rmd"))
  md_file_name <- paste(episode_name, '.md', sep="")
  md_file_path <- file.path(getwd(),'_episodes',md_file_name)

  system(
    paste(
      "Rscript -e \"source('bin/generate_md_episodes.R')\" \"", 
      rmd_file_path, 
      "\" \"", 
      md_file_path,
      "\"",
      sep=""
    )
  )
}
