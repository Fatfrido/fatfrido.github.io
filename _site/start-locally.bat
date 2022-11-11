set site_name=fatside
docker run --rm --volume="%CD%:/srv/jekyll" -it jekyll/jekyll sh -c "jekyll serve"