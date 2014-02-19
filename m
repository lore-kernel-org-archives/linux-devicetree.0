Return-Path: <Ashutosh.s@phytec.in>
MIME-Version: 1.0
In-Reply-To: <20140219055824.GB3010@S2101-09.ap.freescale.net>
References: <20140219055824.GB3010@S2101-09.ap.freescale.net>,
	<1392731185-4885-1-git-send-email-ashutosh.s@phytec.in> <20140219022307.GL15716@S2101-09.ap.freescale.net>
Subject: Re: [PATCH v3 1/4] Phytec phyFLEX-i.MX6 : Added USB_OTG Support
From: Singh Ashutosh <Ashutosh.s@phytec.in>
Message-ID: <OFC71BE897.0055ECCD-ONC1257C84.002531D0-C1257C84.002531D4@phytec.de>
Date: Wed, 19 Feb 2014 07:46:15 +0100
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Christian Hemp <C.Hemp@phytec.de>, devicetree@vger.kernel.org, festevam@gmail.com, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, s.hauer@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><span style=3D"font-family: verdana, helvetica, arial, sans-serif;">=
<font color=3D"#990099">-----Shawn Guo &lt;shawn.guo@linaro.org&gt; wrote: =
-----</font></span><br><div style=3D"padding-left:5px;"><div style=3D"paddi=
ng-right:0px;padding-left:5px;border-left:solid black 2px;">To: Ashutosh si=
ngh &lt;ashutosh.s@phytec.in&gt;<br>From: Shawn Guo &lt;shawn.guo@linaro.or=
g&gt;<br>Date: 02/19/2014 11:28AM<br>Cc: &lt;devicetree@vger.kernel.org&gt;=
, &lt;kernel@pengutronix.de&gt;, &lt;linux-arm-kernel@lists.infradead.org&g=
t;, &lt;s.hauer@pengutronix.de&gt;, &lt;c.hemp@phytec.de&gt;, &lt;robh+dt@k=
ernel.org&gt;, &lt;pawel.moll@arm.com&gt;, &lt;mark.rutland@arm.com&gt;, &l=
t;ijc+devicetree@hellion.org.uk&gt;, &lt;galak@codeaurora.org&gt;, &lt;fest=
evam@gmail.com&gt;<br>Subject: Re: [PATCH v3 1/4] Phytec phyFLEX-i.MX6 : Ad=
ded USB=5FOTG Support<br><br><div><font face=3D"Courier New,Courier,monospa=
ce" size=3D"3">On Wed, Feb 19, 2014 at 10:23:09AM +0800, Shawn Guo wrote:<b=
r>&gt; &gt; @@ -18,6 +18,14 @@<br>&gt; &gt; &nbsp;	memory {<br>&gt; &gt; &n=
bsp;		reg =3D &lt;0x10000000 0x80000000&gt;;<br>&gt; &gt; &nbsp;	};<br>&gt;=
 &gt; +<br>&gt; &gt; +	reg=5Fusb=5Fotg=5Fvbus: regulator@0 {<br>&gt; <br>&g=
t; You do not have a 'reg' property in the node, so you shouldn't have<br>&=
gt; '@num' in node name. &nbsp;You may want to name it 'regulator-0'.<br><b=
r>I just saw the talk between Stephen and Mark [1], and I'm with Stephen<br=
>that neither regulator-0 nor regulator=5F0 is a good name. &nbsp;Since Mar=
k is<br>giving up the argument on the container, please follow the way we d=
o in<br>other IMX dts today.<br><br>Shawn<br><br>[1] <a href=3D"http://thre=
ad.gmane.org/gmane.linux.drivers.devicetree/61894/focus=3D62405">http://thr=
ead.gmane.org/gmane.linux.drivers.devicetree/61894/focus=3D62405</a><br><br=
></font><span style=3D"font-family: 'Times New Roman'; font-size: medium;">=
By seeing the discussion would the below changes is appropriate&nbsp;</span=
><br style=3D"font-family: 'Times New Roman'; font-size: medium;"><br style=
=3D"font-family: 'Times New Roman'; font-size: medium;"><span style=3D"font=
-family: 'Times New Roman'; font-size: medium;">regulators {</span><br styl=
e=3D"font-family: 'Times New Roman'; font-size: medium;"><span style=3D"fon=
t-family: 'Times New Roman'; font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible=
 =3D "simple-bus";</span><br style=3D"font-family: 'Times New Roman'; font-=
size: medium;"><span style=3D"font-family: 'Times New Roman'; font-size: me=
dium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;</span><br style=3D"fon=
t-family: 'Times New Roman'; font-size: medium;"><span style=3D"font-family=
: 'Times New Roman'; font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #size-cells =3D &l=
t;0&gt;;</span><br style=3D"font-family: 'Times New Roman'; font-size: medi=
um;"><br style=3D"font-family: 'Times New Roman'; font-size: medium;"><span=
 style=3D"font-family: 'Times New Roman'; font-size: medium;">&nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg=5Fusb=5F=
otg=5Fvbus: regulator@0 {</span><br style=3D"font-family: 'Times New Roman'=
; font-size: medium;"><span style=3D"font-family: 'Times New Roman'; font-s=
ize: medium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; compatible =3D "regulator-fixed";</span>=
<br style=3D"font-family: 'Times New Roman'; font-size: medium;"><span styl=
e=3D"font-family: 'Times New Roman'; font-size: medium;">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp; reg =3D &lt;0&gt;;</span><br style=3D"font-family: 'Times New Roma=
n'; font-size: medium;"><span style=3D"font-family: 'Times New Roman'; font=
-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; regulator-name =3D "usb=5Fotg=5F=
vbus";</span><br style=3D"font-family: 'Times New Roman'; font-size: medium=
;"><span style=3D"font-family: 'Times New Roman'; font-size: medium;">&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp; regulator-min-microvolt =3D &lt;5000000&gt;;</span><b=
r style=3D"font-family: 'Times New Roman'; font-size: medium;"><span style=
=3D"font-family: 'Times New Roman'; font-size: medium;">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbs=
p; regulator-max-microvolt =3D &lt;5000000&gt;;</span><br style=3D"font-fam=
ily: 'Times New Roman'; font-size: medium;"><span style=3D"font-family: 'Ti=
mes New Roman'; font-size: medium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; gpio =3D &lt=
;&amp;gpio4 15 0&gt;;</span><br style=3D"font-family: 'Times New Roman'; fo=
nt-size: medium;"><span style=3D"font-family: 'Times New Roman'; font-size:=
 medium;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; };</span><br style=3D"font-family: 'Times New Rom=
an'; font-size: medium;"><br style=3D"font-family: 'Times New Roman'; font-=
size: medium;"><span style=3D"font-family: 'Times New Roman'; font-size: me=
dium;">But as Mark [1] suggested not to use simple bus. Which one is more a=
ppropriate ?&nbsp;</span><br style=3D"font-family: 'Times New Roman'; font-=
size: medium;"><br style=3D"font-family: 'Times New Roman'; font-size: medi=
um;"><span style=3D"font-family: 'Times New Roman'; font-size: medium;">[1]=
&nbsp;</span><a href=3D"http://www.spinics.net/lists/linux-usb/msg101477.ht=
ml" style=3D"font-family: 'Times New Roman'; font-size: medium;">http://www=
.spinics.net/lists/linux-usb/msg101477.html</a><font face=3D"Courier New,Co=
urier,monospace" size=3D"3"><br><br>&gt; <br>&gt; &gt; +		compatible =3D "r=
egulator-fixed";<br>&gt; &gt; +		regulator-name =3D "usb=5Fotg=5Fvbus";<br>=
&gt; &gt; +		regulator-min-microvolt =3D &lt;5000000&gt;;<br>&gt; &gt; +		r=
egulator-max-microvolt =3D &lt;5000000&gt;;<br>&gt; &gt; +		gpio =3D &lt;&a=
mp;gpio4 15 0&gt;;<br>&gt; &gt; +	};<br>&gt; &gt; &nbsp;};<br><br></font></=
div></div></div><div></div></font>
