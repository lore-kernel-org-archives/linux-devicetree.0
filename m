From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v13 3/8] clk: Use devm_ in the register fixed factor clock
Date: Fri, 12 Oct 2018 15:08:17 -0700
Message-ID: <153938209728.5275.8811599608746761178@swboyd.mtv.corp.google.com>
References: <20180614215358.11264-1-ilia.lin@gmail.com>
 <20180614215358.11264-4-ilia.lin@gmail.com>
 <CAHYQr0rR=mcV-SxZFW+5M4CTUaTv_f_bruyq91HiGP6sqUZ3Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHYQr0rR=mcV-SxZFW+5M4CTUaTv_f_bruyq91HiGP6sqUZ3Yw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Salveti <rsalveti@rsalveti.net>, ilia.lin@gmail.com
Cc: ilialin@codeaurora.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, will.deacon@arm.com, Amit Kucheria <amit.kucheria@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Ricardo Salveti (2018-09-14 11:53:02)
> On Thu, Jun 14, 2018 at 6:55 PM <ilia.lin@gmail.com> wrote:
> >
> > From: Ilia Lin <ilialin@codeaurora.org>
> >
> > Use devm_clk_hw_register instead of clk_hw_register
> > to simplify the usage of this API. This way drivers that call
> > the clk_hw_register_fixed_factor won't need to maintain
> > a data structure for further cleanup.
> >
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > Tested-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  drivers/clk/clk-fixed-factor.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-fac=
tor.c
> > index a5d402de5584..8e39bda8e596 100644
> > --- a/drivers/clk/clk-fixed-factor.c
> > +++ b/drivers/clk/clk-fixed-factor.c
> > @@ -94,7 +94,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct de=
vice *dev,
> >         init.num_parents =3D 1;
> >
> >         hw =3D &fix->hw;
> > -       ret =3D clk_hw_register(dev, hw);
> > +       ret =3D devm_clk_hw_register(dev, hw);
> =

> Not sure what is the current state of this patch-set, but this change
> breaks drivers calling clk_hw_register_fixed_factor with a NULL dev
> (e.g. imx_clk_fixed_factor), as devm_clk_hw_register needs a valid dev
> for devres_add to work.
> =


Yep. Probably better to just have a driver register the clk_hw structure
itself with the clk framework vs. trying to get it right here in the
generic type registration function.
