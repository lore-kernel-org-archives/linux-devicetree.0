From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Need some advice on LCD driver in Chrome u-boot
Date: Fri, 18 Nov 2011 08:14:33 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740D74E57@HQMAIL01.nvidia.com>
References: <49905142A3B3894E9A8098F01BCED9B97DED386014@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5460631430984439943=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <49905142A3B3894E9A8098F01BCED9B97DED386014-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Uboot-dev <Uboot-dev-Lp/cVzEoVyZDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============5460631430984439943==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_74CDBE0F657A3D45AFBB94109FB122FF1740D74E57HQMAIL01nvidi_"

--_000_74CDBE0F657A3D45AFBB94109FB122FF1740D74E57HQMAIL01nvidi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AIUI, yes you'll need to rewrite the LCD driver, but this should just be =
a manual replacement of the bit-twiddling macros with manually coded mani=
pulations.

I don't see much point upstreaming a .dts file that's completely untested=
; having it upstream before we're able to use it won't benefit us in any =
way, will it? Now, if we started initializing a bunch of stuff besides LC=
D from it, then it'd make sense.

Please make sure you have the LCD bindings (and whole .dts file) reviewed=
=20on devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org<mailto:devicetree-discuss@lists=
.ozlabs.org>, since that's the main .dts review list. The .dts needs to b=
e co-ordinated with other users such as the Linux kernel.

_____________________________________________
From: Mayuresh Kulkarni
Sent: Thursday, November 17, 2011 11:27 PM
To: Uboot-dev
Cc: Pritesh Raithatha; Varun Wadekar
Subject: Need some advice on LCD driver in Chrome u-boot


Hi All,

I need advice on following points about up-streaming the LCD driver:

- Chrome's u-boot implementation uses special bit-fields macros to implem=
ent the core display driver (for register read/writes). You can check thi=
s implementation in u-boot/arch/arm/cpu/armv7/tegra2/display.c.
- As you might be aware, Pritesh is working on getting I2C driver up-stre=
am which also uses bit-field macros in Chrome's u-boot. He has been given=
=20a comment that, this needs to be removed before up-streaming, as these=
=20macros are not accepted by Denx.
- As I understand, this means that the display driver needs to be rewritt=
en to use standard readl/writel APIs. Is this correct understanding?
- If it needs to be rewritten, it is going to take some time. So is it OK=
=20if we push a reviewed copy of tegra2-ventana.dts (name could be decide=
d upon) to Denx's master branch at this point of time? This commit will n=
ot be tested as there is no driver in master which would use this. Are su=
ch commits accepted?

In general, how are such issues handled by the u-boot community?

Mayuresh Kulkarni
NVIDIA Graphics Pvt Ltd




-------------------------------------------------------------------------=
----------
This email message is for the sole use of the intended recipient(s) and m=
ay contain
confidential information.  Any unauthorized review, use, disclosure or di=
stribution
is prohibited.  If you are not the intended recipient, please contact the=
=20sender by
reply email and destroy all copies of the original message.
-------------------------------------------------------------------------=
----------

--_000_74CDBE0F657A3D45AFBB94109FB122FF1740D74E57HQMAIL01nvidi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-asci=
i">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-lef=
t: #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Courier New, monospace" size=3D"2">
<div><font color=3D"#1F497D">AIUI, yes you&#8217;ll need to rewrite the L=
CD driver, but this should just be a manual replacement of the bit-twiddl=
ing macros with manually coded manipulations.</font></div>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">I don&#8217;t see much point upstreaming a .=
dts file that&#8217;s completely untested; having it upstream before we&#=
8217;re able to use it won&#8217;t benefit us in any way, will it? Now, i=
f we started initializing a bunch of stuff besides LCD from it,
then it&#8217;d make sense.</font></div>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">Please make sure you have the LCD bindings (=
and whole .dts file) reviewed on <a href=3D"mailto:devicetree-discuss@lis=
ts.ozlabs.org"><font color=3D"#0000FF"><u>devicetree-discuss-uLR06cmDAlazAvgg39JiuA@public.gmane.org=
.org</u></font></a>, since that&#8217;s the main .dts
review list. The .dts needs to be co-ordinated with other users such as t=
he Linux kernel.</font></div>
<div><font face=3D"Calibri, sans-serif" size=3D"2" color=3D"#1F497D">&nbs=
p;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Tahoma, sans-serif">___=
__________________________________________<br>

<b>From:</b> Mayuresh Kulkarni <br>

<b>Sent:</b> Thursday, November 17, 2011 11:27 PM<br>

<b>To:</b> Uboot-dev<br>

<b>Cc:</b> Pritesh Raithatha; Varun Wadekar<br>

<b>Subject:</b> Need some advice on LCD driver in Chrome u-boot</font></d=
iv>
<div style=3D"padding-left: 36pt; "><font face=3D"Calibri, sans-serif" si=
ze=3D"2">&nbsp;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Calibri, sans-serif" si=
ze=3D"2">&nbsp;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">Hi A=
ll,</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">&nbs=
p;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">I ne=
ed advice on following points about up-streaming the LCD driver:</font></=
div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">&nbs=
p;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">- Ch=
rome&#8217;s u-boot implementation uses special bit-fields macros to impl=
ement the core display driver (for register read/writes). You can check t=
his implementation in u-boot/arch/arm/cpu/armv7/tegra2/display.c.</font><=
/div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">- As=
=20you might be aware, Pritesh is working on getting I2C driver up-stream=
=20which also uses bit-field macros in Chrome&#8217;s u-boot. He has been=
=20given a comment that, this needs to be removed before
up-streaming, as these macros are not accepted by Denx.</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">- As=
=20I understand, this means that the display driver needs to be rewritten=
=20to use standard readl/writel APIs. Is this correct understanding?</fon=
t></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">- If=
=20it needs to be rewritten, it is going to take some time. So is it OK i=
f we push a reviewed copy of tegra2-ventana.dts (name could be decided up=
on) to Denx&#8217;s master branch at this point of
time? This commit will not be tested as there is no driver in master whic=
h would use this. Are such commits accepted?</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">&nbs=
p;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">In g=
eneral, how are such issues handled by the u-boot community?</font></div>=

<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif">&nbs=
p;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif"><b>M=
ayuresh Kulkarni</b></font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Arial, sans-serif" colo=
r=3D"#92D050">NVIDIA Graphics Pvt Ltd</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Calibri, sans-serif" si=
ze=3D"2">&nbsp;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Calibri, sans-serif" si=
ze=3D"2">&nbsp;</font></div>
<div style=3D"padding-left: 36pt; "><font face=3D"Calibri, sans-serif" si=
ze=3D"2">&nbsp;</font></div>
</font>

<DIV>
<HR>
</DIV>
<DIV>This email message is for the sole use of the intended recipient(s) =
and may=20
contain confidential information.&nbsp; Any unauthorized review, use, dis=
closure=20
or distribution is prohibited.&nbsp; If you are not the intended recipien=
t,=20
please contact the sender by reply email and destroy all copies of the or=
iginal=20
message. </DIV>
<DIV>
<HR>
</DIV>
<P></P>
</body>
</html>

--_000_74CDBE0F657A3D45AFBB94109FB122FF1740D74E57HQMAIL01nvidi_--

--===============5460631430984439943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5460631430984439943==--
