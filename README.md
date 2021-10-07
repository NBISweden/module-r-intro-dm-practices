# To build this lesson
## Install dependencies
```
conda env update -n name-of-your-env -f environment.yml
conda activate name-of-your-env
gem install bundler
bundle install
```

## Build lesson using make
```
conda activate name-of-your-env
make site
```

## Build episodes using Rscript
```
conda activate name-of-your-env
# Rscript -e "source('bin/generate_md_episodes.R')" _episodes_rmd/{lesson}.Rmd  _episodes/{lesson}.md 
Rscript -e "source('bin/generate_md_episodes.R')" _episodes_rmd/01-introduction.Rmd _episodes/01-introduction.md
```

## Build all episodes using R
```{R}
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

```

## Build all lesson using a one-liner shell command

```
ls _episodes_rmd/*.Rmd | sed 'p;s/_rmd\(..*\).Rmd/\1.md/' | xargs -n2 Rscript -e "source('bin/generate_md_episodes.R')"
```

## Preview lesson locally
```
$ conda activate name-of-your-env
$ bundle exec jekyll serve
```

# FIXME Lesson title

[![Create a Slack Account with us](https://img.shields.io/badge/Create_Slack_Account-The_Carpentries-071159.svg)](https://swc-slack-invite.herokuapp.com/)

This repository generates the corresponding lesson website from [The Carpentries](https://carpentries.org/) repertoire of lessons. 

## Contributing

We welcome all contributions to improve the lesson! Maintainers will do their best to help you if you have any
questions, concerns, or experience any difficulties along the way.

We'd like to ask you to familiarize yourself with our [Contribution Guide](CONTRIBUTING.md) and have a look at
the [more detailed guidelines][lesson-example] on proper formatting, ways to render the lesson locally, and even
how to write new episodes.

Please see the current list of [issues][FIXME] for ideas for contributing to this
repository. For making your contribution, we use the GitHub flow, which is
nicely explained in the chapter [Contributing to a Project](http://git-scm.com/book/en/v2/GitHub-Contributing-to-a-Project) in Pro Git
by Scott Chacon.
Look for the tag ![good_first_issue](https://img.shields.io/badge/-good%20first%20issue-gold.svg). This indicates that the maintainers will welcome a pull request fixing this issue.  


## Maintainer(s)

Current maintainers of this lesson are 

* FIXME
* FIXME
* FIXME


## Authors

A list of contributors to the lesson can be found in [AUTHORS](AUTHORS)

## Citation

To cite this lesson, please consult with [CITATION](CITATION)

[lesson-example]: https://carpentries.github.io/lesson-example
