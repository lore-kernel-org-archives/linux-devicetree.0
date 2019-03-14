Return-Path: <SRS0=ivXq=RR=hanoverdisplays.com=cquast@kernel.org>
From: Christina Quast <cquast@hanoverdisplays.com>
Subject: Re: [PATCH 2/2] ARM: dts: am335x: Replaced register offsets with defines
Date: Thu, 14 Mar 2019 16:02:46 +0000
Message-ID: <4FA4A861EC9F6744BE8446EF2CDFAFE11FF8885D@mail.hanover.local>
References: <20190313142724.27446-1-cquast@hanoverdisplays.com> <20190313142724.27446-3-cquast@hanoverdisplays.com> <20190314150524.GB19425@atomide.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="part__C4BE6C28_B8F5_42D9_83C1_9BC2B4CF7"
To: Tony Lindgren <tony@atomide.com>
Cc: "bcousson@baylibre.com" <bcousson@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mpfj@newflow.co.uk" <mpfj@newflow.co.uk>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--part__C4BE6C28_B8F5_42D9_83C1_9BC2B4CF7
Content-Type: multipart/alternative;
	boundary="part__1BC40F5F_A486_46E3_ABEB_625B822A6"

--part__1BC40F5F_A486_46E3_ABEB_625B822A6
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Disclaimer: hanoverdisplays.com

On 14/03/2019 16:05, Tony Lindgren wrote:
> * Christina Quast <cquast@hanoverdisplays.com> [190313 14:28]:
>> The defines are taken from dt-bindings/pinctrl/am335x.h
>>
>> Updated AM33XX_IOPAD to take three instead of two parameters:
>> AM33XX_IOPAD(register_offset, pin_direction_pullups, mux_mode)
> Thanks that works great for making things work eventually
> with #pinctrl-cells =3D <2> :)
>
>> +			AM33XX_IOPAD(AM335X_PIN_UART1_RXD, PIN_INPUT, MUX_MODE0)      /* uart=
1_rxd */
>> +			AM33XX_IOPAD(AM335X_PIN_UART1_TXD, PIN_INPUT, MUX_MODE0)      /* uart=
1_txd *
> Since it sounds like you're modifying these with a script,
Who would do such a change by hand, anyways? That's too error-prone!
> just leave out any nop comments while at it where the comment
> is just the pad name already there in the new register
> define. Some comments might need to be preserved, but my
> guess is that they're mostly just the pad name.
>
> And I suggest you split this change to a seprate patch
> for each board so in case of trouble we can revert the
> changes for a single board if needed.
Is it really useful to have a change per board? Once the AM33XX_IOPAD
macro is changed and takes 3 arguments instead of 2, the old boards will
not compile anymore anyways.
>
> Regards,
>
> Tony
>



=0A =0APlease consider the environment before printing this email=0A =0A=0A =
=0A =0A =0AThe information transmitted is intended only for the person or en=
tity to which it is addressed and may contain confidential and/or privileged=
 material. Any review, retransmission, dissemination or other use of, or tak=
ing of any action in reliance upon, this information by persons or entities =
other than the intended recipient is prohibited.=0AIf you received this in e=
rror, please contact the sender or postmaster (postmaster@hanoverdisplays.co=
m) and delete the material from any computer.=0AAlthough we routinely screen=
 for viruses, addressees should check this e-mail and any attachment for vir=
uses. We make no warranty as to absence of viruses in this e-mail or any att=
achments.=0AOur Company's email policy is to permit incidental personal use.=
 If this email is of a personal nature, it must not be relied upon as expres=
sing the views or opinions of the company.


--part__1BC40F5F_A486_46E3_ABEB_625B822A6
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Disclaimer: hanoverdisplays.com

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">=

<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: =
#800000 2px solid; } --> gfidisc.hanoverdisplays.com {color:black; !importan=
t} </style>
 <meta name=3D"application-name" content=3D"gfidisc.hanoverdisplays.com "> <=
/head>
<body>
<font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12pt;"><a=
 name=3D"BM_BEGIN"></a>
<div><font size=3D"2"><span style=3D"font-size:10pt;">On 14/03/2019 16:05, T=
ony Lindgren wrote:<br>

&gt; * Christina Quast &lt;cquast@hanoverdisplays.com&gt; [190313 14:28]:<br=
>

&gt;&gt; The defines are taken from dt-bindings/pinctrl/am335x.h<br>

&gt;&gt;<br>

&gt;&gt; Updated AM33XX_IOPAD to take three instead of two parameters:<br>

&gt;&gt; AM33XX_IOPAD(register_offset, pin_direction_pullups, mux_mode)<br>

&gt; Thanks that works great for making things work eventually<br>

&gt; with #pinctrl-cells =3D &lt;2&gt; :)<br>

&gt;<br>

&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM33XX_IOPAD(AM335X_PIN=
_UART1_RXD, PIN_INPUT, MUX_MODE0)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* uart1_rxd=
 */<br>

