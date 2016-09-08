echo "Cleaning output..."
rm -rf dita-ot*
rm -rf oxygen-webhelp*
rm -rf com.oxygenxml*
rm -rf oxygen_custom*
rm -rf out

echo "Downloading ZIP files..."
wget http://mirror.oxygenxml.com/InstData/Editor/Webhelp/oxygen-webhelp.zip
wget https://github.com/dita-ot/dita-ot/releases/download/2.3.2/dita-ot-2.3.2.zip
unzip oxygen-webhelp.zip 
unzip dita-ot-2.3.2.zip 

cp -R com.oxygenxml.* dita-ot-2.3.2/plugins/
mv dita-ot-2.3.2/plugins/com.oxygenxml.webhelp/plugin_2.x.xml dita-ot-2.3.2/plugins/com.oxygenxml.webhelp/plugin.xml

cd dita-ot-2.3.2/
bin/ant -f integrator.xml 
cd ..

cp licenseKey.txt dita-ot-2.3.2/plugins/com.oxygenxml.webhelp/licensekey.txt

dita-ot-2.3.2/bin/dita -i $DITAMAP -f webhelp-responsive -filter=$DITAVAL
