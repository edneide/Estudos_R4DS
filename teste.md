---
title: "Capítulo 3 - Visualização de dados"
author: "Edneide Ramalho"
date: "`r format(Sys.time(), '%d %B, %Y')`"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, message=FALSE)
```

# Pré-requisito

```{r pacotes, warning=FALSE, message=FALSE}
library(tidyverse)
```

# Base de dados

```{r base de dados}
glimpse(mpg)
```

# Gráficos

## Gráfico de dispersão

```{r grafico de dispersão}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy))
```

-   **Fazer exercícios 3.2.4** (<https://r4ds.had.co.nz/data-visualisation.html>)

### Adicionando cores

```{r grafico de dispersão colorido}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy, color = class))
```

```{r}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy), color = "blue")
```

### Alterando o tamanho

```{r}
mpg %>% 
  ggplot() + 
  geom_point(aes(x = displ, y = hwy, size = class))
```

### Alterando a transparência

```{r}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy, alpha = class))
```

### Alterando a forma dos pontos

```{r}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy, shape = class))
```

-   **Fazer os exercícios 3.3.1**

### Facets - Facetas

```{r}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
```

```{r}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)
```

```{r}
mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
```

-   **Fazer exercícios 3.5.1**

# Objetos geométricos

-   Gráfico de dispersão:

```{r}
graf_dispersao <- mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy))
```

-   Gráfico com linha tendência:

```{r}
graf_smooth <- mpg %>% 
  ggplot() +
  geom_smooth(aes(x = displ, y = hwy))
```

-   Juntando vários gráficos:

```{r}
library(patchwork)
graf_dispersao + graf_smooth
```

-   Diferentes tipos de linha:

```{r}
mpg %>% 
  ggplot() +
  geom_smooth(aes(x = displ, y = hwy, linetype = drv))
```

-   Adicionando cor e pontos:

```{r}
mpg %>% 
  ggplot() +
  geom_smooth(aes(x = displ, y = hwy, linetype = drv, color = drv)) +
  geom_point(aes(x = displ, y = hwy, color = drv))
```

-   Tirando o intervalo de confiança:

```{r}
mpg %>% 
  ggplot() +
  geom_smooth(aes(x = displ, y = hwy, linetype = drv, color = drv),
              se = FALSE) +
  geom_point(aes(x = displ, y = hwy, color = drv))
```

-   **Extensões do ggplot2**:

    -   <https://exts.ggplot2.tidyverse.org/gallery/>

-   **Cheatsheet**:

    -   <https://www.rstudio.com/resources/cheatsheets/>

-   3 gráficos diferentes:

```{r}
plot1 <- mpg %>% 
  ggplot() + 
  geom_smooth(aes(x = displ, y = hwy))

plot2 <- mpg %>% 
  ggplot() + 
  geom_smooth(aes(x = displ, y = hwy, group = drv))

plot3 <- mpg %>% 
  ggplot() + 
  geom_smooth(aes(x = displ, y = hwy, color = drv),
              show.legend = FALSE)

plot1 + plot2 + plot3
```

-   Dois mapeamentos:

```{r}
mpg %>% 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()
```

-   Dois mapeamentos diferentes:

```{r}
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE
  )
```

# Transformações Estatísticas
