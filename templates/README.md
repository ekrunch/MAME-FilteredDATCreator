# Sample Templates

XSLT template files. These were generated using Gemini but validated manually so as always when using tools to make code... YMMV. The comments are decent though so it should be easy enough to figure out custom templates by looking at the examples here and the DTD in the MAME XML Data.

All of these templates work the same way. First they "include" all nodes, note that the DTD gets stripped from the destination files. This is an XSLT thing and nothing to do with the template.

```xslt
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
```

The second step is to filter out what you don't want. This ends up being a bit weird as you're basically doing a "not" on what you actually want. So if I want just BIOS files, I'm going to lock in on the "isbios" attribute being set to yes and then NOT it. So it'll exclude everything that does not match the filter.

```xslt
<xsl:template match="machine[not(@isbios = 'yes')]"/>
```

### How to use :

- Customize the template files in templates/
  - See the [documentation](templates/README.md)
- Extract or Download the MAME XML file and place it somewhere (I use the dat/ subdirectory for my tests but it doesn't matter)
- Execute the createDats.sh script
  - Example : createDats.sh dat/mame0281.xml
- View output in the output/ directory.
- Import DAT files into your favorite tool (ROMVault, Igir, etc) - Don't forget to set your split/merged settings before organizing ROMs. :)


### Included files and what they do :
| file | purpose | XSL attributes |
| ---- | ------- | -------------- |
| bios.xsl | BIOS Files | /mame/machine/@isbios = "yes" |
| coinop.xsl | Coin Operated Machines | /mame/machine/@coins set and greater than 0 |
| coinop\_parents.xsl | Coin Operated Machines, no clones | /mame/machine/@coins set and greater than 0 and /mame/machine/@cloneof is not set |
| devices.xsl | Devices | ROMs with the /mame/machine/@isdevice = 'yes' |
| driver-status-good.xsl | ROMs with "good" status | /mame/machine/driver/@status = "good" |
| driver-status-good\_parents.xsl | ROMs with "good" status, no clones | /mame/machine/driver/@status = "good" and /mame/machine/@cloneof is not set |
| mechanical.xsl | Mechanical Cabinets | ROMs where the original cabinet had mechanical additions | /mame/machine/@ismechanical = 'yes' |
| mechanical\_parents.xsl | Mechanical Cabinets, no clonse | /mame/machine/@ismechanical = 'yes' and /mame/machine/@cloneof is not set |
| nosl.xsl | No Software Lists | Machines with /mame/machine[softwarelist] elements are excluded |
| parents\_nosl\_nodevices.xsl | No Clones, No Software Lists, No Devices | /mame/machine/@cloneof is not set, no /mame/machine/softwarelist elements are defined, and /mame/machine/@isdevice != 'yes'] |
| parents\_nosl.xsl | No Clones, No Software Lists | /mame/machine/@cloneof is not set, no /mame/machine/softwarelist elements are defined |
| parents.xsl | No Clones | /mame/machine/@cloneof is not set |
| sl.xsl | Software Lists | /mame/machine/softwarelist elements are present |



