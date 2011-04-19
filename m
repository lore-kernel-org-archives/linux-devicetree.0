From: jobhunts02-YDxpq3io04c@public.gmane.org
Subject: Mistake in p2020rdb.dts?
Date: Tue, 19 Apr 2011 00:12:59 -0700
Message-ID: <D1C1C6B1-BA4D-401E-BC13-2681A024825A@aol.com>
Mime-Version: 1.0 (iPhone Mail 8H7)
Content-Type: multipart/mixed; boundary="===============2307067658242403879=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============2307067658242403879==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-2-619954152
Content-Transfer-Encoding: 7bit


--Apple-Mail-2-619954152
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I am running Linux 2.6.32 on a P2020 and am trying to use the kernel=E2=80=99=
s DMA code. So far, I have had no success.  Is there a mistake in linux/arch=
/powerc/boot/dts/p2020rdb.dts?
=20
According to linux/Documentation/powerpc/dts-bindings/fsl/dma.txt, the compa=
tible lists for DMA controllers and the DMA channel nodes should have =E2=80=
=9C2 entries, first is =E2=80=98fsl,CHIP-dma=E2=80=99, where CHIP is the pro=
cessor (mpc8349, mpc8360, etc.) and the second is =E2=80=98fsl,elo-dma.=E2=80=
=99=E2=80=9D  In p2020rdb.dts, the compatible lists for the DMA controller a=
nd the DMA channel nodes are "fsl,eloplus-dma" and "fsl,eloplus-dma-channel,=
" respectively.  Note that each has only one entry.
=20
Should compatible =3D =E2=80=9Cfsl,P2020RDB-dma=E2=80=9D, "fsl,eloplus-dma" =
 for the DMA controllers?, and
Should compatible =3D =E2=80=9Cfsl,P2020RDB-dma=E2=80=9D, " fsl,eloplus-dma-=
channel"  for the DMA channel nodes?
=20
The device tree source for DMA in p2020rdb.dts is:
=20
            dma@c300 {
                  #address-cells =3D <1>;
                  #size-cells =3D <1>;
                  compatible =3D "fsl,eloplus-dma";
                  reg =3D <0xc300 0x4>;
                  ranges =3D <0x0 0xc100 0x200>;
                  cell-index =3D <1>;
                  dma-channel@0 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x0 0x80>;
                        cell-index =3D <0>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <76 2>;
                  };
                  dma-channel@80 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x80 0x80>;
                        cell-index =3D <1>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <77 2>;
                  };
                  dma-channel@100 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x100 0x80>;
                        cell-index =3D <2>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <78 2>;
                  };
                  dma-channel@180 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x180 0x80>;
                        cell-index =3D <3>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <79 2>;
                  };
            };
=20
=20
            dma@21300 {
                  #address-cells =3D <1>;
                  #size-cells =3D <1>;
                  compatible =3D "fsl,eloplus-dma";
                  reg =3D <0x21300 0x4>;
                  ranges =3D <0x0 0x21100 0x200>;
                  cell-index =3D <0>;
                  dma-channel@0 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x0 0x80>;
                        cell-index =3D <0>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <20 2>;
                  };
                  dma-channel@80 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x80 0x80>;
                        cell-index =3D <1>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <21 2>;
                  };
                  dma-channel@100 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x100 0x80>;
                        cell-index =3D <2>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <22 2>;
                  };
                  dma-channel@180 {
                        compatible =3D "fsl,eloplus-dma-channel";
                        reg =3D <0x180 0x80>;
                        cell-index =3D <3>;
                        interrupt-parent =3D <&mpic>;
                        interrupts =3D <23 2>;
                  };
            };
=20
=20=

--Apple-Mail-2-619954152
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body bgcolor=3D"#FFFFFF"><div></div><span class=3D"Apple-style-span" s=
tyle=3D"-webkit-tap-highlight-color: rgba(26, 26, 26, 0.292969); -webkit-com=
position-fill-color: rgba(175, 192, 227, 0.230469); -webkit-composition-fram=
e-color: rgba(77, 128, 180, 0.230469); font-size: medium; "><p class=3D"MsoN=
ormal" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt;=
 margin-left: 0in; font-size: 12pt; font-family: 'Times New Roman', serif; "=
><span style=3D"font-size: 10pt; font-family: 'Courier New'; ">I am running L=
inux 2.6.32 on a P2020 and am trying to use the kernel=E2=80=99s DMA code. S=
o far, I have had no success.&nbsp; Is there a mistake in linux/arch/powerc/=
boot/dts/p2020rdb.dts?<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"=
margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0i=
n; font-size: 12pt; font-family: 'Times New Roman', serif; "><span style=3D"=
font-size: 10pt; font-family: 'Courier New'; "><o:p>&nbsp;</o:p></span></p><=
p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin=
-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier N=
ew'; ">According to linux/Documentation/powerpc/dts-bindings/fsl/dma.txt, th=
e compatible lists for DMA controllers and the DMA channel nodes should have=
 =E2=80=9C2 entries, first is =E2=80=98fsl,CHIP-dma=E2=80=99, where CHIP is t=
