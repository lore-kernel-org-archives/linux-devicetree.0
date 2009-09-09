From: Angelo <s104259-whZMOeQn8C0@public.gmane.org>
Subject: R: Question on flash node on device tree source
Date: Wed, 9 Sep 2009 07:38:34 +0000 (GMT)
Message-ID: <918437.52044.qm@web23104.mail.ird.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2022459606597305903=="
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
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2022459606597305903==
Content-Type: multipart/alternative; boundary="0-807376884-1252481914=:52044"

--0-807376884-1252481914=:52044
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for info!
Ok I have to modify some things, but anyway:
1- dts is an old version (I know that and this isn't a problem because kern=
el is an old version too 2.6.x)
2- The main mistake is that I'm tring to use the NAND flash, but the DTS no=
de that i've modified refers to NOR flash.

So i think that I must modify the following part of code:

=A0=A0=A0 nfc@40000000 {
=A0=A0=A0 =A0=A0=A0 compatible =3D "fsl,mpc5121rev2-nfc";
=A0=A0=A0 =A0=A0=A0 reg =3D <40000000 100000>;=A0=A0=A0 // 1M at 0x40000000
=A0=A0=A0 =A0=A0=A0 interrupts =3D <6 8>;
=A0=A0=A0 =A0=A0=A0 interrupt-parent =3D < &ipic >;
=A0=A0=A0 =A0=A0=A0 #address-cells =3D <1>;
=A0=A0=A0 =A0=A0=A0 #size-cells =3D <1>;
=A0=A0=A0 =A0=A0=A0 bank-width =3D <1>;
=A0=A0=A0 =A0=A0=A0 write-size =3D <800>;
=A0=A0=A0 =A0=A0=A0 spare-size =3D <40>;
=A0=A0=A0 =A0=A0=A0 // ADS has two Hynix 512MB Nand flash chips in a single
=A0=A0=A0 =A0=A0=A0 // stacked package .
=A0=A0=A0 =A0=A0=A0 chips =3D <2>;
=A0=A0=A0 =A0=A0=A0 // UBIFS works fine on large partitions so use all of i=
t
=A0=A0=A0 =A0=A0=A0 nand@0 {
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 label =3D "nand";
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 reg =3D <00000000 40000000>; =A0=A0=A0 // Ent=
ire 1G (512M + 512M)
=A0=A0=A0 =A0=A0=A0 };
=A0=A0=A0 =A0=A0=A0 // JFFS2 really doesn't do large partitions well use UB=
IFS instead
=A0=A0=A0 =A0=A0=A0 //nand0@0 {
=A0=A0=A0 =A0=A0=A0 //=A0=A0=A0 label =3D "nand0";
=A0=A0=A0 =A0=A0=A0 //=A0=A0=A0 reg =3D <00000000 02000000>; =A0=A0=A0 // f=
irst 32 MB of chip 0
=A0=A0=A0 =A0=A0=A0 //};
=A0=A0=A0 =A0=A0=A0 //nand1@20000000 {
=A0=A0=A0 =A0=A0=A0 //=A0=A0=A0 label =3D "nand1";
=A0=A0=A0 =A0=A0=A0 //=A0=A0=A0 reg =3D <20000000 02000000>; =A0=A0=A0 // f=
irst 32 MB of chip 1
=A0=A0=A0 =A0=A0=A0 //};
=A0=A0=A0 };

This part of device tree concern nand flash controller od ads5121ev board.
In your opinion kernel obtains all flash info from device tree? or I must m=
odify some part of kernel code?
It seems like that nand flash controller could mangae two banks of nand fla=
sh:

// JFFS2 really doesn't do large partitions well use UBIFS instead
//nand0@0 {
//=A0=A0=A0 label =3D "nand0";
//=A0=A0=A0 reg =3D <00000000 02000000>; =A0=A0=A0 // first 32 MB of chip 0
 //};
 //nand1@20000000 {
 //=A0=A0=A0 label =3D "nand1";
 //=A0=A0=A0 reg =3D <20000000 02000000>; =A0=A0=A0 // first 32 MB of chip =
