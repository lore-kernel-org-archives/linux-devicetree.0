From: "Kumar Amarjit" <amarjit.kumar-7K+nh26gSkEAvxtiuMwx3w@public.gmane.org>
Subject: Writing Device Tree Source (DTS)
Date: Mon, 23 Nov 2009 14:27:44 +0530
Message-ID: <200911230858.nAN8vsWf006884@arlmailha04.patni.com>
Reply-To: amarjit.kumar-7K+nh26gSkEAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6046502036854505758=="
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: amarjit.kumar.mtech-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

--===============6046502036854505758==
Content-Type: multipart/related;
	boundary="----=_NextPart_000_0035_01CA6C49.1F917800"

This is a multi-part message in MIME format.

------=_NextPart_000_0035_01CA6C49.1F917800
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0036_01CA6C49.1F917800"


------=_NextPart_001_0036_01CA6C49.1F917800
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi All,
We are using PowerPc440 core on our Soc that consists of PCIe core, SAS core
and many other things.
We are writing DTS for our board to be used during booting, we have gone
through various dts files available inside the Linux Kernel 2.6.31.
Our board is closets match with Taishan board.
While referring the Taishan.dts, we are unable to get the information
regarding Interrupt-map and interrupt-map-mask property.
Please refer to the snippet.......
It would be great if anybody help me to understand the way they are writing
these properties?
I also gone through the DTS document booting-without-of but that does not
help us, so anybody having any documents on How To Write DTS can help me
out.
 
PCIX0: pci@20ec00000 {
   device_type = "pci";
   #interrupt-cells = <1>;
   #size-cells = <2>;
   #address-cells = <3>;
   compatible = "ibm,plb440gp-pcix", "ibm,plb-pcix";
   primary;
   large-inbound-windows;
   enable-msi-hole;
   reg = <0x00000002 0x0ec00000   0x00000008 /* Config space access */
          0x00000000 0x00000000 0x00000000  /* no IACK cycles */
          0x00000002 0x0ed00000   0x00000004   /* Special cycles */
          0x00000002 0x0ec80000 0x00000100 /* Internal registers */
          0x00000002 0x0ec80100  0x000000fc>; /* Internal messaging
registers */
 
   /* Outbound ranges, one memory and one IO,
    * later cannot be changed
    */
   ranges = <0x02000000 0x00000000 0x80000000 0x00000003 0x80000000
0x00000000 0x80000000
      0x01000000 0x00000000 0x00000000 0x00000002 0x08000000 0x00000000
0x00010000>;
 
   /* Inbound 2GB range starting at 0 */
   dma-ranges = <0x42000000 0x0 0x0 0x0 0x0 0x0 0x80000000>;
 
   interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
   interrupt-map = <
    /* IDSEL 1 */
    0x800 0x0 0x0 0x1 &UIC0 0x17 0x8
    0x800 0x0 0x0 0x2 &UIC0 0x18 0x8
    0x800 0x0 0x0 0x3 &UIC0 0x19 0x8
    0x800 0x0 0x0 0x4 &UIC0 0x1a 0x8
 
    /* IDSEL 2 */
    0x1000 0x0 0x0 0x1 &UIC0 0x18 0x8
    0x1000 0x0 0x0 0x2 &UIC0 0x19 0x8
    0x1000 0x0 0x0 0x3 &UIC0 0x1a 0x8
    0x1000 0x0 0x0 0x4 &UIC0 0x17 0x8
   >;
  };
 

Thanks & Regards,

 Kumar Amarjit

 

 Software Engineer,

 Product Engineering Services,

 Patni Computer Systems Ltd.

