###################################################
# R Script to Summarize Data                      #
# Lab Meeting                                     #
# 19 January 2018                                 #
###################################################


# Today we will be exploring data, making preliminary figures, and using github and markdown


# Git and Github intro

# Git is an open source version control system often used for coding. It allows you to see and access previous versions of a file - super useful for coding when you often change and rewrite lines

# Github in an online platform that uses Git, which allows you to remotely store your projects and colloborate with others

# To set up a git directory
  
  ## Git and R use different syntax. For example, to find out your directory in R you would use the command getwd(), in Git we use pwd

  ## Some useful Git commands are 
          # pwd = working directory     [ getwd() in R ]
          # cd  = change directory      [ setwd() in R ]
          # ls  = list files            [ list.files() in R ]
          # mkdir = make new directory  [ dir.create() in R ]
          # clean = clear               [ rm(list = ls()) in R ]

# Let's go ahead and set up git on our computers using terminal if you have a Mac and gitbash if you have a PC
    
  # Set up account

    # $ git config --global user.name "xx"    ## username
    # $ git config --global user.email "xx"   ## email

  # Create a repo

    # $ pwd               ## find current directory 
    # $ cd Documents      ## change directory 
    # $ mkdir SorteLab    ## make a new directory 
    # $ cd SorteLab       ## change directory
    # $ git init          ## make SorteLab a repo
    # $ git status        ## check the status of your new repo


# Now let's look at some data summary statistics in our repo

# Set working directory to our repo

getwd()
setwd("/Users/Piper/Documents/SorteLab")


# Read in Data (always make sure your data are in long-form)

Data <- read.csv("Quadrats.csv")

# We can use base functions to summarize data

      mean(Data$Algae)  # mean of algae
      sd(Data$Mytilus)  # standard deviation of Mytilus
      
      mean(Data$Algae[Data$Site=="Scripps"]) # subset by site
      mean(Data$Algae[Data$TH=="Low"]) # subset by tide height 
      
# Not very useful if we want to look at summary statistics of different factors... we can use the package dplyr for that!
      
      install.packages("plyr")  #install the package
      library("plyr")

# Now let's look at the data by site and TH
      
      Summary <- ddply(Data, c("Site", "TH"), summarize,
                         Mean.rock = mean(Rock), # mean
                         Mean.algae = mean(Algae), # mean
                         Mean.mytilus = mean(Mytilus), # mean
                         Mean.cb = mean(ChthmBal), # mean
                         Mean.ts = mean(TetraSemi), # mean
                         Mean.pol = mean(Pollicipes), # mean 
                         Mean.anem = mean(Anemone), # mean
                         N = sum(Rock), # sample size
                         SE.algae = sd(Algae)/sqrt(N), # standard error
                         SE.mytilus = sd(Mytilus)/sqrt(N), # standard error
                         SE.cb = sd(ChthmBal)/sqrt(N), # standard error
                         SE.ts = sd(TetraSemi)/sqrt(N), # standard error
                         SE.pol = sd(Pollicipes)/sqrt(N), # standard error
                         SE.anem = sd(Anemone)/sqrt(N) # standard error
                         )      
      
      
# Data exploration figures 

## Now let's make some figures to see if there are any patterns

     plot(Summary$TH, Summary$Mean.mytilus) # boxplot
     plot(Summary$Mean.mytilus, Summary$Mean.cb) # scatterplot
     hist(Summary$Mean.rock) # histogram
     hist(Summary$Mean.algae[Summary$TH=="Low"])
     
     
# Now we're going to save our changes and push to our repo on githib  
     # git status
     # git add .
     # git commit 
          ## This will open a dialog box. Type i to write a message about the changes you've made, esc to exit, and :wq to save and close the box


# Create a repo on Github that you'll push your local repo to, you now have a project on github!
     
     # git remote add origin ____________________________
     # git push -u origin master

# The last step is to create a readme file that explains what your project is
     
     
########################################################
# R Resources 
    # Websites and programs
      # Stackoverflow and google
      # https://google.github.io/styleguide/Rguide.xml
      # http://swirlstats.com/
      # https://www.jaredknowles.com/r-bootcamp/
      # http://www.grappa.univ-lille3.fr/~mary/cours/stats/centrale/rexercises.pdf
     
    # Books
      # Introduction to Probability and Statistics Using R by Jay Kerns
      # R Cookbook by Paul Teetor
      # The R Book by Michael Crawley
     
     
# Resources for Git/Github
     # https://guides.github.com/activities/hello-world/
     # https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners
     # https://swcarpentry.github.io/git-novice/
     # Emojis: https://www.webpagefx.com/tools/emoji-cheat-sheet/
       