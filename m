Return-Path: <SRS0=RBed=IA=gmail.com=ykaneko0929@kernel.org>
MIME-Version: 1.0
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <1522759385-17661-2-git-send-email-ykaneko0929@gmail.com> <20180509181110.56ylpjqtefwnau3r@verge.net.au>
In-Reply-To: <20180509181110.56ylpjqtefwnau3r@verge.net.au>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 14 May 2018 06:11:59 +0900
Message-ID: <CAH1o70JNjsgeb5CHPZs3UunGR6jg6_C3d+EZjWs_B0389Z2Y-A@mail.gmail.com>
Subject: Re: [PATCH/RFT v3 1/3] thermal: rcar_thermal: add r8a77995 support
Content-Type: multipart/alternative; boundary="0000000000007a420a056c1cd2b8"
To: Simon Horman <horms@verge.net.au>
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--0000000000007a420a056c1cd2b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon-san,

2018=E5=B9=B45=E6=9C=8810=E6=97=A5(=E6=9C=A8) 3:11 Simon Horman <horms@verg=
e.net.au>:

> On Tue, Apr 03, 2018 at 09:43:03PM +0900, Yoshihiro Kaneko wrote:
> > Add support for R-Car D3 (r8a77995) thermal sensor.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > ---
> >  drivers/thermal/rcar_thermal.c | 154
> ++++++++++++++++++++++++++++++++---------
> >  1 file changed, 122 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/thermal/rcar_thermal.c
> b/drivers/thermal/rcar_thermal.c
> > index 73e5fee..5ec47a9 100644
> > --- a/drivers/thermal/rcar_thermal.c
> > +++ b/drivers/thermal/rcar_thermal.c
> > @@ -58,10 +58,43 @@ struct rcar_thermal_common {
> >       spinlock_t lock;
> >  };
> >
> > +struct rcar_thermal_chip {
> > +     unsigned int use_of_thermal : 1;
> > +     unsigned int has_filonoff : 1;
> > +     unsigned int irq_per_ch : 1;
> > +     unsigned int needs_suspend_resume : 1;
> > +     unsigned int nirqs;
> > +};
> > +
> > +static const struct rcar_thermal_chip rcar_thermal =3D {
> > +     .use_of_thermal =3D 0,
> > +     .has_filonoff =3D 1,
> > +     .irq_per_ch =3D 0,
> > +     .needs_suspend_resume =3D 0,
> > +     .nirqs =3D 1,
> > +};
> > +
> > +static const struct rcar_thermal_chip rcar_gen2_thermal =3D {
> > +     .use_of_thermal =3D 1,
> > +     .has_filonoff =3D 1,
> > +     .irq_per_ch =3D 0,
> > +     .needs_suspend_resume =3D 0,
> > +     .nirqs =3D 1,
> > +};
> > +
> > +static const struct rcar_thermal_chip rcar_gen3_thermal =3D {
> > +     .use_of_thermal =3D 1,
> > +     .has_filonoff =3D 0,
> > +     .irq_per_ch =3D 1,
> > +     .needs_suspend_resume =3D 1,
> > +     .nirqs =3D 2,
> > +};
>
> The binding and dts patches in this series describe 3 interrupts
> for R-Car D3. But the above specifies two. Am I missing something obvious=
?


R-Car D3 has 3 interrupts, but this driver uses only 2 interrupts to detect
a temperature change, rise or fall.

--0000000000007a420a056c1cd2b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Simon-san,</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"auto">2018=E5=B9=B45=E6=9C=8810=E6=97=A5(=E6=9C=A8) 3:11 Simon Ho=
rman &lt;<a href=3D"mailto:horms@verge.net.au">horms@verge.net.au</a>&gt;:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Tue, Apr 03, 2018 at 09:43:03PM =
+0900, Yoshihiro Kaneko wrote:<br>
&gt; Add support for R-Car D3 (r8a77995) thermal sensor.<br>
&gt; <br>
&gt; Signed-off-by: Yoshihiro Kaneko &lt;<a href=3D"mailto:ykaneko0929@gmai=
l.com" target=3D"_blank">ykaneko0929@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/thermal/rcar_thermal.c | 154 +++++++++++++++++++++++++++=
+++++---------<br>
&gt;=C2=A0 1 file changed, 122 insertions(+), 32 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_the=
rmal.c<br>
&gt; index 73e5fee..5ec47a9 100644<br>
&gt; --- a/drivers/thermal/rcar_thermal.c<br>
&gt; +++ b/drivers/thermal/rcar_thermal.c<br>
&gt; @@ -58,10 +58,43 @@ struct rcar_thermal_common {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t lock;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +struct rcar_thermal_chip {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int use_of_thermal : 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int has_filonoff : 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int irq_per_ch : 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int needs_suspend_resume : 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int nirqs;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct rcar_thermal_chip rcar_thermal =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.use_of_thermal =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.has_filonoff =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.irq_per_ch =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.needs_suspend_resume =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.nirqs =3D 1,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct rcar_thermal_chip rcar_gen2_thermal =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.use_of_thermal =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.has_filonoff =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.irq_per_ch =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.needs_suspend_resume =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.nirqs =3D 1,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct rcar_thermal_chip rcar_gen3_thermal =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.use_of_thermal =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.has_filonoff =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.irq_per_ch =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.needs_suspend_resume =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.nirqs =3D 2,<br>
&gt; +};<br>
<br>
The binding and dts patches in this series describe 3 interrupts<br>
for R-Car D3. But the above specifies two. Am I missing something obvious?<=
/blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">R-Car D3 has 3 in=
terrupts, but this driver uses only 2 interrupts to detect a temperature ch=
ange, rise or fall.</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"></blockquote></div></div>

--0000000000007a420a056c1cd2b8--
