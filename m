From: Priit Laes <plaes@plaes.org>
Subject: Re: [linux-sunxi] [PATCH 2/8] regulator: axp20x: add support for
 set_ramp_delay for AXP209
Date: Wed, 12 Dec 2018 11:02:40 +0000
Message-ID: <20181212110239.uizmnldvluf4dlng@plaes.org>
References: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
 <2bfe47f173fe72a30b0036dcdeebc2123962ff33.1544466940.git-series.plaes@plaes.org>
 <CAGRGNgX2d4u0HP2xLxcGhH2QkN-GdYZf4iKV_XAn53A8z0y8JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGRGNgX2d4u0HP2xLxcGhH2QkN-GdYZf4iKV_XAn53A8z0y8JQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Olliver Schinagl <oliver@schinagl.nl>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 12:14:57AM +1100, Julian Calaby wrote:
> Hi Priit and Olliver,
> 
> On Tue, Dec 11, 2018 at 5:42 AM Priit Laes <plaes@plaes.org> wrote:
> >
> > From: Olliver Schinagl <oliver@schinagl.nl>
> >
> > The AXP209 supports ramping up voltages on several regulators such as
> > DCDC2 and LDO3.
> >
> > This patch adds preliminary support for the regulator-ramp-delay property
> > for these 2 regulators. Note that the voltage ramp only works when
> > regulator is already enabled. E.g. when going from say 0.7 V to 3.6 V.
> >
> > When turning on the regulator, no voltage ramp is performed in hardware.
> >
> > What this means, is that if the bootloader brings up the voltage at 0.7 V,
> > the ramp delay property is properly applied. If however, the bootloader
> > leaves the power off, no ramp delay is applied when the power is
> > enabled by the regulator framework.
> >
> > Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
> > Signed-off-by: Priit Laes <plaes@plaes.org>
> > ---
> >  drivers/regulator/axp20x-regulator.c | 85 +++++++++++++++++++++++++++++-
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> > index 9a2db28..1d9fa62 100644
> > --- a/drivers/regulator/axp20x-regulator.c
> > +++ b/drivers/regulator/axp20x-regulator.c
> > @@ -346,6 +357,79 @@
> >                 .ops            = &axp20x_ops_range,                            \
> >         }
> >
> > +static const int axp209_dcdc2_ldo3_slew_rates[] = {
> > +       1600,
> > +        800,
> > +};
> > +
> > +static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
> > +{
> > +       struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
> > +       const struct regulator_desc *desc = rdev->desc;
> > +       u8 reg, mask, enable, cfg = 0xff;
> > +       const int *slew_rates;
> > +       int rate_count = 0;
> > +
> > +       if (!rdev)
> > +               return -EINVAL;
> > +
> > +       switch (axp20x->variant) {
> > +       case AXP209_ID:
> > +               if (desc->id == AXP20X_DCDC2) {
> 
> Is slew_rates supposed to be set here?

Yes, nice catch.
> 
> > +                       rate_count = ARRAY_SIZE(axp209_dcdc2_ldo3_slew_rates);
> > +                       reg = AXP20X_DCDC2_LDO3_V_RAMP;
> > +                       mask = AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_RATE_MASK |
> > +                              AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_EN_MASK;
> > +                       enable = (ramp > 0) ?
> > +                                AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_EN :
> > +                                !AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_EN;
> > +                       break;
> > +               }
> > +
> > +               if (desc->id == AXP20X_LDO3) {
> > +                       slew_rates = axp209_dcdc2_ldo3_slew_rates;
> > +                       rate_count = ARRAY_SIZE(axp209_dcdc2_ldo3_slew_rates);
> > +                       reg = AXP20X_DCDC2_LDO3_V_RAMP;
> > +                       mask = AXP20X_DCDC2_LDO3_V_RAMP_LDO3_RATE_MASK |
> > +                              AXP20X_DCDC2_LDO3_V_RAMP_LDO3_EN_MASK;
> > +                       enable = (ramp > 0) ?
> > +                                AXP20X_DCDC2_LDO3_V_RAMP_LDO3_EN :
> > +                                !AXP20X_DCDC2_LDO3_V_RAMP_LDO3_EN;
> > +                       break;
> > +               }
> > +
> > +               if (rate_count > 0)
> > +                       break;
> 
> You could save one to two tests by combining the above three if statements, i.e.
> 
> if (DCDC2) {
>     // set DCDC2 stuff
> 
>     break;
> } else if (LDO3) {
>     // set LDO3 stuff
> 
>     break;
> }

OK, will look into it.
> 
> As written, the rate_count > 0 test will never be true as every block
> that sets rate_count breaks out of the switch block.

Yes, it is somewhat superfluous, as each regulator which supports ramping
should break out of the switch itself.

> You could then calculate rate_count below the switch block.
>
> > +
> > +               /* fall through */
> > +       default:
> > +               /* Not supported for this regulator */
> > +               return -ENOTSUPP;
> > +       }
> > +
> > +       if (ramp == 0) {
> > +               cfg = enable;
> > +       } else {
> > +               int i;
> > +
> > +               for (i = 0; i < rate_count; i++) {
> > +                       if (ramp <= slew_rates[i])
> > +                               cfg = AXP20X_DCDC2_LDO3_V_RAMP_LDO3_RATE(i);
> > +                       else
> > +                               break;
> > +               }
> > +
> > +               if (cfg == 0xff) {
> > +                       dev_err(axp20x->dev, "unsupported ramp value %d", ramp);
> > +                       return -EINVAL;
> > +               }
> > +
> > +               cfg |= enable;
> > +       }
> > +
> > +       return regmap_update_bits(axp20x->regmap, reg, mask, cfg);
> > +}
> > +
> 
> 
> 
> -- 
> Julian Calaby
> 
> Email: julian.calaby@gmail.com
> Profile: http://www.google.com/profiles/julian.calaby/
