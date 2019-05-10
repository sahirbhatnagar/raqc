# Avoir une présence en ligne: Outils pour la diffusion rapide et reproductible de la recherche

Un atelier présenté par [Sahir Bhatnagar](http://sahirbhatnagar.com/) (McGill University) à [R à Québec 2019](http://raquebec.ulaval.ca/).


## Détails

**Date**: Mardi le 14 mai, 2019
**Lieu**: [Salle 3425, au 3e étage du Pavillon Desjardins de l'Université Laval](http://raquebec.ulaval.ca/2019/#_lieu)  
**Matériels**: https://sahirbhatnagar.com/raqc/  


## Apperçu

Avec la taille toujours grandissante des données et la complexité des méthodes nécessaires pour les analyser, la reproductibilité des résultats est nécessaire pour assurer une qualité élevée de recherche scientifique. Parallèlement, la façon dont la recherche est diffusée a également changé. Les serveurs de prépublication électronique, les blogs, GitHub et Twitter sont des plateformes gratuites qui réduisent considérablement le temps de publication, permettant aux chercheurs de partager rapidement des idées, de générer des discussions, de publier du code et de promouvoir leur travail. Dans cet atelier, je présenterai les outils essentiels d'un plan de travail reproductible. À partir d'un ensemble de données brutes, vous apprendrez à structurer vos scripts d'analyse, à créer des documents dynamiques à l'aide de Rmarkdown et à suivre les changements apportés à l'analyse, grâce au contrôle de version avec Git. Par la suite, vous créerai un site Web et publierai vos résultats en ligne sous la forme d'un article de blog. Cet atelier sera 100% interactif. Les participants sont encouragés à apporter leurs propres ordinateurs.


## Comment vous préparer pour l'atelier

Vous devez apporter votre propre ordinateur portable. Il faut aussi installer les logiciels suivants (gratuit)

* [R (version ≥ 3.6.0)](http://cran.r-project.org/)
* [RStudio (version ≥ 1.2.1335)](https://www.rstudio.com/products/rstudio/download/#download)  
* [Git](https://git-scm.com/downloads)
* [Un compte GitHub](https://github.com/)
* [GitKraken](https://www.gitkraken.com/)  
* Les packages `R` suivants:

```R
install.packages("pacman")
pacman::p_load(knitr, rmarkdown, pander, ggplot2, cowplot, drake, glmnet, dplyr, data.table)
pacman::p_load_gh('rstudio/blogdown')
blogdown::install_hugo(force=TRUE)
pacman::p_load_gh("juba/rmdformats")
pacman::p_load_gh('ropensci/drake')
```

* Si vous n'êtes pas familier avec Git et Github, je vous recommande fortement de consulter mon tutorial [GitHub for Data Scientists without the Terminal](http://sahirbhatnagar.com/git4ds/)  



----

## References

### Books

* [Reproducible research with R and RStudio](http://www.amazon.com/exec/obidos/ASIN/1466572841/7210-20)
* [Dynamic documents with R and knitr](http://www.amazon.com/exec/obidos/ASIN/1482203537/7210-20)


### Websites

* [CRAN Reproducible Research Task View](http://cran.r-project.org/web/views/ReproducibleResearch.html)
* [knitr chunk options](http://yihui.name/knitr/options/)
* [Markdown](http://daringfireball.net/projects/markdown/syntax)
* [RMarkdown](http://rmarkdown.rstudio.com/)
* [WYSIWYG editor for markdown](http://socrates.io/)
* [Vanderbilt University](http://biostat.mc.vanderbilt.edu/wiki/Main/KnitrHowto)
* [Jennifer Bryan (UBC)](https://github.com/jennybc/2015-02-23_bryan-fields-talk)
* [Data Science with R by Graham Williams](http://handsondatascience.com/KnitRO.pdf)
* [knitr showcase](http://yihui.name/knitr/demo/showcase/)
* [Karl Broman's Tools for RR](http://kbroman.org/Tools4RR/)
* [Editors for knitr](http://yihui.name/knitr/demo/editors/)
* [What is an R-Project?](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects)

### En fran&ccedil;ais
* [knitr: Produire des documents dynamiques](http://rug.mnhn.fr/semin-r/PDF/semin-R_knitr_PBessonneau_240513.pdf)
* [&Eacute;laboration et conversion de documents avec Markdown et Pandoc](http://enacit1.epfl.ch/markdown-pandoc/)
* [Le langage R Markdown](https://www.france-universite-numerique-mooc.fr/c4x/UPSUD/42001S02/asset/RMarkdown.pdf)
* [Un guide pour bien commencer avec markdown](http://blog.wax-o.com/2014/04/tutoriel-un-guide-pour-bien-commencer-avec-markdown/)


----

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>
