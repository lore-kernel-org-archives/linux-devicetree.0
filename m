Return-Path: <gshark.jeong@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140625093259.GC29789@leverpostej>
References: <1403594330-15387-1-git-send-email-gshark.jeong@gmail.com>
	<1403594330-15387-3-git-send-email-gshark.jeong@gmail.com>
	<20140625093259.GC29789@leverpostej>
Date: Thu, 3 Jul 2014 15:26:00 +0900
Message-ID: <CAPqQCJW5EYVbys0FYiSnBQ7TxtTMBeUE=t8+fbe=qSpDJ-pzZA@mail.gmail.com>
Subject: Re: [RFC v3 2/2] backlight: device tree: add new tps611xx backlight driver
From: Daniel Jeong <gshark.jeong@gmail.com>
Content-Type: multipart/alternative; boundary=089e012949861a79cb04fd4415cd
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Bryan Wu <cooloney@gmail.com>, Lee Jones <lee.jones@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel Jeong <daniel.jeong@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--089e012949861a79cb04fd4415cd
Content-Type: text/plain; charset=UTF-8

Hello.

Thank you for your comment.

2014-06-25 18:32 GMT+09:00 Mark Rutland <mark.rutland@arm.com>:

> Hello,
>
> Please fix the subject: this is a _binding_, not a driver.
>
> On Tue, Jun 24, 2014 at 08:18:50AM +0100, Daniel Jeong wrote:
> > This commit is about tps611xx device tree documentation.
> >
> > Signed-off-by: Daniel Jeong <gshark.jeong@gmail.com>
> > ---
> >  .../video/backlight/tps611xx-backlight.txt         |   16
> ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> >
> > diff --git
> a/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> b/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> > new file mode 100644
> > index 0000000..01f110d
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/video/backlight/tps611xx-backlight.txt
> > @@ -0,0 +1,16 @@
> > +TPS611xx family of backlight driver based on EasyScale.
> > +
> > +It supports tps61158, tps61161, tps61163 and tps61165.
>
> What supports these? The driver?
>
> The binding should describe the _hardware_, not the driver.
>
> > +Required properties:
> > +- compatible: "ti,tps61158_bl", "ti,tps61161_bl", "ti,tps61163_bl",
> "ti,tps61165_bl"
>
> Use '-' rather than '_' in compatible strings and properties.
>
> Is there any reason for the "bl" suffix? Does that actually form part of
> the name of the unit, or is that just to point out it's a backlight? If
> it's the latter, drop it.
>
> Are these all very similar? Can I use a particular string as a fallback?
>
> It followed video/backlgiht/ file naming. It is fixed at v4


> To allow for future expansion, the addition of notes, and to make this
> easier to read, I would recommend formatting this something like:
>
> - compatible: should contain at least one of:
>   * "ti,tps61158"
>   * "ti,tps61161"
>   * "ti,tps61163"
>   * "ti,tps61165"
>
> > +- rfa_en: enable request for acknowledge. ( 0 : disable , 1 : enable )
>
> Use empty properties for describing booleans.
>
> It is fixed to empty properties at v4

That said, why does this need to be in the DT? When would I want this
> and when wouldn't I? Why can't the driver choose?
>
> > +- en_gpio_num: gpio number for en pin.
>
> Use the GPIO bindings. The numbering Linux uses internally is completely
> arbitrary, so this is completely broken.
>
> It is fixed to use GPIO bindings at v4

> Are there other pins we might need to describe? Regulators? Clocks?
>
> There are only three input pins, CTRL, Vin and comp and it can control
brightness only
using one line interface.

> Mark.
>
Thank you.

--089e012949861a79cb04fd4415cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello. <br><div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Thank you for your comment. <br></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">2014-06-25 18:32 GMT+09:00 Mark =
Rutland <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.rutland@arm.com" targe=
t=3D"_blank">mark.rutland@arm.com</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Please fix the subject: this is a _binding_, not a driver.<br>
<div class=3D""><br>
On Tue, Jun 24, 2014 at 08:18:50AM +0100, Daniel Jeong wrote:<br>
&gt; This commit is about tps611xx device tree documentation.<br>
&gt;<br>
&gt; Signed-off-by: Daniel Jeong &lt;<a href=3D"mailto:gshark.jeong@gmail.c=
om">gshark.jeong@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../video/backlight/tps611xx-backlight.txt =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 16 ++++++++++++++++<br>
&gt; =C2=A01 file changed, 16 insertions(+)<br>
&gt; =C2=A0create mode 100644 Documentation/devicetree/bindings/video/backl=
ight/tps611xx-backlight.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/video/backlight/tps611x=
x-backlight.txt b/Documentation/devicetree/bindings/video/backlight/tps611x=
x-backlight.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..01f110d<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/video/backlight/tps611xx-backl=
ight.txt<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +TPS611xx family of backlight driver based on EasyScale.<br>
&gt; +<br>
&gt; +It supports tps61158, tps61161, tps61163 and tps61165.<br>
<br>
</div>What supports these? The driver?<br>
<br>
The binding should describe the _hardware_, not the driver.<br>
<div class=3D""><br>
&gt; +Required properties:<br>
&gt; +- compatible: &quot;ti,tps61158_bl&quot;, &quot;ti,tps61161_bl&quot;,=
 &quot;ti,tps61163_bl&quot;, &quot;ti,tps61165_bl&quot;<br>
<br>
</div>Use &#39;-&#39; rather than &#39;_&#39; in compatible strings and pro=
perties.<br>
<br>
Is there any reason for the &quot;bl&quot; suffix? Does that actually form =
part of<br>
the name of the unit, or is that just to point out it&#39;s a backlight? If=
<br>
it&#39;s the latter, drop it.<br>
<br>
Are these all very similar? Can I use a particular string as a fallback?<br=
>
<br></blockquote><div>It followed video/backlgiht/ file naming. It is fixed=
 at v4</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">

To allow for future expansion, the addition of notes, and to make this<br>
easier to read, I would recommend formatting this something like:<br>
<br>
- compatible: should contain at least one of:<br>
=C2=A0 * &quot;ti,tps61158&quot;<br>
=C2=A0 * &quot;ti,tps61161&quot;<br>
=C2=A0 * &quot;ti,tps61163&quot;<br>
=C2=A0 * &quot;ti,tps61165&quot;<br>
<div class=3D""><br>
&gt; +- rfa_en: enable request for acknowledge. ( 0 : disable , 1 : enable =
)<br>
<br>
</div>Use empty properties for describing booleans.<br>
<br></blockquote><div>It is fixed to empty properties at v4 <br><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
That said, why does this need to be in the DT? When would I want this<br>
and when wouldn&#39;t I? Why can&#39;t the driver choose?<br>
<div class=3D""><br>
&gt; +- en_gpio_num: gpio number for en pin.<br>
<br>
</div>Use the GPIO bindings. The numbering Linux uses internally is complet=
ely<br>
arbitrary, so this is completely broken.<br>
<br></blockquote><div>It is fixed to use GPIO bindings at v4 <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Are there other pins we might need to describe? Regulators? Clocks?<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v>There are only three input pins, CTRL, Vin and comp and it can control br=
ightness only <br></div><div>using one line interface. <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<span class=3D""><font color=3D"#888888">
Mark.<br>
</font></span></blockquote></div>Thank you.<br></div><div class=3D"gmail_ex=
tra"><br></div></div></div>

--089e012949861a79cb04fd4415cd--