he processor (mpc8349, mpc8360, etc.) and the second is =E2=80=98fsl,elo-dma=
.=E2=80=99=E2=80=9D&nbsp; In p2020rdb.dts, the compatible lists for the DMA c=
ontroller and the DMA channel nodes are "fsl,eloplus-dma" and "fsl,eloplus-d=
ma-channel," respectively.&nbsp; Note that each has only one entry.<o:p></o:=
p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in;=
 margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'C=
ourier New'; "><o:p>&nbsp;</o:p></p><p class=3D"MsoPlainText" style=3D"margi=
n-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; fo=
nt-size: 10pt; font-family: 'Courier New'; ">Should compatible =3D =E2=80=9C=
fsl,P2020RDB-dma=E2=80=9D, "fsl,eloplus-dma"&nbsp; for the DMA controllers?,=
 and<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margi=
n-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; fo=
nt-family: 'Courier New'; ">Should compatible =3D =E2=80=9Cfsl,P2020RDB-dma=E2=
=80=9D, " fsl,eloplus-dma-channel"&nbsp; for the DMA channel nodes?<o:p></o:=
p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in;=
 margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'C=
ourier New'; "><o:p>&nbsp;</o:p></p><p class=3D"MsoPlainText" style=3D"margi=
n-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; fo=
nt-size: 10pt; font-family: 'Courier New'; ">The device tree source for DMA i=
n p2020rdb.dts is:<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-t=
op: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-=
size: 10pt; font-family: 'Courier New'; "><o:p>&nbsp;</o:p></p><p class=3D"M=
soPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0=
001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma@c300 {<o:=
p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right=
: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-fami=
ly: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;=
;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-r=
ight: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-=
family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &lt;1&gt=
;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-=
right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font=
-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D "fsl,elo=
plus-dma";<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in;=
 margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10=
pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0xc=
300 0x4&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0i=
n; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 1=
0pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ranges =3D &lt=
;0x0 0xc100 0x200&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"marg=
in-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; f=
ont-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cel=
l-index =3D &lt;1&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"marg=
in-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; f=
ont-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma=
-channel@0 {<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0i=
n; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 1=
0pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; compatible =3D "fsl,eloplus-dma-channel";<o:p></o:p></=
p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; mar=
gin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Couri=
er New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
g =3D &lt;0x0 0x80&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"mar=
gin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; f=
ont-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cell-index =3D &lt;0&gt;;<o:p></o:p></p><p c=
lass=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bo=
ttom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New=
'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrup=
t-parent =3D &lt;&amp;mpic&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" styl=
e=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-lef=
t: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts =3D &lt;76 2&gt;;<o:p><=
/o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0=
in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family:=
 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></p><p class=3D"Ms=
oPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.00=
01pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dma-channel@80 {<o:p></o:p></p><p class=3D"MsoPlainTex=
t" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; mar=
gin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D "fsl,eloplus=
-dma-channel";<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0=
in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size:=
 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x80 0x80&gt;;<o:p></o:p></p><p class=3D=
"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0=
.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cell-index =3D &=
lt;1&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; m=
argin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt=
; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&amp;mpic&gt;;<o:p></o:p></p><p c=
lass=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bo=
ttom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New=
'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrup=
ts =3D &lt;77 2&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin=
-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; fon=
t-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:=
p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right=
: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-fami=
ly: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma-channel@100 {<o:p></o:p>=
</p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; m=
argin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Cou=
rier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c=
ompatible =3D "fsl,eloplus-dma-channel";<o:p></o:p></p><p class=3D"MsoPlainT=
ext" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; m=
argin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x100 0x80&gt=
;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-=
right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font=
-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; cell-index =3D &lt;2&gt;;<o:p></o:p></p><p class=3D"MsoPlainTex=
t" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; mar=
gin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&a=
mp;mpic&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0i=
n; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 1=
0pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; interrupts =3D &lt;78 2&gt;;<o:p></o:p></p><p class=3D=
"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0=
.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></p><p class=3D"MsoPlainText" style=3D=
"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0=
in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; dma-channel@180 {<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-=
top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font=
-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D "fsl,eloplus-dma-channel";<o:p>=
</o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0=
in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family:=
 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; reg =3D &lt;0x180 0x80&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" sty=
le=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-le=
ft: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cell-index =3D &lt;3&gt;;<o:p></o=
:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in=
; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: '=
Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; interrupt-parent =3D &lt;&amp;mpic&gt;;<o:p></o:p></p><p class=3D"MsoPlai=
nText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt;=
 margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts =3D &lt;79 2=
&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; marg=
in-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; f=
ont-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></p><p c=
lass=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bo=
ttom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New=
'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o=
:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-righ=
t: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-fam=
ily: 'Courier New'; "><o:p>&nbsp;</o:p></p><p class=3D"MsoPlainText" style=3D=
"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0=
in; font-size: 10pt; font-family: 'Courier New'; "><o:p>&nbsp;</o:p></p><p c=
lass=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bo=
ttom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New=
'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma@=
21300 {<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; ma=
rgin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt;=
 font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #address-cells =3D=
 &lt;1&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in=
; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 1=
0pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D=
 &lt;1&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in=
; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 1=
0pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D=
 "fsl,eloplus-dma";<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-=
top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font=
-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D=
 &lt;0x21300 0x4&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margi=
n-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; fo=
nt-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rang=
es =3D &lt;0x0 0x21100 0x200&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" st=
yle=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-l=
eft: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; cell-index =3D &lt;0&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" st=
yle=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-l=
eft: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dma-channel@0 {<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"mar=
gin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; f=
ont-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D "fsl,eloplus-dma-channel";<o=
:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-righ=
t: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-fam=
ily: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; reg =3D &lt;0x0 0x80&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" s=
tyle=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-=
left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cell-index =3D &lt;0&gt;;<o:p><=
/o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0=
in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family:=
 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; interrupt-parent =3D &lt;&amp;mpic&gt;;<o:p></o:p></p><p class=3D"MsoPl=
ainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001p=
t; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts =3D &lt;20=
 2&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; ma=
rgin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt;=
 font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></p><=
p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin=
-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier N=
ew'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma-channel@80 {<o:p></o:p></p><p class=3D=
"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0=
.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D "=
fsl,eloplus-dma-channel";<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"m=
argin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in=
; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x80 0x80&gt;;<o:p></o:p></p=
><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; marg=
in-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courie=
r New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cel=
l-index =3D &lt;1&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"marg=
in-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; f=
ont-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&amp;mpic&gt;;<o:p=
></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right:=
 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-famil=
y: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; interrupts =3D &lt;21 2&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" s=
tyle=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-=
left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; };<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in=
; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 1=
0pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma-channel@10=
0 {<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin=
-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; fon=
t-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; compatible =3D "fsl,eloplus-dma-channel";<o:p></o:p></p><p cla=
ss=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bott=
om: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New';=
 ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &l=
t;0x100 0x80&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-to=
p: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-s=
ize: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; cell-index =3D &lt;2&gt;;<o:p></o:p></p><p class=
=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom=
: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; "=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-pa=
rent =3D &lt;&amp;mpic&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D=
"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0=
in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts =3D &lt;22 2&gt;;<o:p></o:p=
></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; m=
argin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Cou=
rier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></p><p class=3D"MsoPlai=
nText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt;=
 margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dma-channel@180 {<o:p></o:p></p><p class=3D"MsoPlainText" s=
tyle=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-=
left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D "fsl,eloplus-dma=
-channel";<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in;=
 margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10=
pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x180 0x80&gt;;<o:p></o:p></p><p class=3D"M=
soPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0=
001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New'; ">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cell-index =3D &l=
t;3&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; m=
argin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt=
; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; interrupt-parent =3D &lt;&amp;mpic&gt;;<o:p></o:p></p><p c=
lass=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right: 0in; margin-bo=
ttom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-family: 'Courier New=
'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrup=
ts =3D &lt;23 2&gt;;<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin=
-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; fon=
t-size: 10pt; font-family: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:=
p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0in; margin-right=
: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size: 10pt; font-fami=
ly: 'Courier New'; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; };<o:p></o:p></p><p class=3D"MsoPlainText" style=3D"margin-top: 0=
in; margin-right: 0in; margin-bottom: 0.0001pt; margin-left: 0in; font-size:=
 10pt; font-family: 'Courier New'; "><o:p>&nbsp;</o:p></p><p class=3D"MsoNor=
mal" style=3D"margin-top: 0in; margin-right: 0in; margin-bottom: 0.0001pt; m=
argin-left: 0in; font-size: 12pt; font-family: 'Times New Roman', serif; "><=
span style=3D"font-size: 11pt; font-family: Calibri, sans-serif; "><o:p>&nbs=
p;</o:p></span></p></span></body></html>=

--Apple-Mail-2-619954152--

--===============2307067658242403879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2307067658242403879==--
