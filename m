Return-Path: <SRS0=ilLa=BD=leopardimaging.com=leonl@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171004131452.6yjaa57xr56v6jza@valkosipuli.retiisi.org.uk>
References: <20171002202649.10897-1-leonl@leopardimaging.com>
 <20171002202649.10897-2-leonl@leopardimaging.com> <20171004131452.6yjaa57xr56v6jza@valkosipuli.retiisi.org.uk>
From: Leon Luo <leonl@leopardimaging.com>
Date: Wed, 4 Oct 2017 10:54:23 -0700
Message-ID: <CADu3m9yioMBDUg5+rRsdkvDhfa7jDFWBhsZW5A-BR+sS4Ovx8w@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] media:imx274 V4l2 driver for Sony imx274 CMOS sensor
Content-Type: multipart/alternative; boundary="94eb2c069734557b10055abc4c1b"
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--94eb2c069734557b10055abc4c1b
Content-Type: text/plain; charset="UTF-8"

You are right. I will fix it. Thanks.

Regards,
Leon Luo
1130 Cadillac CT
Milpitas, CA 95035
Phone: (510)371-1169
Fax: (408) 217-1960
Email: leonl@leopardimaging.com
www.leopardimaging.com

On Wed, Oct 4, 2017 at 6:14 AM, Sakari Ailus <sakari.ailus@iki.fi> wrote:

