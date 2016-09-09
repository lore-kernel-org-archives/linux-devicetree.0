Return-Path: <olimpiu@arcticsand.com>
MIME-Version: 1.0
In-Reply-To: <20160823182057.GA8472@rob-hp-laptop>
References: <1471893084-4551-1-git-send-email-olimpiu@arcticsand.com> <20160823182057.GA8472@rob-hp-laptop>
From: Olimpiu Dejeu <olimpiu@arcticsand.com>
Date: Fri, 9 Sep 2016 14:18:44 -0400
Message-ID: <CAF-XLW+v9c-+W2Jr2gjN+6ziijDHRtZ6_a9Rpb6TZ5+4CfALJw@mail.gmail.com>
Subject: Re: [PATCH] backlight: arcxcnn: devicetree bindings for ArticSand devices
Content-Type: multipart/alternative; boundary=001a1142b96a433962053c172def
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, jg1.han@samsung.com, Olimpiu Dejeu <olimpiu@arcticsand.com>
List-ID: <devicetree@vger.kernel.org>

--001a1142b96a433962053c172def
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 23, 2016 at 2:20 PM, Rob Herring <robh@kernel.org> wrote:

> On Mon, Aug 22, 2016 at 03:11:24PM -0400, Olimpiu Dejeu wrote:
> > This is the device tree bindings documentation file
> >
> > Signed-off-by: Olimpiu Dejeu <olimpiu@arcticsand.com>
> >
> > ---
> >  .../bindings/video/backlight/arcxcnn.txt           | 29
> ++++++++++++++++++++++
>
>
Check your directory location. Things have moved.
>
> Not sure what you mean. This seems to be the right place. Please advise.


> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/video/backlight/
> arcxcnn.txt
> >
> > diff --git a/Documentation/devicetree/bindings/video/backlight/arcxcnn.txt
> b/Documentation/devicetree/bindings/video/backlight/arcxcnn.txt
> > new file mode 100644
> > index 0000000..9cd7315
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/video/backlight/arcxcnn.txt
> > @@ -0,0 +1,29 @@
> > +arcxcnn bindings
> > +
> > +Required properties:
> > +  - compatible: "arc,arcxcnn", "arc,arc2c0608"
>
> One per line please.
>
> Is arcxcnn a specific chip? If not drop it. No wildcards in compatible
> strings.
>
> Wild-cards can be dropped but there could be a large family of similar
chips that would be supported with this one driver. How would one add
support for a range of chips, some of which don't exist yet?


> > +  - reg: I2C slave address (u8)
> > +
> > +Optional properties:
> > +  - bl-name: Backlight device name (string)
>
> Use the common bindings. label?
>
> > +  - init-brt: Initial value of backlight brightness (u32) low 16 bits
> used
>
> Use common bindings.
>

Ok


> > +  - pwm-period: PWM period value. Set only PWM input mode used (u32)
> > +  - prg-addr: Register address of ROM area to be updated (u32) low 8
> bits used
> > +  - prg-val: Register value to be updated (u32) low 8 bits used
>
> What is this for? This should be a specific property or properties to do
> explicit things, not a generic fill registers/rom with magic values.
>
> We need to expose some registers for test without exposing underlying
functionality. Do you suggest not documenting this in the bindings yet
keeping the code in the driver? We followed the pattern from the lp855x_bl
driver.


> > +
> > +Example:
> > +
> > +     /* ARC2C0608 */
> > +     backlight@30 {
> > +             compatible = "arc,arc2c0608";
> > +             reg = <0x30>;
> > +
> > +             init-brt = <123>;
> > +
> > +             /* LED0+1 string enabled */
> > +             prg_06h {
> > +                     prg-addr = <0x06>;
> > +                     prg-val = <0x83>;
> > +             };
> > +
> > +     };
> > --
> > 1.9.1
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a1142b96a433962053c172def
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>
<div class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue, Aug 23, 2016 =
at 2:20 PM, Rob Herring <span dir=3D"ltr">&lt;<a href=3D"mailto:robh@kernel=
.org" target=3D"_blank">robh@kernel.org</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On Mon, Aug 22, 2016 at 03:11:24PM -0400, Olimpiu Deje=
u wrote:<br>
&gt; This is the device tree bindings documentation file<br>
&gt;<br>
&gt; Signed-off-by: Olimpiu Dejeu &lt;<a href=3D"mailto:olimpiu@arcticsand.=
com">olimpiu@arcticsand.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/video/backlight/<wbr>arcxcnn.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++++++++++++++++++<br>
=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Check your directory location. Things have moved.<br>
<br></blockquote><div>Not sure what you mean. This seems to be the right pl=
ace. Please advise.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 1 file changed, 29 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/<wbr>bindings/video/=
backlight/<wbr>arcxcnn.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/<wbr>bindings/video/backlight/<w=
br>arcxcnn.txt b/Documentation/devicetree/<wbr>bindings/video/backlight/<wb=
r>arcxcnn.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..9cd7315<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/<wbr>bindings/video/backlight/<wbr>arcx=
cnn.txt<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +arcxcnn bindings<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +=C2=A0 - compatible: &quot;arc,arcxcnn&quot;, &quot;arc,arc2c0608&quo=
t;<br>
<br>
One per line please.<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
Is arcxcnn a specific chip? If not drop it. No wildcards in compatible<br>
strings.<br>
<br></blockquote><div>Wild-cards can be dropped but there could be a large =
family of similar chips that would be supported with this one driver. How w=
ould one add support for a range of chips, some of which don&#39;t exist ye=
t?<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +=C2=A0 - reg: I2C slave address (u8)<br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; +=C2=A0 - bl-name: Backlight device name (string)<br>
<br>
Use the common bindings. label?<br>
<br>
&gt; +=C2=A0 - init-brt: Initial value of backlight brightness (u32) low 16=
 bits used<br>
<br>
Use common bindings.<br></blockquote><div>=C2=A0<br>Ok<br><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
&gt; +=C2=A0 - pwm-period: PWM period value. Set only PWM input mode used (=
u32)<br>
&gt; +=C2=A0 - prg-addr: Register address of ROM area to be updated (u32) l=
ow 8 bits used<br>
&gt; +=C2=A0 - prg-val: Register value to be updated (u32) low 8 bits used<=
br>
<br>
What is this for? This should be a specific property or properties to do<br=
>
explicit things, not a generic fill registers/rom with magic values.<br>
<br></blockquote><div>We need to expose some registers for test without exp=
osing underlying functionality. Do you suggest not documenting this in the =
bindings yet keeping the code in the driver? We followed the pattern from t=
he lp855x_bl driver.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* ARC2C0608 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0backlight@30 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
arc,arc2c0608&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x30&gt;;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init-brt =3D &lt;123&=
gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* LED0+1 string enab=
led */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prg_06h {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0prg-addr =3D &lt;0x06&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0prg-val =3D &lt;0x83&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe devicet=
ree&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordo=
mo-info.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<=
wbr>majordomo-info.html</a><br>
</font></span></blockquote></div><br></div></div>

--001a1142b96a433962053c172def--
