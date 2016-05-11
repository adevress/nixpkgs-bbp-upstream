source $stdenv/setup

mkdir -p $out/bin
cat > $out/bin/nuke-refs <<EOF
#! $SHELL -e

PREV_LANG=${LANG}
LANG=C
SIZE_STORE=${#NIX_STORE}
LANG=${PREV_LANG}

## create a fake prefix of size NIX_STORE
## but with a known pattern "aaaa"

FAKE_PREFIX="/"
for i in \$( seq 2 \${SIZE_STORE} ); do 
	FAKE_PREFIX="\${FAKE_PREFIX}a";
done


for i in \$*; do
    if test ! -L \$i -a -f \$i; then
        cat \$i | sed "s|$NIX_STORE/[a-z0-9]*-|\${FAKE_PREFIX}/eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee-|g" > \$i.tmp
        if test -x \$i; then chmod +x \$i.tmp; fi
        mv \$i.tmp \$i
    fi
done
EOF
chmod +x $out/bin/nuke-refs
