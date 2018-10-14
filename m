Return-Path: <ilia.lin@kernel.org>
MIME-Version: 1.0
References: <20180614215358.11264-1-ilia.lin@gmail.com> <20180614215358.11264-4-ilia.lin@gmail.com>
 <CAHYQr0rR=mcV-SxZFW+5M4CTUaTv_f_bruyq91HiGP6sqUZ3Yw@mail.gmail.com> <153938209728.5275.8811599608746761178@swboyd.mtv.corp.google.com>
In-Reply-To: <153938209728.5275.8811599608746761178@swboyd.mtv.corp.google.com>
From: Ilia Lin <ilia.lin@kernel.org>
Date: Sun, 14 Oct 2018 09:49:34 +0300
Message-ID: <CA+5LGR2J1Tg3Rkpzk5YjbR=V4CBdz5H9j=XVv2uHyKbah5HgBQ@mail.gmail.com>
Subject: Re: [PATCH v13 3/8] clk: Use devm_ in the register fixed factor clock
Content-Type: multipart/alternative; boundary="000000000000f3ebc805782ab9da"
To: Stephen Boyd <sboyd@kernel.org>
Cc: rsalveti@rsalveti.net, Ilia Lin <ilialin@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--000000000000f3ebc805782ab9da
Content-Type: text/plain; charset="UTF-8"

Thanks! I'll do the change ASAP.

On Sat, Oct 13, 2018 at 1:08 AM Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Ricardo Salveti (2018-09-14 11:53:02)
> > On Thu, Jun 14, 2018 at 6:55 PM <ilia.lin@gmail.com> wrote:
> > >
> > > From: Ilia Lin <ilialin@codeaurora.org>
> > >
> > > Use devm_clk_hw_register instead of clk_hw_register
> > > to simplify the usage of this API. This way drivers that call
> > > the clk_hw_register_fixed_factor won't need to maintain
> > > a data structure for further cleanup.
> > >
> > > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > > Tested-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > ---
> > >  drivers/clk/clk-fixed-factor.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/clk-fixed-factor.c
> b/drivers/clk/clk-fixed-factor.c
> > > index a5d402de5584..8e39bda8e596 100644
> > > --- a/drivers/clk/clk-fixed-factor.c
> > > +++ b/drivers/clk/clk-fixed-factor.c
> > > @@ -94,7 +94,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct
> device *dev,
> > >         init.num_parents = 1;
> > >
> > >         hw = &fix->hw;
> > > -       ret = clk_hw_register(dev, hw);
> > > +       ret = devm_clk_hw_register(dev, hw);
> >
> > Not sure what is the current state of this patch-set, but this change
> > breaks drivers calling clk_hw_register_fixed_factor with a NULL dev
> > (e.g. imx_clk_fixed_factor), as devm_clk_hw_register needs a valid dev
> > for devres_add to work.
> >
>
> Yep. Probably better to just have a driver register the clk_hw structure
> itself with the clk framework vs. trying to get it right here in the
> generic type registration function.
>
>

--000000000000f3ebc805782ab9da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! I&#39;ll do the change ASAP.<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Sat, Oct 13, 2018 at 1:08 AM Stephen=
 Boyd &lt;<a href=3D"mailto:sboyd@kernel.org">sboyd@kernel.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Quoting Ricardo Salveti (2018-09=
-14 11:53:02)<br>
&gt; On Thu, Jun 14, 2018 at 6:55 PM &lt;<a href=3D"mailto:ilia.lin@gmail.c=
om" target=3D"_blank">ilia.lin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Ilia Lin &lt;<a href=3D"mailto:ilialin@codeaurora.org" targ=
et=3D"_blank">ilialin@codeaurora.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Use devm_clk_hw_register instead of clk_hw_register<br>
&gt; &gt; to simplify the usage of this API. This way drivers that call<br>
&gt; &gt; the clk_hw_register_fixed_factor won&#39;t need to maintain<br>
&gt; &gt; a data structure for further cleanup.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ilia Lin &lt;<a href=3D"mailto:ilialin@codeaurora.=
org" target=3D"_blank">ilialin@codeaurora.org</a>&gt;<br>
&gt; &gt; Tested-by: Amit Kucheria &lt;<a href=3D"mailto:amit.kucheria@lina=
ro.org" target=3D"_blank">amit.kucheria@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/clk/clk-fixed-factor.c | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fix=
ed-factor.c<br>
&gt; &gt; index a5d402de5584..8e39bda8e596 100644<br>
&gt; &gt; --- a/drivers/clk/clk-fixed-factor.c<br>
&gt; &gt; +++ b/drivers/clk/clk-fixed-factor.c<br>
&gt; &gt; @@ -94,7 +94,7 @@ struct clk_hw *clk_hw_register_fixed_factor(str=
uct device *dev,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init.num_parents =3D 1;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D &amp;fix-&gt;hw;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_hw_register(dev, hw);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_clk_hw_register(dev, hw)=
;<br>
&gt; <br>
&gt; Not sure what is the current state of this patch-set, but this change<=
br>
&gt; breaks drivers calling clk_hw_register_fixed_factor with a NULL dev<br=
>
&gt; (e.g. imx_clk_fixed_factor), as devm_clk_hw_register needs a valid dev=
<br>
&gt; for devres_add to work.<br>
&gt; <br>
<br>
Yep. Probably better to just have a driver register the clk_hw structure<br=
>
itself with the clk framework vs. trying to get it right here in the<br>
generic type registration function.<br>
<br>
</blockquote></div>

--000000000000f3ebc805782ab9da--
