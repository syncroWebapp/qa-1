echo "Cleaning output"
rm -rf out
rm -rf out

wget http://mirror.oxygenxml.com/InstData/Editor/Webhelp/oxygen-webhelp.zip
unzip oxygen-webhelp.zip 

wget https://github.com/dita-ot/dita-ot/releases/download/2.3.2/dita-ot-2.3.2.zip
unzip dita-ot-2.3.2.zip 

cp -R com.oxygenxml.* dita-ot-2.3.2/plugins/
mv dita-ot-2.3.2/plugins/com.oxygenxml.webhelp/plugin_2.x.xml dita-ot-2.3.2/plugins/com.oxygenxml.webhelp/plugin.xml

cd dita-ot-2.3.2/
bin/ant -f integrator.xml 
cd ..

cp licenseKey.txt dita-ot-2.3.2/plugins/com.oxygenxml.webhelp/licensekey.txt

REPONAME=`basename $PWD`
PARENTDIR=`dirname $PWD`
USERNAME=`basename $PARENTDIR`

dita-ot-2.3.2/bin/dita -i $DITAMAP -f webhelp-responsive -filter=$DITAVAL