( Mobile: 09320551382  | (Office: +91-2239174127 

(Extn:-4127

 

_____________________________________________________________________ 

This e-mail message may contain proprietary, confidential or legally privileged information for the sole use of the person or entity to whom this message was originally addressed. Any review, e-transmission dissemination or other use of or taking of any action in reliance upon this information by persons or entities other than the intended recipient is prohibited. If you have received this e-mail in error kindly delete this e-mail from your records. If it appears that this mail has been forwarded to you without proper authority, please notify us immediately at netadmin-7K+nh26gSkEAvxtiuMwx3w@public.gmane.org and delete this mail.
_____________________________________________________________________

------=_NextPart_001_0036_01CA6C49.1F917800
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.3603" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>Hi 
All,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>We are usi=
ng 
PowerPc440 core on our Soc that consists of PCIe core, SAS core and many oth=
er 
things.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>We are wri=
ting DTS 
for our board to be used during booting, we have gone through various dts fi=
les 
available inside the Linux Kernel 2.6.31.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>Our board=
 is closets 
match with Taishan board.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>While refe=
rring the 
Taishan.dts, we are unable to get the information regarding Interrupt-map an=
d 
interrupt-map-mask property.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>Please ref=
er to the 
snippet.......</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>It would b=
e great if 
anybody help me to understand the way they are writing these 
properties?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>I also gon=
e through 
the DTS document <STRONG>booting-without-of</STRONG> but that does not help=
 us, 
so anybody having any documents on <FONT color=3D#008000><STRONG>How To Writ=
e 
DTS</STRONG> <FONT color=3D#000000>can help me 
out.</FONT></FONT></SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN 
class=3D726193808-23112009></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>PCIX0: <A=
 
href=3D"mailto:pci@20ec00000">pci@20ec00000</A> {<BR>&nbsp;&nbsp;&nbsp;devic=
e_type 
=3D "pci";<BR>&nbsp;&nbsp;&nbsp;#interrupt-cells =3D 
&lt;1&gt;;<BR>&nbsp;&nbsp;&nbsp;#size-cells =3D 
&lt;2&gt;;<BR>&nbsp;&nbsp;&nbsp;#address-cells =3D 
&lt;3&gt;;<BR>&nbsp;&nbsp;&nbsp;compatible =3D "ibm,plb440gp-pcix", 
"ibm,plb-pcix";<BR>&nbsp;&nbsp;&nbsp;primary;<BR>&nbsp;&nbsp;&nbsp;large-inb=
ound-windows;<BR>&nbsp;&nbsp;&nbsp;enable-msi-hole;<BR>&nbsp;&nbsp;&nbsp;reg=
 
=3D &lt;0x00000002 0x0ec00000&nbsp;&nbsp; 0x00000008&nbsp;/* Config space ac=
cess 
*/<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000000 
0x00000000 0x00000000&nbsp;&nbsp;/* no IACK cycles 
*/<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000002 
0x0ed00000&nbsp;&nbsp; 0x00000004&nbsp;&nbsp; /* Special cycles 
*/<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000002 
0x0ec80000 0x00000100&nbsp;/* Internal registers 
*/<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000002 
0x0ec80100&nbsp; 0x000000fc&gt;;&nbsp;/* Internal messaging registers 
*/</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>&nbsp;&nbs=
p;&nbsp;/* 
Outbound ranges, one memory and one IO,<BR>&nbsp;&nbsp;&nbsp; * later cannot=
 be 
changed<BR>&nbsp;&nbsp;&nbsp; */<BR>&nbsp;&nbsp;&nbsp;ranges =3D &lt;0x02000=
000 
0x00000000 0x80000000 0x00000003 0x80000000 0x00000000 
0x80000000<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01000000 0x00000000 0x0000000=
0 
0x00000002 0x08000000 0x00000000 0x00010000&gt;;</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>&nbsp;&nbs=
p;&nbsp;/* 
Inbound 2GB range starting at 0 */<BR>&nbsp;&nbsp;&nbsp;dma-ranges =3D 
&lt;0x42000000 0x0 0x0 0x0 0x0 0x0 0x80000000&gt;;</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009>&nbsp;&nbs=
p;<FONT 
color=3D#ff0000>&nbsp;interrupt-map-mask =3D &lt;0xf800 0x0 0x0 
0x7&gt;;<BR>&nbsp;&nbsp;&nbsp;interrupt-map =3D &lt;<BR>&nbsp;&nbsp;&nbsp;&n=
bsp;/* 
IDSEL 1 */<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x800 0x0 0x0 0x1 &amp;UIC0 0x17 
0x8<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x800 0x0 0x0 0x2 &amp;UIC0 0x18 
0x8<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x800 0x0 0x0 0x3 &amp;UIC0 0x19 
0x8<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x800 0x0 0x0 0x4 &amp;UIC0 0x1a 
0x8</FONT></SPAN></FONT></DIV>
<DIV><FONT color=3D#ff0000></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D726193808-23112009><FONT 
color=3D#ff0000>&nbsp;&nbsp;&nbsp;&nbsp;/* IDSEL 2 
*/<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x1000 0x0 0x0 0x1 &amp;UIC0 0x18 
0x8<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x1000 0x0 0x0 0x2 &amp;UIC0 0x19 
0x8<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x1000 0x0 0x0 0x3 &amp;UIC0 0x1a 
0x8<BR>&nbsp;&nbsp;&nbsp;&nbsp;0x1000 0x0 0x0 0x4 &amp;UIC0 0x17 
0x8<BR>&nbsp;&nbsp;&nbsp;&gt;;<BR></FONT>&nbsp;&nbsp;};</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV><?xml:namespace prefix =3D o ns =3D 
"urn:schemas-microsoft-com:office:office" /><o:SmartTagType name=3D"City" 
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagType=
><o:SmartTagType 
name=3D"place" 
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTagType=
>
<OBJECT id=3Dieooui classid=3Dclsid:38481807-CA0E-42D2-BF39-B33AF135CC4D></O=
BJECT>
<STYLE>st1\:* {
	BEHAVIOR: url(#ieooui)
}
</STYLE>

<STYLE>@font-face {
	font-family: Wingdings;
}
@font-face {
	font-family: Trebuchet MS;
}
@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.25in 1.0in 1.25in; mso-h=
eader-margin: .5in; mso-footer-margin: .5in; mso-paper-source: 0; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; mso-s=
tyle-parent: ""; mso-pagination: widow-orphan; mso-fareast-font-family: "Tim=
es New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; mso-s=
tyle-parent: ""; mso-pagination: widow-orphan; mso-fareast-font-family: "Tim=
es New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; mso-s=
tyle-parent: ""; mso-pagination: widow-orphan; mso-fareast-font-family: "Tim=
es New Roman"
}
DIV.Section1 {
	page: Section1
}
</STYLE>

<DIV class=3DSection1>
<P class=3DMsoNormal align=3Dleft><SPAN 
style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: 'Trebuchet MS'; mso-bid=
i-font-weight: bold; mso-no-proof: yes">Thanks 
&amp; Regards,<o:p></o:p></SPAN></P>
<P class=3DMsoNormal><B><SPAN 
style=3D"FONT-SIZE: 7.5pt; COLOR: black; FONT-FAMILY: 'Trebuchet MS'; mso-no=
-proof: yes">&nbsp;</SPAN></B><B><SPAN 
style=3D"COLOR: black; FONT-FAMILY: 'Trebuchet MS'; mso-no-proof: yes">Kumar=
 
Amarjit</SPAN></B><B><SPAN 
style=3D"COLOR: #993366; FONT-FAMILY: 'Trebuchet MS'; mso-no-proof: yes"><o:=
p></o:p></SPAN></B></P>
<P class=3DMsoNormal><B><SPAN 
style=3D"FONT-SIZE: 7.5pt; COLOR: black; FONT-FAMILY: 'Trebuchet MS'; mso-no=
-proof: yes"><SPAN 
style=3D"mso-spacerun: yes">&nbsp;</SPAN></SPAN></B><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: 'Trebuchet MS'; mso-no-pr=
oof: yes"><IMG 
alt=3D"" hspace=3D0 src=3D"cid:726193808@23112009-0EBC" align=3Dbaseline 
border=3D0></SPAN></P>
<P class=3DMsoNormal><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: 'Trebuchet MS'; mso-no-pr=
oof: yes"><SPAN 
style=3D"FONT-SIZE: 7.5pt; COLOR: black; FONT-FAMILY: 'Trebuchet MS'; mso-bi=
di-font-weight: bold; mso-no-proof: yes">&nbsp;Software 
Engineer,</SPAN><SPAN 
style=3D"FONT-SIZE: 10pt; COLOR: #993366; FONT-FAMILY: 'Trebuchet MS'; mso-b=
idi-font-weight: bold; mso-no-proof: yes"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal><SPAN 
style=3D"FONT-SIZE: 10pt; COLOR: #993366; FONT-FAMILY: 'Trebuchet MS'; mso-b=
idi-font-weight: bold; mso-no-proof: yes"><SPAN 
style=3D"mso-spacerun: yes">&nbsp;</SPAN></SPAN><SPAN 
style=3D"FONT-SIZE: 7.5pt; COLOR: black; FONT-FAMILY: 'Trebuchet MS'; mso-bi=
di-font-weight: bold; mso-no-proof: yes">Product 
Engineering Services,</SPAN><SPAN 
style=3D"FONT-SIZE: 10pt; COLOR: #993366; FONT-FAMILY: 'Trebuchet MS'; mso-b=
idi-font-weight: bold; mso-no-proof: yes"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal><SPAN 
style=3D"FONT-SIZE: 10pt; COLOR: #993366; FONT-FAMILY: 'Trebuchet MS'; mso-b=
idi-font-weight: bold; mso-no-proof: yes"><SPAN 
style=3D"mso-spacerun: yes">&nbsp;</SPAN></SPAN><SPAN 
style=3D"FONT-SIZE: 7.5pt; COLOR: black; FONT-FAMILY: 'Trebuchet MS'; mso-bi=
di-font-weight: bold; mso-no-proof: yes">Patni 
Computer Systems Ltd.</SPAN><SPAN 
style=3D"FONT-SIZE: 10pt; COLOR: #993366; FONT-FAMILY: 'Trebuchet MS'; mso-b=
idi-font-weight: bold; mso-no-proof: yes"><o:p></o:p></SPAN></P>
<P class=3DMsoNormal><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: Wingdings; mso-no-proof:=
 yes">(</SPAN><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: 'Trebuchet MS'; mso-no-pr=
oof: yes">&nbsp;<?xml:namespace 
prefix =3D st1 ns =3D "urn:schemas-microsoft-com:office:smarttags" /><st1:pl=
ace 
w:st=3D"on"><st1:City w:st=3D"on">Mobile</st1:City></st1:place>: </SPAN><SPA=
N 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: Arial; mso-no-proof: yes"=
>09320551382&nbsp;&nbsp;| 
</SPAN><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: Wingdings; mso-no-proof:=
 yes">(</SPAN><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: 'Trebuchet MS'; mso-no-pr=
oof: yes">Office: 
</SPAN><SPAN 
style=3D"FONT-SIZE: 10pt; COLOR: gray; FONT-FAMILY: 'Trebuchet MS'; mso-no-p=
roof: yes">+91<SPAN 
class=3D726193808-23112009>-</SPAN>2239174127</SPAN><SPAN 
style=3D"COLOR: navy; mso-no-proof: yes">&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: Wingdings; mso-no-proof:=
 yes">(</SPAN><SPAN 
style=3D"FONT-SIZE: 8pt; COLOR: gray; FONT-FAMILY: 'Trebuchet MS'; mso-no-pr=
oof: yes">Extn:-4127</SPAN></P></SPAN></DIV>
<DIV>&nbsp;</DIV>___________________________________________________________=
__________ =0A=
<br> <br>=0A=
This e-mail message may contain proprietary, confidential or legally privile=
ged information for the sole use of the person or entity to whom this messag=
e was originally addressed. Any review, e-transmission dissemination or othe=
r use of or taking of any action in reliance upon this information by person=
s or entities other than the intended recipient is prohibited. If you have r=
eceived this e-mail in error kindly delete this e-mail from your records. If=
 it appears that this mail has been forwarded to you without proper authorit=
y, please notify us immediately at netadmin-7K+nh26gSkEAvxtiuMwx3w@public.gmane.org and delete this mail.=
 <br>=0A=
_____________________________________________________________________
</BODY></HTML>

------=_NextPart_001_0036_01CA6C49.1F917800--

------=_NextPart_000_0035_01CA6C49.1F917800
Content-Type: image/jpeg;
	name="SCSP_CSP_2008_edit.JPG"
Content-Transfer-Encoding: base64
Content-ID: <726193808@23112009-0EBC>

/9j/4AAQSkZJRgABAQEAYABgAAD/7RcwUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAAAccAgAAAgAC
ADhCSU0EJQAAAAAAEEYM8okmuFbasJwBobCnkHc4QklNA+0AAAAAABAAyAAAAAEAAQDIAAAAAQAB
OEJJTQQmAAAAAAAOAAAAAAAAAAAAAD+AAAA4QklNBA0AAAAAAAQAAAAeOEJJTQQZAAAAAAAEAAAA
HjhCSU0D8wAAAAAACQAAAAAAAAAAAQA4QklNBAoAAAAAAAEAADhCSU0nEAAAAAAACgABAAAAAAAA
AAI4QklNA/UAAAAAAEgAL2ZmAAEAbGZmAAYAAAAAAAEAL2ZmAAEAoZmaAAYAAAAAAAEAMgAAAAEA
WgAAAAYAAAAAAAEANQAAAAEALQAAAAYAAAAAAAE4QklNA/gAAAAAAHAAAP//////////////////
//////////8D6AAAAAD/////////////////////////////A+gAAAAA////////////////////
/////////wPoAAAAAP////////////////////////////8D6AAAOEJJTQQAAAAAAAACAAA4QklN
BAIAAAAAAAIAADhCSU0EMAAAAAAAAQEAOEJJTQQtAAAAAAAGAAEAAAACOEJJTQQIAAAAAAAQAAAA
AQAAAkAAAAJAAAAAADhCSU0EHgAAAAAABAAAAAA4QklNBBoAAAAAA08AAAAGAAAAAAAAAAAAAACO
AAABYwAAAA0AUwBDAFMAUABfAEMAUwBQAF8AMgAwADAAOAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAA
AQAAAAAAAAAAAAABYwAAAI4AAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAQAAAA
AQAAAAAAAG51bGwAAAACAAAABmJvdW5kc09iamMAAAABAAAAAAAAUmN0MQAAAAQAAAAAVG9wIGxv
bmcAAAAAAAAAAExlZnRsb25nAAAAAAAAAABCdG9tbG9uZwAAAI4AAAAAUmdodGxvbmcAAAFjAAAA
BnNsaWNlc1ZsTHMAAAABT2JqYwAAAAEAAAAAAAVzbGljZQAAABIAAAAHc2xpY2VJRGxvbmcAAAAA
AAAAB2dyb3VwSURsb25nAAAAAAAAAAZvcmlnaW5lbnVtAAAADEVTbGljZU9yaWdpbgAAAA1hdXRv
R2VuZXJhdGVkAAAAAFR5cGVlbnVtAAAACkVTbGljZVR5cGUAAAAASW1nIAAAAAZib3VuZHNPYmpj
AAAAAQAAAAAAAFJjdDEAAAAEAAAAAFRvcCBsb25nAAAAAAAAAABMZWZ0bG9uZwAAAAAAAAAAQnRv
bWxvbmcAAACOAAAAAFJnaHRsb25nAAABYwAAAAN1cmxURVhUAAAAAQAAAAAAAG51bGxURVhUAAAA
AQAAAAAAAE1zZ2VURVhUAAAAAQAAAAAABmFsdFRhZ1RFWFQAAAABAAAAAAAOY2VsbFRleHRJc0hU
TUxib29sAQAAAAhjZWxsVGV4dFRFWFQAAAABAAAAAAAJaG9yekFsaWduZW51bQAAAA9FU2xpY2VI
b3J6QWxpZ24AAAAHZGVmYXVsdAAAAAl2ZXJ0QWxpZ25lbnVtAAAAD0VTbGljZVZlcnRBbGlnbgAA
AAdkZWZhdWx0AAAAC2JnQ29sb3JUeXBlZW51bQAAABFFU2xpY2VCR0NvbG9yVHlwZQAAAABOb25l
AAAACXRvcE91dHNldGxvbmcAAAAAAAAACmxlZnRPdXRzZXRsb25nAAAAAAAAAAxib3R0b21PdXRz
ZXRsb25nAAAAAAAAAAtyaWdodE91dHNldGxvbmcAAAAAADhCSU0EKAAAAAAADAAAAAE/8AAAAAAA
ADhCSU0EFAAAAAAABAAAAAI4QklNBAwAAAAAESEAAAABAAAAoAAAAEAAAAHgAAB4AAAAEQUAGAAB
/9j/4AAQSkZJRgABAgAASABIAAD/7QAMQWRvYmVfQ00AAf/uAA5BZG9iZQBkgAAAAAH/2wCEAAwI
CAgJCAwJCQwRCwoLERUPDAwPFRgTExUTExgRDAwMDAwMEQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM
DAwMDAwBDQsLDQ4NEA4OEBQODg4UFA4ODg4UEQwMDAwMEREMDAwMDAwRDAwMDAwMDAwMDAwMDAwM
DAwMDAwMDAwMDAwMDP/AABEIAEAAoAMBIgACEQEDEQH/3QAEAAr/xAE/AAABBQEBAQEBAQAAAAAA
AAADAAECBAUGBwgJCgsBAAEFAQEBAQEBAAAAAAAAAAEAAgMEBQYHCAkKCxAAAQQBAwIEAgUHBggF
AwwzAQACEQMEIRIxBUFRYRMicYEyBhSRobFCIyQVUsFiMzRygtFDByWSU/Dh8WNzNRaisoMmRJNU
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
DAENCwsNDg0QDg4QFA4ODhQUDg4ODhQRDAwMDAwREQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwM
DAwMDAwMDAwM/8AAEQgAQACgAwEiAAIRAQMRAf/dAAQACv/EAT8AAAEFAQEBAQEBAAAAAAAAAAMA
AQIEBQYHCAkKCwEAAQUBAQEBAQEAAAAAAAAAAQACAwQFBgcICQoLEAABBAEDAgQCBQcGCAUDDDMB
AAIRAwQhEjEFQVFhEyJxgTIGFJGhsUIjJBVSwWIzNHKC0UMHJZJT8OHxY3M1FqKygyZEk1RkRcKj
dDYX0lXiZfKzhMPTdePzRieUpIW0lcTU5PSltcXV5fVWZnaGlqa2xtbm9jdHV2d3h5ent8fX5/cR
AAICAQIEBAMEBQYHBwYFNQEAAhEDITESBEFRYXEiEwUygZEUobFCI8FS0fAzJGLhcoKSQ1MVY3M0
8SUGFqKygwcmNcLSRJNUoxdkRVU2dGXi8rOEw9N14/NGlKSFtJXE1OT0pbXF1eX1VmZ2hpamtsbW
5vYnN0dXZ3eHl6e3x//aAAwDAQACEQMRAD8A9VSSSSUpJJJJSkkkklKSSSSUpc/9cug09cwcfHty
jhiq/wBUPFfqydllezbuZt+mt22yuqt9tjgyusFz3HgACXOKz78mjqVe3AsbkOqcDYGOGgcH7ZlR
5smTFjlkxC8kflFcf/NSN3gM/wCoGNidOzM2vqrr3YdFmR6Rx9m70279u82e3cui/wAV3/ias/8A
Dd3/AHxXuo9M6hd0jqWPXSXW5GHdVU3c33Pe2GM+lt9yh/i/6V1HpXQn4vUaDj3nIssDC5rva7Zt
duqdY1SctzObPyplzHpycdcPD7fp/uSXylcTZ6vSpJJJMakkkklKSSSSUpJJJJT/AP/Q7brn126D
0S84uTY+7KaAX4+O3e5odq31XSyqv+o+z1E3Rfrx0DrOQ3Eossoynz6dGQzY50DcfTe3fS9238z1
fUXA/VNvQ7PrHlM+tDWnIse/0xkR6P2n1H/a25O72es538x636L+c/wvorvD9SOjU9Xw+rdOrGDd
i2F9lVY/RWNcx9W30ZDKbG79zLKv+uV/6OxPHih6TxcVWJ/okryIjTW+6bO+uXQ+n9Yb0fMsfTkH
ZNjmH0h6g/R77vzN30VuLyb68Yl2d9eLMKgNddk10V1tcYaXFjztc7+Xt2ra+oX1xdub9XusF1eR
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
QwAABDwAAAgMZ1RSQwAABDwAAAgMYlRSQwAABDwAAAgMdGV4dAAAAABDb3B5cmlnaHQgKGMpIDE5
OTggSGV3bGV0dC1QYWNrYXJkIENvbXBhbnkAAGRlc2MAAAAAAAAAEnNSR0IgSUVDNjE5NjYtMi4x
AAAAAAAAAAAAAAASc1JHQiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAADzUQABAAAAARbMWFlaIAAAAAAAAAAAAAAA
AAAAAABYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSg
AAAPhAAAts9kZXNjAAAAAAAAABZJRUMgaHR0cDovL3d3dy5pZWMuY2gAAAAAAAAAAAAAABZJRUMg
aHR0cDovL3d3dy5pZWMuY2gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAZGVzYwAAAAAAAAAuSUVDIDYxOTY2LTIuMSBEZWZhdWx0IFJHQiBjb2xvdXIgc3BhY2Ug
LSBzUkdCAAAAAAAAAAAAAAAuSUVDIDYxOTY2LTIuMSBEZWZhdWx0IFJHQiBjb2xvdXIgc3BhY2Ug
LSBzUkdCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGRlc2MAAAAAAAAALFJlZmVyZW5jZSBWaWV3aW5n
IENvbmRpdGlvbiBpbiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAACxSZWZlcmVuY2UgVmlld2luZyBD
b25kaXRpb24gaW4gSUVDNjE5NjYtMi4xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB2aWV3AAAA
AAATpP4AFF8uABDPFAAD7cwABBMLAANcngAAAAFYWVogAAAAAABMCVYAUAAAAFcf521lYXMAAAAA
AAAAAQAAAAAAAAAAAAAAAAAAAAAAAAKPAAAAAnNpZyAAAAAAQ1JUIGN1cnYAAAAAAAAEAAAAAAUA
CgAPABQAGQAeACMAKAAtADIANwA7AEAARQBKAE8AVABZAF4AYwBoAG0AcgB3AHwAgQCGAIsAkACV
AJoAnwCkAKkArgCyALcAvADBAMYAywDQANUA2wDgAOUA6wDwAPYA+wEBAQcBDQETARkBHwElASsB
MgE4AT4BRQFMAVIBWQFgAWcBbgF1AXwBgwGLAZIBmgGhAakBsQG5AcEByQHRAdkB4QHpAfIB+gID
AgwCFAIdAiYCLwI4AkECSwJUAl0CZwJxAnoChAKOApgCogKsArYCwQLLAtUC4ALrAvUDAAMLAxYD
IQMtAzgDQwNPA1oDZgNyA34DigOWA6IDrgO6A8cD0wPgA+wD+QQGBBMEIAQtBDsESARVBGMEcQR+
BIwEmgSoBLYExATTBOEE8AT+BQ0FHAUrBToFSQVYBWcFdwWGBZYFpgW1BcUF1QXlBfYGBgYWBicG
NwZIBlkGagZ7BowGnQavBsAG0QbjBvUHBwcZBysHPQdPB2EHdAeGB5kHrAe/B9IH5Qf4CAsIHwgy
CEYIWghuCIIIlgiqCL4I0gjnCPsJEAklCToJTwlkCXkJjwmkCboJzwnlCfsKEQonCj0KVApqCoEK
mAquCsUK3ArzCwsLIgs5C1ELaQuAC5gLsAvIC+EL+QwSDCoMQwxcDHUMjgynDMAM2QzzDQ0NJg1A
DVoNdA2ODakNww3eDfgOEw4uDkkOZA5/DpsOtg7SDu4PCQ8lD0EPXg96D5YPsw/PD+wQCRAmEEMQ
YRB+EJsQuRDXEPURExExEU8RbRGMEaoRyRHoEgcSJhJFEmQShBKjEsMS4xMDEyMTQxNjE4MTpBPF
E+UUBhQnFEkUahSLFK0UzhTwFRIVNBVWFXgVmxW9FeAWAxYmFkkWbBaPFrIW1hb6Fx0XQRdlF4kX
rhfSF/cYGxhAGGUYihivGNUY+hkgGUUZaxmRGbcZ3RoEGioaURp3Gp4axRrsGxQbOxtjG4obshva
HAIcKhxSHHscoxzMHPUdHh1HHXAdmR3DHeweFh5AHmoelB6+HukfEx8+H2kflB+/H+ogFSBBIGwg
mCDEIPAhHCFIIXUhoSHOIfsiJyJVIoIiryLdIwojOCNmI5QjwiPwJB8kTSR8JKsk2iUJJTglaCWX
Jccl9yYnJlcmhya3JugnGCdJJ3onqyfcKA0oPyhxKKIo1CkGKTgpaymdKdAqAio1KmgqmyrPKwIr
NitpK50r0SwFLDksbiyiLNctDC1BLXYtqy3hLhYuTC6CLrcu7i8kL1ovkS/HL/4wNTBsMKQw2zES
MUoxgjG6MfIyKjJjMpsy1DMNM0YzfzO4M/E0KzRlNJ402DUTNU01hzXCNf02NzZyNq426TckN2A3
nDfXOBQ4UDiMOMg5BTlCOX85vDn5OjY6dDqyOu87LTtrO6o76DwnPGU8pDzjPSI9YT2hPeA+ID5g
PqA+4D8hP2E/oj/iQCNAZECmQOdBKUFqQaxB7kIwQnJCtUL3QzpDfUPARANER0SKRM5FEkVVRZpF
3kYiRmdGq0bwRzVHe0fASAVIS0iRSNdJHUljSalJ8Eo3Sn1KxEsMS1NLmkviTCpMcky6TQJNSk2T
TdxOJU5uTrdPAE9JT5NP3VAnUHFQu1EGUVBRm1HmUjFSfFLHUxNTX1OqU/ZUQlSPVNtVKFV1VcJW
D1ZcVqlW91dEV5JX4FgvWH1Yy1kaWWlZuFoHWlZaplr1W0VblVvlXDVchlzWXSddeF3JXhpebF69
Xw9fYV+zYAVgV2CqYPxhT2GiYfViSWKcYvBjQ2OXY+tkQGSUZOllPWWSZedmPWaSZuhnPWeTZ+lo
P2iWaOxpQ2maafFqSGqfavdrT2una/9sV2yvbQhtYG25bhJua27Ebx5veG/RcCtwhnDgcTpxlXHw
cktypnMBc11zuHQUdHB0zHUodYV14XY+dpt2+HdWd7N4EXhueMx5KnmJeed6RnqlewR7Y3vCfCF8
gXzhfUF9oX4BfmJ+wn8jf4R/5YBHgKiBCoFrgc2CMIKSgvSDV4O6hB2EgITjhUeFq4YOhnKG14c7
h5+IBIhpiM6JM4mZif6KZIrKizCLlov8jGOMyo0xjZiN/45mjs6PNo+ekAaQbpDWkT+RqJIRknqS
45NNk7aUIJSKlPSVX5XJljSWn5cKl3WX4JhMmLiZJJmQmfyaaJrVm0Kbr5wcnImc951kndKeQJ6u
nx2fi5/6oGmg2KFHobaiJqKWowajdqPmpFakx6U4pammGqaLpv2nbqfgqFKoxKk3qamqHKqPqwKr
davprFys0K1ErbiuLa6hrxavi7AAsHWw6rFgsdayS7LCszizrrQltJy1E7WKtgG2ebbwt2i34LhZ
uNG5SrnCuju6tbsuu6e8IbybvRW9j74KvoS+/796v/XAcMDswWfB48JfwtvDWMPUxFHEzsVLxcjG
RsbDx0HHv8g9yLzJOsm5yjjKt8s2y7bMNcy1zTXNtc42zrbPN8+40DnQutE80b7SP9LB00TTxtRJ
1MvVTtXR1lXW2Ndc1+DYZNjo2WzZ8dp22vvbgNwF3IrdEN2W3hzeot8p36/gNuC94UThzOJT4tvj
Y+Pr5HPk/OWE5g3mlucf56noMui86Ubp0Opb6uXrcOv77IbtEe2c7ijutO9A78zwWPDl8XLx//KM
8xnzp/Q09ML1UPXe9m32+/eK+Bn4qPk4+cf6V/rn+3f8B/yY/Sn9uv5L/tz/bf///9sAQwAIBgYH
BgUIBwcHCQkICgwUDQwLCwwZEhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04Mjwu
MzQy/9sAQwEJCQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy
MjIyMjIyMjIyMjIyMjIy/8AAEQgAHQDKAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAAB
AgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNC
scEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0
dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY
2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//E
ALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoW
JDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWG
h4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp
6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A9/zRmvF9Yg8fxa2z68daudLycf8ACOyhMDPGFA3Ec9G5
98Ckt9R8JNP5L+LPGGh3oGPKvbiQEH1YEMuPqRXR9X0unf01NOQ9ozS5rktbmktfhhfzWuqyXcke
nOY9QjfDSELw4ZT19xXmngK58datBfXmj68ZpLRk3WmoyNKkwIJwGbJU/L2I69RUwo80XK9rCULq
57xRXnMPxNudInW28Y+H7vSGJ2i6jUywMfqP/ZS1dBqWv2Gq+C9ZvdG1KKcxWMzCS3l+aNtjEE45
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

------=_NextPart_000_0035_01CA6C49.1F917800--



--===============6046502036854505758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6046502036854505758==--
