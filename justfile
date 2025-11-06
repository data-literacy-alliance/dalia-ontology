test:
    uv run tests.py

export:
    # before running this, you need to manually remove the blank
    # prefix entry from TTL and replace it with modalia:
    robot convert -i MoDalia.ttl -o modalia.obo -v --check=false
    robot convert -i MoDalia.ttl -o modalia.owl -v --check=false
    robot convert -i MoDalia.ttl -o modalia.ofn -v --check=false

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
