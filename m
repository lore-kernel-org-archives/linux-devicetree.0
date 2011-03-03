From: "PEIXOTO Pierre" <ppeixoto-zjFYp9kwZlmZox4op4iWzw@public.gmane.org>
Subject: Cypress CY7C67300 Host controller
Date: Thu, 3 Mar 2011 14:22:22 +0100
Message-ID: <51D9710FF5643747BB605F97B8DE56CD057850BE@STEGOSAURE.adetel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2277849621451661753=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
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

This is a multi-part message in MIME format.

--===============2277849621451661753==
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CBD9A6.07BB1ECE"

This is a multi-part message in MIME format.

------_=_NextPart_001_01CBD9A6.07BB1ECE
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hello,

=20

I try to use the driver for Cypress CY7C67300 USB Host controller
(C67X00). I work with the Xilinx ML403 board and I download the Linux
2.6.37 Kernel from Xilinx web site.

I try to use the driver but the cypress CY7C67300 is not recognized when
I run the kernel in my board.

I think I have a problem with the .dts file provided by Xilinx Project
Studio.=20

Do you know how to configure the .dts file?

=20

I put:

=20

Cypress_USB: usb@80800000 {

=20

                        compatible =3D "cypress,c67x00";

                        interrupt-parent =3D <&xps_intc_0>;

                        interrupts =3D < 1 2 >;

                        reg =3D < 0x80800000 0x10000 >;

                        xlnx,family =3D "virtex4";

=20

 } ;=20

=20

But it doesn't work....

=20

So I would like to know, how can I use the driver and with what hardware
architecture it can run and how to configure the "Device Tree" (.dts
file)?

=20

Thank you very much for your help

Regards

=20

Pierre

=20


------_=_NextPart_001_01CBD9A6.07BB1ECE
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:Arial;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DFR link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>Hello,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>I try to use the driver for Cypress CY7C67300 USB Host =
controller (C67X00).
I work with the Xilinx ML403 board and I download the Linux 2.6.37 =
Kernel from
Xilinx web site.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>I try to use the driver but the cypress CY7C67300 is not =
recognized
when I run the kernel in my board.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>I think I have a problem with the .dts file provided by Xilinx =
Project
Studio. <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>Do you know how to configure the .dts =
file?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>I put:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-style:italic'>Cypress_USB: usb@80800000 =
{<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-style:italic'><o:p>&nbsp;</o:p></span></fo=
nt></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-style:italic'>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></i><i><font size=3D2><span =
style=3D'font-size:10.0pt;font-style:
italic'>compatible =3D =
&quot;cypress,c67x00&quot;;<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-style:italic'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupt-parent =3D
&lt;&amp;xps_intc_0&gt;;<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-style:italic'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
interrupts =3D &lt; 1 2 &gt;;<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-style:italic'>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt; 0x80800000 =
0x10000 &gt;;<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-style:italic'>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
xlnx,family =3D &quot;virtex4&quot;;<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-style:italic'><o:p>&nbsp;</o:p></span></fo=
nt></i></p>

<p class=3DMsoNormal><i><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-style:italic'>&nbsp;} ; =
<o:p></o:p></span></font></i></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>But it doesn&#8217;t work&#8230;.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>So I would like to know, how can I use the driver and with what
hardware architecture it can run and how to configure the &#8220;Device
Tree&#8221; (.dts file)?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>Thank you very much for your help<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'>Regards<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><st1:place w:st=3D"on"><st1:City w:st=3D"on"><font =
size=3D2
  face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt'>Pierre</span></font></st1:City></st1:place><fo=
nt
size=3D2><span lang=3DEN-GB =
style=3D'font-size:10.0pt'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01CBD9A6.07BB1ECE--

--===============2277849621451661753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2277849621451661753==--
