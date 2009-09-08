From: Angelo <s104259-whZMOeQn8C0@public.gmane.org>
Subject: Question on flash node on device tree source
Date: Tue, 8 Sep 2009 12:18:33 +0000 (GMT)
Message-ID: <859952.87558.qm@web23106.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7446691088279302030=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7446691088279302030==
Content-Type: multipart/alternative; boundary="0-2011298778-1252412313=:87558"

--0-2011298778-1252412313=:87558
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all.

I need some info about device tree blob.
I'm testing a powerpc board (very similar to mpc512xev) with the following =
feature:
=A0- 256MB flash (only 1 bank)

Changes some lines of device tree source about flash

localbus@80000020 {
=A0=A0=A0 =A0=A0=A0 compatible =3D "fsl,mpc5121ads-localbus";
=A0=A0=A0 =A0=A0=A0 #address-cells =3D <2>;
=A0=A0=A0 =A0=A0=A0 #size-cells =3D <1>;
=A0=A0=A0 =A0=A0=A0 reg =3D <0000020 40>;

=A0=A0=A0 =A0=A0=A0 ranges =3D <0 0 fc000000 04000000
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 2 0 82000000 00008000>;

=A0=A0=A0 =A0=A0=A0 flash@0,0 {
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device_type =3D "rom";
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 compatible =3D "direct-mapped";
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 probe-type =3D "CFI";
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 reg =3D <0 0 4000000>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #address-cells =3D <1>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #size-cells =3D <1>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 bank-width =3D <4>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device-width =3D <2>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partitions =3D <00000000 00040000=A0=A0=A0 =
=A0=A0=A0 // first sector is protected
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 00040000 03c00000=
=A0=A0=A0 =A0=A0=A0 // 60 Mb for filesystem
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 03c40000 00280000=
=A0=A0=A0 =A0=A0=A0 // 2.5 Mb for kernel
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 03ec0000 00040000=
=A0=A0=A0 =A0=A0=A0 // one sector for device tree
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0=A0 03f00000 00100000>;=
=A0=A0=A0 // one Mb for u-boot
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partition-names =3D "protected", "filesystem"=
, "kernel", "device-tree", "u-boot";
=A0=A0=A0 =A0=A0=A0 };
.....
with these changes:
.....
=A0=A0=A0 =A0=A0=A0 flash@0,0 {
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device_type =3D "rom";
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 compatible =3D "direct-mapped";
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 probe-type =3D "CFI";
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 reg =3D <0 0 1000000>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #address-cells =3D <1>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 #size-cells =3D <1>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 bank-width =3D <1>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device-width =3D <1>;
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partitions =3D <300000 200000=A0=A0=A0 =A0=A0=
=A0 //uimage
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 400000 3200000>=
;=A0=A0=A0 // fs
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partition-names =3D "uimage", "fs";
=A0=A0=A0 =A0=A0=A0 };
.....

The problem is that on bootstrap stage, kernel truncate the flash memory to=
 16MB, so i cannot access to the whole flash. kernel messages:

mtd: partition "fs" extends=A0 beyond the end of device "60000000.flash" si=
ze truncated to 0xc00000.

I'd like to know if i have to specify into the dtb file the size of flash m=
em. What about nand flash controller and its functionality?=20
If you have more info about this, please write to me.

Thanks in advance,
@s

=0A=0A=0A      
--0-2011298778-1252412313=:87558
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Hi all.<br><br>I need some info about device =
tree blob.<br>I'm testing a powerpc board (very similar to mpc512xev) with =
the following feature:<br>&nbsp;- 256MB flash (only 1 bank)<br><br>Changes =
some lines of device tree source about flash<br><br>localbus@80000020 {<br>=
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; compatible =3D "fsl,mpc5121ads-localb=
us";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #address-cells =3D &lt;2&gt;;=
<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<br>&nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg =3D &lt;0000020 40&gt;;<br><br>&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ranges =3D &lt;0 0 fc000000 04000000<br>&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; 2 0 82000000 =
00008000&gt;;<br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; flash@0,0 {<br>&=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; device_type =3D
 "rom";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; compati=
ble =3D "direct-mapped";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp; probe-type =3D "CFI";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; reg =3D &lt;0 0 4000000&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<br>&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<br=
>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bank-width =3D &l=
t;4&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; device=
-width =3D &lt;2&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; partitions =3D &lt;00000000 00040000&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; // first sector is protected<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00040=
000 03c00000&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // 60 Mb for
 filesystem<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 03c40000 00280000&nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; // 2.5 Mb for kernel<br>&nbsp;&nbsp;&nbsp; &nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 03ec0000 00040000&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // one secto=
r for device tree<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 03f00000 00100000&gt;;=
&nbsp;&nbsp;&nbsp; // one Mb for u-boot<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; partition-names =3D "protected", "filesystem", "ke=
rnel", "device-tree", "u-boot";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; };=
<br>....<br>with these changes:<br>....<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; flash@0,0 {<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; device_type =3D "rom";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp; compatible =3D "direct-mapped";<br>&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; probe-type =3D "CFI";<br>&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg =3D &lt;0 0 1000000&gt;;<br=
>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #address-cells =
=3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
#size-cells =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; bank-width =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; device-width =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; partitions =3D &lt;300000 200000&nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; //uimage<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; 400000 3200000&gt;;&nbsp;&nbsp;&nbsp; // fs<br>&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; partition-names =3D "uimage",
 "fs";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; };<br>....<br><br>The probl=
em is that on bootstrap stage, kernel truncate the flash memory to 16MB, so=
 i cannot access to the whole flash. kernel messages:<br><br>mtd: partition=
 "fs" extends&nbsp; beyond the end of device "60000000.flash" size truncate=
d to 0xc00000.<br><br>I'd like to know if i have to specify into the dtb fi=
le the size of flash mem. What about nand flash controller and its function=
ality? <br>If you have more info about this, please write to me.<br><br>Tha=
nks in advance,<br>@s<br><br></td></tr></table><br>=0A=0A=0A=0A      
--0-2011298778-1252412313=:87558--


--===============7446691088279302030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7446691088279302030==--