&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM33XX_IOPAD(AM335X_PIN=
_UART1_TXD, PIN_INPUT, MUX_MODE0)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* uart1_txd=
 *<br>

&gt; Since it sounds like you're modifying these with a script,<br>

Who would do such a change by hand, anyways? That's too error-prone!<br>

&gt; just leave out any nop comments while at it where the comment<br>

&gt; is just the pad name already there in the new register<br>

&gt; define. Some comments might need to be preserved, but my<br>

&gt; guess is that they're mostly just the pad name.<br>

&gt;<br>

&gt; And I suggest you split this change to a seprate patch<br>

&gt; for each board so in case of trouble we can revert the<br>

&gt; changes for a single board if needed.<br>

Is it really useful to have a change per board? Once the AM33XX_IOPAD<br>

macro is changed and takes 3 arguments instead of 2, the old boards will<br>=


not compile anymore anyways.<br>

&gt;<br>

&gt; Regards,<br>

&gt;<br>

&gt; Tony<br>

&gt;<br>

<br>

</span></font></div>
</span></font>
<p class=3D"gfidisc.hanoverdisplays.com" id=3D"gfidisc.hanoverdisplays.com" =
style=3D"gfidisc.hanoverdisplays.com"></p><a id=3D"gfidisc.hanoverdisplays.c=
om" title=3D"gfidisc.hanoverdisplays.com" href=3D"gfidisc.hanoverdisplays.co=
m" class=3D"gfidisc.hanoverdisplays.com" style=3D"text-decoration: none !imp=
ortant;"></a><gfidisc.hanoverdisplays.com/><h1 class=3D"gfidisc.hanoverdispl=
ays.com" style=3D"gfidisc.hanoverdisplays.com"></h1><hr />=0A<p><span style=3D=
"font-size: xx-small;"><span style=3D"font-family: Arial;">&nbsp;</span></sp=
an></p>=0A<p><span style=3D"font-size: xx-small;"><span style=3D"font-family=
: Arial;"><span style=3D"color: #008000;">Please consider the environment be=
fore printing this email</span></span></span></p>=0A<p>&nbsp;</p>=0A<hr />=0A=
<p>&nbsp;</p>=0A<p>&nbsp;</p>=0A<p>&nbsp;</p>=0A<p><span style=3D"font-famil=
y: Arial; font-size: xx-small;">The information transmitted is intended only=
 for the person or entity to which it is addressed and may contain confident=
ial and/or privileged material. Any review, retransmission, dissemination or=
 other use of, or taking of any action in reliance upon, this information by=
 persons or entities other than the intended recipient is prohibited.</span>=
</p>=0A<p><span style=3D"font-family: Arial; font-size: xx-small;">If you re=
ceived this in error, please contact the sender or postmaster (</span><a hre=
f=3D"mailto:postmaster@hanoverdisplays.com"><span style=3D"font-family: Aria=
l; font-size: xx-small;">postmaster@hanoverdisplays.com</span></a><span styl=
e=3D"font-family: Arial; font-size: xx-small;">) and delete the material fro=
m any computer.</span></p>=0A<p><span style=3D"font-family: Arial; font-size=
: xx-small;">Although we routinely screen for viruses, addressees should che=
ck this e-mail and any attachment for viruses. We make no warranty as to abs=
ence of viruses in this e-mail or any attachments.</span></p>=0A<p><span sty=
le=3D"font-family: Arial; font-size: xx-small;">Our Company's email policy i=
s to permit incidental personal use. If this email is of a personal nature, =
it must not be relied upon as expressing the views or opinions of the compan=
y.</span></p><p class=3D"gfidisc.hanoverdisplays.com" id=3D"gfidisc.hanoverd=
isplays.com" style=3D"gfidisc.hanoverdisplays.com"></p><a id=3D"gfidisc.hano=
verdisplays.com" title=3D"gfidisc.hanoverdisplays.com" href=3D"gfidisc.hanov=
erdisplays.com" class=3D"gfidisc.hanoverdisplays.com" style=3D"text-decorati=
on: none !important;"></a><gfidisc.hanoverdisplays.com/><h1 class=3D"gfidisc=
.hanoverdisplays.com" style=3D"gfidisc.hanoverdisplays.com"></h1></body>
</html>

--part__1BC40F5F_A486_46E3_ABEB_625B822A6--

--part__C4BE6C28_B8F5_42D9_83C1_9BC2B4CF7--
