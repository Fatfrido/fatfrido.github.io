---
title: "Create your own static blog with Jekyll and GitHub Pages for free - I"
date: 2022-11-12 09:20:00 +0100
categories: [Jekyll, GitHub Pages, Blog]
author: Fatfrido

toc: true

excerpt: "Part I - The basic setup"
header:
  overlay_color: "#333"
---
# Introduction
As a developer I'm gathering findings and personal thoughts in [Obsidian](https://obsidian.md/) and want to share some of them. With Obsidian Publish there is an option to make the whole vault accessable to the public, but this was not my goal. So I started looking for alternatives that are easy to set up and are based on markdown files to be flexible in the future and avoid the need of a content editing backend. I also wanted to have a solution that is not *embarrassing* for a developer (WordPress was a no-go 😉) without taking a lot of effort to create and maintain.

This was where I stubled upon [GitHub Pages](https://pages.github.com/). There you can host you public static website for free and that was exactly what I needed. Additionally, it supports [Jekyll](https://jekyllrb.com/) which provides additional functionality and makes the website beautiful with free or paid themes.

In this series I'm documenting the creation of this very blog.

# Create GitHub repository
The first step is to create a repository named `<your-username>.github.io` for your GitHub Pages. The whole process is documented very nicely here. In case you don't already have a GitHub account, you can sign up for free. But I just expect to have a rather rechnical audience here, so I think you should already be familiar with GitHub and how to work with it.

When the repository has been created, create a main branch and check it out locally.

In your repository settings enable GitHub Pages:
1. Select `Pages` in the sidebar on the left
2. Under `Build and deployment` set `Source` to `Deploy from a branch`
3. Select `main` for the branch and `/ (root)` for the directory

![Repository configuration](/assets/images/../../../assets/images/posts/blog/part_1/screenshot_repo_settings.png)

# Use Docker for local development
For developing the blog I wanted to use [Docker](https://www.docker.com/) to avoid installing a lot of suff on directly and I'm using it already anyways. Luckily, there is an official image that can just be used.

1. Pull the image: `docker pull jekyll/jekyll`
2. Execute the following to setup Jekyll for the first time:
   ```bash
set site_name=fatside
docker run --rm --volume="%CD%:/srv/jekyll" -it jekyll/jekyll sh -c "chown -R jekyll /usr/gem/ && jekyll new %site_name%" && cd %site_name% && bundle add webrick
   ```
    The contents in your repository should now look like this:
    ![Repository content](/assets/images/posts/blog/part_1/screenshot_repo_content.png)
3. Make sure that all of this content is correctly placed in the root of the repository. Otherwise you need to adapt the settings for the GitHub Pages to not use the root directory.
4. Adapt the contents of `_config.yml` to fit your needs
5. Host the website locally for development by running this command:
   ```bash
docker run --rm --volume="%CD%:/srv/jekyll:Z" --publish [::1]:4000:4000 -p 4000:4000 jekyll/jekyll jekyll serve
   ```
6. Navigate to `localhost:4000` in your browser to see the blog

# Deploy the blog
Now comes the easiest deployment you could ever imagine. Just commit and push your changes and wait for a few minutes. Your website is then available at `https://<your-github-username>.github.io`!

# What's next?
Now that the website is up and running, the next step is to add some content and a nicer theme. I will write about this in future blogs.

# Sources
- [GitHub Pages documentation](https://docs.github.com/en/pages)