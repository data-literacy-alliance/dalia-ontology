test:
    uv run tests.py

export:
    robot convert -i MoDalia.ttl -o modalia.obo -v --check=false

WIDOCO_VERSION := "1.4.25"
WIDOCO_JDK_VERSION := "11"

download-widoco:
    # see https://github.com/dgarijo/Widoco/releases/latest
    curl -o widoco-{{ WIDOCO_VERSION }}-jar-with-dependencies_JDK-{{ WIDOCO_JDK_VERSION }}.jar https://github.com/dgarijo/Widoco/releases/download/v{{ WIDOCO_VERSION }}/widoco-{{ WIDOCO_VERSION }}-jar-with-dependencies_JDK-{{ WIDOCO_JDK_VERSION }}.jar

docs:
    java -jar widoco-{{ WIDOCO_VERSION }}-jar-with-dependencies_JDK-{{ WIDOCO_JDK_VERSION }}.jar \
        -ontFile MoDalia.ttl \
        -outFolder public \
        -uniteSections \
        -lang en \
        -noPlaceHolderText \
        -webVowl \
        -rewriteAll \
        -confFile config.properties
    uv run docuReplace.py
