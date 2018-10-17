Return-Path: <SRS0=LBXv=M5=gmail.com=ilia.lin@kernel.org>
MIME-Version: 1.0
References: <20180614215358.11264-1-ilia.lin@gmail.com> <20180614215358.11264-4-ilia.lin@gmail.com>
 <CAHYQr0rR=mcV-SxZFW+5M4CTUaTv_f_bruyq91HiGP6sqUZ3Yw@mail.gmail.com>
 <153938209728.5275.8811599608746761178@swboyd.mtv.corp.google.com>
 <20181014202122.GA13473@centauri.lan> <153979087829.5275.6249138489771592939@swboyd.mtv.corp.google.com>
In-Reply-To: <153979087829.5275.6249138489771592939@swboyd.mtv.corp.google.com>
From: Ilia Lin <ilia.lin@gmail.com>
Date: Wed, 17 Oct 2018 20:20:46 +0300
Message-ID: <CA+5LGR12ZOzwtMoM-k=OY8YP20rujOTwivaHqQfzi4u2tPheCg@mail.gmail.com>
Subject: Re: [PATCH v13 3/8] clk: Use devm_ in the register fixed factor clock
Content-Type: multipart/alternative; boundary="000000000000c556fa05786fe4fe"
To: Stephen Boyd <sboyd@kernel.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, bjorn.andersson@linaro.org, rsalveti@rsalveti.net, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--000000000000c556fa05786fe4fe
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

Thanks for the feedback!

Niklas,

I hope I'll have the time over the weekend to address the comments and
submit new series.


BR,
Ilia Lin



