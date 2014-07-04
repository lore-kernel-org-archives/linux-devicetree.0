Return-Path: <gshark.jeong@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140703090447.GC29837@leverpostej>
References: <1404367277-12003-1-git-send-email-gshark.jeong@gmail.com>
	<1404367277-12003-3-git-send-email-gshark.jeong@gmail.com>
	<20140703090447.GC29837@leverpostej>
Date: Fri, 4 Jul 2014 11:10:00 +0900
Message-ID: <CAPqQCJUYqgireOiqK9DLpSAkw_4DdmKD+G7bXxVxf=bb0nTj6Q@mail.gmail.com>
Subject: Re: [RFC v4 2/2] backlight: device tree: add new tps611xx backlight binding
From: Daniel Jeong <gshark.jeong@gmail.com>
Content-Type: multipart/alternative; boundary=001a1139bcd465def304fd549f48
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Bryan Wu <cooloney@gmail.com>, Lee Jones <lee.jones@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel Jeong <daniel.jeong@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a1139bcd465def304fd549f48
Content-Type: text/plain; charset=UTF-8

Hi.
Thank you for comments.

2014-07-03 18:04 GMT+09:00 Mark Rutland <mark.rutland@arm.com>:

> On Thu, Jul 03, 2014 at 07:01:17AM +0100, Daniel Jeong wrote:
> > This commit is about tps611xx device tree documentation.
> >
> > Signed-off-by: Daniel Jeong <gshark.jeong@gmail.com>
> > ---
> >  .../video/backlight/tps611xx-backlight.txt         |   24
> ++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> >
> > diff --git
> a/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> b/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> > new file mode 100644
> > index 0000000..7af8182
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> > @@ -0,0 +1,24 @@
> > +TPS611xx family of backlight driver based on EasyScale.
> > +
> > +EasyScale is a simple but flexible one pin interface to configure the
> current.
> > +
> > +Required properties:
> > +- compatible: should contain at least one of
> > +  "ti,tps61158_bl"
> > +  "ti,tps61161_bl"
> > +  "ti,tps61163_bl"
> > +  "ti,tps61165_bl"
>
> In v3 I asked you to get rid of the "_bl" suffix.
>
> Sorry. I should have checked it before sending it.  It will be fixed.

> > +- rfa-enable: enable request for acknowledge.
> > +  If RFA is enabled, the data byte includes the RFA bit and device will
> wait
> > +  and check acknowledge from device.
>
> You didn't answer my question as to why this should be in the DT.
>
> According to the RFA enable, the easy scale pin works differently.
This value should be set before the first data transfer.

> +- es-gpio : GPIO for easy-scale communication.(see GPIO binding[0])
> > +
> > +[0]: Documentation/devicetree/bindings/gpio/gpio.txt
> > +
> > +Example:
> > +
> > +     backlight {
> > +             compatible = "ti,tps61163";
>
> This now doesn't match the Documentation above.
>
> Thanks,
> Mark.
>
> > +             rfa-enable;
> > +             es-gpio = <&gpio 45 0>;
> > +     };
> > --
> > 1.7.9.5
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
Thanks.

--001a1139bcd465def304fd549f48
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi.<br><div><div class=3D"gmail_extra">Thank you for comme=
nts. <br><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">20=
14-07-03 18:04 GMT+09:00 Mark Rutland <span dir=3D"ltr">&lt;<a href=3D"mail=
to:mark.rutland@arm.com" target=3D"_blank">mark.rutland@arm.com</a>&gt;</sp=
an>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Thu, Jul 03, 2014 at 07:0=
1:17AM +0100, Daniel Jeong wrote:<br>
&gt; This commit is about tps611xx device tree documentation.<br>
&gt;<br>
&gt; Signed-off-by: Daniel Jeong &lt;<a href=3D"mailto:gshark.jeong@gmail.c=
om">gshark.jeong@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../video/backlight/tps611xx-backlight.txt =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 24 ++++++++++++++++++++<br>
&gt; =C2=A01 file changed, 24 insertions(+)<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/video/backl=
ight/tps611xx-backlight.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/video/backlight/tps611x=
x-backlight.txt b/Documentation/devicetree/bindings/video/backlight/tps611x=
x-backlight.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7af8182<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/video/backlight/tps611xx-backl=
ight.txt<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +TPS611xx family of backlight driver based on EasyScale.<br>
&gt; +<br>
&gt; +EasyScale is a simple but flexible one pin interface to configure the=
 current.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible: should contain at least one of<br>
&gt; + =C2=A0&quot;ti,tps61158_bl&quot;<br>
&gt; + =C2=A0&quot;ti,tps61161_bl&quot;<br>
&gt; + =C2=A0&quot;ti,tps61163_bl&quot;<br>
&gt; + =C2=A0&quot;ti,tps61165_bl&quot;<br>
<br>
</div>In v3 I asked you to get rid of the &quot;_bl&quot; suffix.<br>
<div class=3D""><br></div></blockquote><div>Sorry. I should have checked it=
 before sending it.=C2=A0 It will be fixed.<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<div class=3D"">
&gt; +- rfa-enable: enable request for acknowledge.<br>
&gt; + =C2=A0If RFA is enabled, the data byte includes the RFA bit and devi=
ce will wait<br>
&gt; + =C2=A0and check acknowledge from device.<br>
<br>
</div>You didn&#39;t answer my question as to why this should be in the DT.=
<br>
<div class=3D""><br></div></blockquote><div>According to the RFA enable, th=
e easy scale pin works differently.<br></div><div>This value should be set =
before the first data transfer. <br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"">
&gt; +- es-gpio : GPIO for easy-scale communication.(see GPIO binding[0])<b=
r>
&gt; +<br>
&gt; +[0]: Documentation/devicetree/bindings/gpio/gpio.txt<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 backlight {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,tp=
s61163&quot;;<br>
<br>
</div>This now doesn&#39;t match the Documentation above.<br>
<br>
Thanks,<br>
Mark.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfa-enable;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 es-gpio =3D &lt;&amp;gpio =
45 0&gt;;<br>
&gt; + =C2=A0 =C2=A0 };<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe devicet=
ree&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at =C2=A0<a href=3D"http://vger.kernel.org/majordo=
mo-info.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html<=
/a><br>
&gt;<br>
</font></span></blockquote></div>Thanks.<br></div></div></div>

--001a1139bcd465def304fd549f48--