> Hi Leon,
>
> One more question below.
>
> On Mon, Oct 02, 2017 at 01:26:49PM -0700, Leon Luo wrote:
> ...
> > +/*
> > + * imx274_set_frame_interval - Function called when setting frame
> interval
> > + * @priv: Pointer to device structure
> > + * @frame_interval: Variable for frame interval
> > + *
> > + * Change frame interval by updating VMAX value
> > + * The caller should hold the mutex lock imx274->lock if necessary
> > + *
> > + * Return: 0 on success
> > + */
> > +static int imx274_set_frame_interval(struct stimx274 *priv,
> > +                                  struct v4l2_fract frame_interval)
> > +{
> > +     int err;
> > +     u32 frame_length, req_frame_rate;
> > +     u16 svr;
> > +     u16 hmax;
> > +     u8 reg_val[2];
> > +
> > +     dev_dbg(&priv->client->dev, "%s: input frame interval = %d / %d",
> > +             __func__, frame_interval.numerator,
> > +             frame_interval.denominator);
> > +
> > +     if (frame_interval.denominator == 0) {
>
> Shouldn't this be numerator? If numerator is 0, then there will be division
> by zero below.
>
> > +             err = -EINVAL;
> > +             goto fail;
> > +     }
> > +
> > +     req_frame_rate = (u32)(frame_interval.denominator
> > +                             / frame_interval.numerator);
> > +
> > +     /* boundary check */
> > +     if (req_frame_rate > max_frame_rate[priv->mode_index]) {
> > +             frame_interval.numerator = 1;
> > +             frame_interval.denominator =
> > +                                     max_frame_rate[priv->mode_index];
> > +     } else if (req_frame_rate < IMX274_MIN_FRAME_RATE) {
> > +             frame_interval.numerator = 1;
> > +             frame_interval.denominator = IMX274_MIN_FRAME_RATE;
> > +     }
> > +
> > +     /*
> > +      * VMAX = 1/frame_rate x 72M / (SVR+1) / HMAX
> > +      * frame_length (i.e. VMAX) = (frame_interval) x 72M /(SVR+1) /
> HMAX
> > +      */
> > +
> > +     /* SVR */
> > +     err = imx274_read_reg(priv, IMX274_SVR_REG_LSB, &reg_val[0]);
> > +     if (err)
> > +             goto fail;
> > +     err = imx274_read_reg(priv, IMX274_SVR_REG_MSB, &reg_val[1]);
> > +     if (err)
> > +             goto fail;
> > +     svr = (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : register SVR = %d\n", __func__, svr);
> > +
> > +     /* HMAX */
> > +     err = imx274_read_reg(priv, IMX274_HMAX_REG_LSB, &reg_val[0]);
> > +     if (err)
> > +             goto fail;
> > +     err = imx274_read_reg(priv, IMX274_HMAX_REG_MSB, &reg_val[1]);
> > +     if (err)
> > +             goto fail;
> > +     hmax = (reg_val[1] << IMX274_SHIFT_8_BITS) + reg_val[0];
> > +     dev_dbg(&priv->client->dev,
> > +             "%s : register HMAX = %d\n", __func__, hmax);
> > +
> > +     frame_length = IMX274_PIXCLK_CONST1 / (svr + 1) / hmax
> > +                                     * frame_interval.numerator
> > +                                     / frame_interval.denominator;
> > +
> > +     err = imx274_set_frame_length(priv, frame_length);
> > +     if (err)
> > +             goto fail;
> > +
> > +     priv->frame_interval = frame_interval;
> > +     return 0;
> > +
> > +fail:
> > +     dev_err(&priv->client->dev, "%s error = %d\n", __func__, err);
> > +     return err;
> > +}
>
> --
> Regards,
>
> Sakari Ailus
> e-mail: sakari.ailus@iki.fi
>

--94eb2c069734557b10055abc4c1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You are right. I will fix it. Thanks.</div><div class=3D"g=
mail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature">Regards,<br>Leon Luo<br>1130 Cadillac CT<br>Milpi=
tas, CA 95035<br>Phone: (510)371-1169<br>Fax: (408) 217-1960<br>Email: <a h=
ref=3D"mailto:leonl@leopardimaging.com" target=3D"_blank">leonl@leopardimag=
ing.com</a><br><a href=3D"http://www.leopardimaging.com" target=3D"_blank">=
www.leopardimaging.com</a><br></div></div>
<br><div class=3D"gmail_quote">On Wed, Oct 4, 2017 at 6:14 AM, Sakari Ailus=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:sakari.ailus@iki.fi" target=3D"_bl=
ank">sakari.ailus@iki.fi</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Hi Leon,<br>
<br>
One more question below.<br>
<br>
On Mon, Oct 02, 2017 at 01:26:49PM -0700, Leon Luo wrote:<br>
...<br>
<span class=3D"">&gt; +/*<br>
&gt; + * imx274_set_frame_interval - Function called when setting frame int=
erval<br>
&gt; + * @priv: Pointer to device structure<br>
&gt; + * @frame_interval: Variable for frame interval<br>
&gt; + *<br>
&gt; + * Change frame interval by updating VMAX value<br>
&gt; + * The caller should hold the mutex lock imx274-&gt;lock if necessary=
<br>
&gt; + *<br>
&gt; + * Return: 0 on success<br>
&gt; + */<br>
&gt; +static int imx274_set_frame_interval(<wbr>struct stimx274 *priv,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v4l2_fract frame_i=
nterval)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 frame_length, req_frame_rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 svr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 hmax;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg_val[2];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev, &quot;%s: i=
nput frame interval =3D %d / %d&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__, frame_inter=
val.numerator,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.denomi=
nator);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (frame_interval.denominator =3D=3D 0) {<br>
<br>
</span>Shouldn&#39;t this be numerator? If numerator is 0, then there will =
be division<br>
by zero below.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0req_frame_rate =3D (u32)(frame_interval.<wbr>deno=
minator<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ frame_interval.numerator);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* boundary check */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (req_frame_rate &gt; max_frame_rate[priv-&gt;m=
ode_<wbr>index]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.numera=
tor =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.denomi=
nator =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_frame_ra=
te[priv-&gt;mode_<wbr>index];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (req_frame_rate &lt; IMX274_MIN_FRAME_R=
ATE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.numera=
tor =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frame_interval.denomi=
nator =3D IMX274_MIN_FRAME_RATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * VMAX =3D 1/frame_rate x 72M / (SVR+1) / HMAX<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 * frame_length (i.e. VMAX) =3D (frame_interval) =
x 72M /(SVR+1) / HMAX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* SVR */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_SVR_REG_LSB,=
 &amp;reg_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_SVR_REG_MSB,=
 &amp;reg_val[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0svr =3D (reg_val[1] &lt;&lt; IMX274_SHIFT_8_BITS)=
 + reg_val[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : register S=
VR =3D %d\n&quot;, __func__, svr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* HMAX */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_HMAX_REG_LSB=
, &amp;reg_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_read_reg(priv, IMX274_HMAX_REG_MSB=
, &amp;reg_val[1]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hmax =3D (reg_val[1] &lt;&lt; IMX274_SHIFT_8_BITS=
) + reg_val[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;priv-&gt;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s : register H=
MAX =3D %d\n&quot;, __func__, hmax);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0frame_length =3D IMX274_PIXCLK_CONST1 / (svr + 1)=
 / hmax<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* frame_inte=
rval.numerator<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ frame_inte=
rval.denominator;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D imx274_set_frame_length(priv, frame_lengt=
h);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;frame_interval =3D frame_interval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;priv-&gt;client-&gt;dev, &quot;%s er=
ror =3D %d\n&quot;, __func__, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Regards,<br>
<br>
Sakari Ailus<br>
e-mail: <a href=3D"mailto:sakari.ailus@iki.fi">sakari.ailus@iki.fi</a><br>
</font></span></blockquote></div><br></div>

--94eb2c069734557b10055abc4c1b--