On Wed, Oct 17, 2018 at 6:41 PM Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Niklas Cassel (2018-10-14 13:21:22)
> > On Fri, Oct 12, 2018 at 03:08:17PM -0700, Stephen Boyd wrote:
> > > Quoting Ricardo Salveti (2018-09-14 11:53:02)
> > > > On Thu, Jun 14, 2018 at 6:55 PM <ilia.lin@gmail.com> wrote:
> > > > >
> > > > > From: Ilia Lin <ilialin@codeaurora.org>
> > > > >
> > > > > Use devm_clk_hw_register instead of clk_hw_register
> > > > > to simplify the usage of this API. This way drivers that call
> > > > > the clk_hw_register_fixed_factor won't need to maintain
> > > > > a data structure for further cleanup.
> > > > >
> > > > > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > > > > Tested-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > > ---
> > > > >  drivers/clk/clk-fixed-factor.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/clk/clk-fixed-factor.c
> b/drivers/clk/clk-fixed-factor.c
> > > > > index a5d402de5584..8e39bda8e596 100644
> > > > > --- a/drivers/clk/clk-fixed-factor.c
> > > > > +++ b/drivers/clk/clk-fixed-factor.c
> > > > > @@ -94,7 +94,7 @@ struct clk_hw
> *clk_hw_register_fixed_factor(struct device *dev,
> > > > >         init.num_parents = 1;
> > > > >
> > > > >         hw = &fix->hw;
> > > > > -       ret = clk_hw_register(dev, hw);
> > > > > +       ret = devm_clk_hw_register(dev, hw);
> > > >
> > > > Not sure what is the current state of this patch-set, but this change
> > > > breaks drivers calling clk_hw_register_fixed_factor with a NULL dev
> > > > (e.g. imx_clk_fixed_factor), as devm_clk_hw_register needs a valid
> dev
> > > > for devres_add to work.
> > > >
> > >
> > > Yep. Probably better to just have a driver register the clk_hw
> structure
> > > itself with the clk framework vs. trying to get it right here in the
> > > generic type registration function.
> > >
> >
> > Hello Ilia, Stephen,
> >
> > As you know this patch series is needed to get DVFS working on msm8996.
> >
> > Ilia, are you planning on submitting a new patch set for this, or would
> > you prefer if we submitted a new patch version for you?
> >
> > Looking at this patch series, this appears to be the only outstanding
> > review comment.
>
> Sorry, you were too hopeful :/
>
> > Stephen, do you have any review comments on this series?
> >
>
> Yes, my nitpick should be easy to resolve and then it's just a few open
> questions after that. Otherwise things seem fine and the CPU can run
> really fast without bumping up the voltages?
>
>

--000000000000c556fa05786fe4fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stephen,<div><br></div><div>Thanks for the feedback!</d=
iv><div><br></div><div>Niklas,</div><div><br></div><div>I hope I&#39;ll hav=
e the time over the weekend to address the comments and submit new series.<=
/div><div><br></div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>BR=
,</div>
<div>Ilia Lin<br></div>
<div>
<p></p></div></div></div></div><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 6:41 PM Stephen Boyd &lt;<a hre=
f=3D"mailto:sboyd@kernel.org">sboyd@kernel.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Quoting Niklas Cassel (2018-10-14 13:21:22)<br>
&gt; On Fri, Oct 12, 2018 at 03:08:17PM -0700, Stephen Boyd wrote:<br>
&gt; &gt; Quoting Ricardo Salveti (2018-09-14 11:53:02)<br>
&gt; &gt; &gt; On Thu, Jun 14, 2018 at 6:55 PM &lt;<a href=3D"mailto:ilia.l=
in@gmail.com" target=3D"_blank">ilia.lin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; From: Ilia Lin &lt;<a href=3D"mailto:ilialin@codeaurora=
.org" target=3D"_blank">ilialin@codeaurora.org</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Use devm_clk_hw_register instead of clk_hw_register<br>
&gt; &gt; &gt; &gt; to simplify the usage of this API. This way drivers tha=
t call<br>
&gt; &gt; &gt; &gt; the clk_hw_register_fixed_factor won&#39;t need to main=
tain<br>
&gt; &gt; &gt; &gt; a data structure for further cleanup.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Ilia Lin &lt;<a href=3D"mailto:ilialin@c=
odeaurora.org" target=3D"_blank">ilialin@codeaurora.org</a>&gt;<br>
&gt; &gt; &gt; &gt; Tested-by: Amit Kucheria &lt;<a href=3D"mailto:amit.kuc=
heria@linaro.org" target=3D"_blank">amit.kucheria@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 drivers/clk/clk-fixed-factor.c | 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/c=
lk/clk-fixed-factor.c<br>
&gt; &gt; &gt; &gt; index a5d402de5584..8e39bda8e596 100644<br>
&gt; &gt; &gt; &gt; --- a/drivers/clk/clk-fixed-factor.c<br>
&gt; &gt; &gt; &gt; +++ b/drivers/clk/clk-fixed-factor.c<br>
&gt; &gt; &gt; &gt; @@ -94,7 +94,7 @@ struct clk_hw *clk_hw_register_fixed_=
factor(struct device *dev,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init.num_parents =3D 1=
;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D &amp;fix-&gt;hw=
;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_hw_register(dev=
, hw);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_clk_hw_registe=
r(dev, hw);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Not sure what is the current state of this patch-set, but th=
is change<br>
&gt; &gt; &gt; breaks drivers calling clk_hw_register_fixed_factor with a N=
ULL dev<br>
&gt; &gt; &gt; (e.g. imx_clk_fixed_factor), as devm_clk_hw_register needs a=
 valid dev<br>
&gt; &gt; &gt; for devres_add to work.<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Yep. Probably better to just have a driver register the clk_hw st=
ructure<br>
&gt; &gt; itself with the clk framework vs. trying to get it right here in =
the<br>
&gt; &gt; generic type registration function.<br>
&gt; &gt; <br>
&gt; <br>
&gt; Hello Ilia, Stephen,<br>
&gt; <br>
&gt; As you know this patch series is needed to get DVFS working on msm8996=
.<br>
&gt; <br>
&gt; Ilia, are you planning on submitting a new patch set for this, or woul=
d<br>
&gt; you prefer if we submitted a new patch version for you?<br>
&gt; <br>
&gt; Looking at this patch series, this appears to be the only outstanding<=
br>
&gt; review comment.<br>
<br>
Sorry, you were too hopeful :/<br>
<br>
&gt; Stephen, do you have any review comments on this series?<br>
&gt; <br>
<br>
Yes, my nitpick should be easy to resolve and then it&#39;s just a few open=
<br>
questions after that. Otherwise things seem fine and the CPU can run<br>
really fast without bumping up the voltages?<br>
<br>
</blockquote></div>

--000000000000c556fa05786fe4fe--