1
 //};

What do you think? It could could be an hard work!?

Thanks in advance
@s

--- Mar 8/9/09, Angelo <s104259-whZMOeQn8C0@public.gmane.org> ha scritto:

Da: Angelo <s104259-whZMOeQn8C0@public.gmane.org>
Oggetto: Question on flash node on device tree source
A: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Data: Marted=EC 8 settembre 2009, 14:18

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
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 device_type =3D=0A "rom";
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
=A0=A0=A0 =A0=A0=A0 // 60 Mb for=0A filesystem
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
=A0=A0=A0 =A0=A0=A0=0A =A0=A0=A0 compatible =3D "direct-mapped";
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
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 partition-names =3D "uimage",=0A "fs";
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


=0A=0A=0A=0A      =0A=0A=0A      
--0-807376884-1252481914=:52044
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;"><span>Thanks</span> for info!<br>Ok I have to=
 modify some things, but anyway:<br>1- dts is an old version (I know that a=
nd this isn't a problem because kernel is an old version too 2.6.x)<br>2- T=
he main mistake is that I'm tring to use the NAND flash, but the DTS node t=
hat i've modified refers to NOR flash.<br><br>So i think that I must modify=
 the following part of code:<br><br>&nbsp;&nbsp;&nbsp; nfc@40000000 {<br>&n=
bsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; compatible =3D "fsl,mpc5121rev2-nfc";<b=
r>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg =3D &lt;40000000 100000&gt;;&nb=
sp;&nbsp;&nbsp; // 1M at 0x40000000<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
; interrupts =3D &lt;6 8&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; inte=
rrupt-parent =3D &lt; &amp;ipic &gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; #address-cells =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
#size-cells =3D
 &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bank-width =3D &lt;1&g=
t;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; write-size =3D &lt;800&gt;;<br=
>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; spare-size =3D &lt;40&gt;;<br>&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // ADS has two Hynix 512MB Nand flash chips=
 in a single<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // stacked package .<=
br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; chips =3D &lt;2&gt;;<br>&nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; // UBIFS works fine on large partitions so use =
all of it<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; nand@0 {<br>&nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; label =3D "nand";<br>&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg =3D &lt;00000000 400000=
00&gt;; &nbsp;&nbsp;&nbsp; // Entire 1G (512M + 512M)<br>&nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; };<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // JFFS2 re=
ally doesn't do large partitions well use UBIFS instead<br>&nbsp;&nbsp;&nbs=
p;
 &nbsp;&nbsp;&nbsp; //nand0@0 {<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; //=
&nbsp;&nbsp;&nbsp; label =3D "nand0";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp; //&nbsp;&nbsp;&nbsp; reg =3D &lt;00000000 02000000&gt;; &nbsp;&nbsp;&nb=
sp; // first 32 MB of chip 0<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; //};<=
br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; //nand1@20000000 {<br>&nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp; label =3D "nand1";<br>&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; //&nbsp;&nbsp;&nbsp; reg =3D &lt;20000000 0=
2000000&gt;; &nbsp;&nbsp;&nbsp; // first 32 MB of chip 1<br>&nbsp;&nbsp;&nb=
sp; &nbsp;&nbsp;&nbsp; //};<br>&nbsp;&nbsp;&nbsp; };<br><br>This part of de=
vice tree concern nand flash controller od ads5121ev board.<br>In your opin=
ion kernel obtains all flash info from device tree? or I must modify some p=
art of kernel code?<br>It seems like that nand flash controller could manga=
e two banks of nand flash:<br><br>// JFFS2 really doesn't do large
 partitions well use UBIFS instead<br>//nand0@0 {<br>//&nbsp;&nbsp;&nbsp; l=
abel =3D "nand0";<br>//&nbsp;&nbsp;&nbsp; reg =3D &lt;00000000 02000000&gt;=
; &nbsp;&nbsp;&nbsp; // first 32 MB of chip 0<br> //};<br> //nand1@20000000=
 {<br> //&nbsp;&nbsp;&nbsp; label =3D "nand1";<br> //&nbsp;&nbsp;&nbsp; reg=
 =3D &lt;20000000 02000000&gt;; &nbsp;&nbsp;&nbsp; // first 32 MB of chip 1=
<br> //};<br><br>What do you think? It could could be an hard work!?<br><br=
>Thanks in advance<br>@s<br><br>--- <b>Mar 8/9/09, Angelo <i>&lt;s104259@ya=
hoo.it&gt;</i></b> ha scritto:<br><blockquote style=3D"border-left: 2px sol=
id rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"><br>Da: Angelo &=
lt;s104259-whZMOeQn8C0@public.gmane.org&gt;<br>Oggetto: Question on flash node on device tree s=
ource<br>A: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org<br>Data: Marted=EC 8 settembre 20=
09, 14:18<br><br><div id=3D"yiv1145874053"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"font-family: inherit; font=
-style:
 inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; =
line-height: inherit; font-size-adjust: inherit; font-stretch: inherit;" va=
lign=3D"top">Hi all.<br><br>I need some info about device tree blob.<br>I'm=
 testing a powerpc board (very similar to mpc512xev) with the following fea=
ture:<br>&nbsp;- 256MB flash (only 1 bank)<br><br>Changes some lines of dev=
ice tree source about flash<br><br>localbus@80000020 {<br>&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; compatible =3D "fsl,mpc5121ads-localbus";<br>&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; #address-cells =3D &lt;2&gt;;<br>&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &=
nbsp;&nbsp;&nbsp; reg =3D &lt;0000020 40&gt;;<br><br>&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; ranges =3D &lt;0 0 fc000000 04000000<br>&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; 2 0 82000000 00008000&gt;;<br>=
<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; flash@0,0 {<br>&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; device_type =3D=0A "rom";<br>&nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; compatible =3D "direct-ma=
pped";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; probe-ty=
pe =3D "CFI";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; r=
eg =3D &lt;0 0 4000000&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bank-width =3D &lt;4&gt;;<br>&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; device-width =3D &lt;2&g=
t;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; partitions =
=3D &lt;00000000 00040000&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // first sec=
tor is protected<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00040000 03c00000&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // 60 Mb for=0A filesystem<br>&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 03c40000 00280000&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; /=
/ 2.5 Mb for kernel<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 03ec0000 00040000&nb=
sp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; // one sector for device tree<br>&nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 03f00000 00100000&gt;;&nbsp;&nbsp;&nbsp; // one Mb=
 for u-boot<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; par=
tition-names =3D "protected", "filesystem", "kernel", "device-tree", "u-boo=
t";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; };<br>....<br>with these chang=
es:<br>....<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; flash@0,0 {<br>&nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; device_type =3D "rom";<br=
>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=0A &nbsp;&nbsp;&nbsp; compatible =3D=
 "direct-mapped";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; probe-type =3D "CFI";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp; reg =3D &lt;0 0 1000000&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<br>&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bank-width =3D &lt;1&gt;=
;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; device-width =
=3D &lt;1&gt;;<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
partitions =3D &lt;300000 200000&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; //uim=
age<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 400000 3200000&gt;;&nbsp;&nbs=
p;&nbsp; // fs<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
partition-names =3D "uimage",=0A "fs";<br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; };<br>....<br><br>The problem is that on bootstrap stage, kernel trunc=
ate the flash memory to 16MB, so i cannot access to the whole flash. kernel=
 messages:<br><br>mtd: partition "fs" extends&nbsp; beyond the end of devic=
e "60000000.flash" size truncated to 0xc00000.<br><br>I'd like to know if i=
 have to specify into the dtb file the size of flash mem. What about nand f=
lash controller and its functionality? <br>If you have more info about this=
, please write to me.<br><br>Thanks in advance,<br>@s<br><br></td></tr></tb=
ody></table><br>=0A=0A=0A=0A      </div></blockquote></td></tr></table><br>=
=0A=0A=0A=0A      
--0-807376884-1252481914=:52044--


--===============2022459606597305903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2022459606597305903==--
