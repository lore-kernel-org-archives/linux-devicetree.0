From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/8] regulator: axp20x: add support for
 set_ramp_delay for AXP209
Date: Wed, 12 Dec 2018 00:14:57 +1100
Message-ID: <CAGRGNgX2d4u0HP2xLxcGhH2QkN-GdYZf4iKV_XAn53A8z0y8JQ@mail.gmail.com>
References: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
 <2bfe47f173fe72a30b0036dcdeebc2123962ff33.1544466940.git-series.plaes@plaes.org>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQIP76OUQLBBXXQX3QAKGQEP7KT4GA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <2bfe47f173fe72a30b0036dcdeebc2123962ff33.1544466940.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Priit and Olliver,

On Tue, Dec 11, 2018 at 5:42 AM Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
>
> From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
>
> The AXP209 supports ramping up voltages on several regulators such as
> DCDC2 and LDO3.
>
> This patch adds preliminary support for the regulator-ramp-delay property
> for these 2 regulators. Note that the voltage ramp only works when
> regulator is already enabled. E.g. when going from say 0.7 V to 3.6 V.
>
> When turning on the regulator, no voltage ramp is performed in hardware.
>
> What this means, is that if the bootloader brings up the voltage at 0.7 V,
> the ramp delay property is properly applied. If however, the bootloader
> leaves the power off, no ramp delay is applied when the power is
> enabled by the regulator framework.
>
> Signed-off-by: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> ---
>  drivers/regulator/axp20x-regulator.c | 85 +++++++++++++++++++++++++++++-
>  1 file changed, 85 insertions(+)
>
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
> index 9a2db28..1d9fa62 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -346,6 +357,79 @@
>                 .ops            = &axp20x_ops_range,                            \
>         }
>
> +static const int axp209_dcdc2_ldo3_slew_rates[] = {
> +       1600,
> +        800,
> +};
> +
> +static int axp20x_set_ramp_delay(struct regulator_dev *rdev, int ramp)
> +{
> +       struct axp20x_dev *axp20x = rdev_get_drvdata(rdev);
> +       const struct regulator_desc *desc = rdev->desc;
> +       u8 reg, mask, enable, cfg = 0xff;
> +       const int *slew_rates;
> +       int rate_count = 0;
> +
> +       if (!rdev)
> +               return -EINVAL;
> +
> +       switch (axp20x->variant) {
> +       case AXP209_ID:
> +               if (desc->id == AXP20X_DCDC2) {

Is slew_rates supposed to be set here?

> +                       rate_count = ARRAY_SIZE(axp209_dcdc2_ldo3_slew_rates);
> +                       reg = AXP20X_DCDC2_LDO3_V_RAMP;
> +                       mask = AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_RATE_MASK |
> +                              AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_EN_MASK;
> +                       enable = (ramp > 0) ?
> +                                AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_EN :
> +                                !AXP20X_DCDC2_LDO3_V_RAMP_DCDC2_EN;
> +                       break;
> +               }
> +
> +               if (desc->id == AXP20X_LDO3) {
> +                       slew_rates = axp209_dcdc2_ldo3_slew_rates;
> +                       rate_count = ARRAY_SIZE(axp209_dcdc2_ldo3_slew_rates);
> +                       reg = AXP20X_DCDC2_LDO3_V_RAMP;
> +                       mask = AXP20X_DCDC2_LDO3_V_RAMP_LDO3_RATE_MASK |
> +                              AXP20X_DCDC2_LDO3_V_RAMP_LDO3_EN_MASK;
> +                       enable = (ramp > 0) ?
> +                                AXP20X_DCDC2_LDO3_V_RAMP_LDO3_EN :
> +                                !AXP20X_DCDC2_LDO3_V_RAMP_LDO3_EN;
> +                       break;
> +               }
> +
> +               if (rate_count > 0)
> +                       break;

You could save one to two tests by combining the above three if statements, i.e.

if (DCDC2) {
    // set DCDC2 stuff

    break;
} else if (LDO3) {
    // set LDO3 stuff

    break;
}

As written, the rate_count > 0 test will never be true as every block
that sets rate_count breaks out of the switch block.

You could then calculate rate_count below the switch block.

> +
> +               /* fall through */
> +       default:
> +               /* Not supported for this regulator */
> +               return -ENOTSUPP;
> +       }
> +
> +       if (ramp == 0) {
> +               cfg = enable;
> +       } else {
> +               int i;
> +
> +               for (i = 0; i < rate_count; i++) {
> +                       if (ramp <= slew_rates[i])
> +                               cfg = AXP20X_DCDC2_LDO3_V_RAMP_LDO3_RATE(i);
> +                       else
> +                               break;
> +               }
> +
> +               if (cfg == 0xff) {
> +                       dev_err(axp20x->dev, "unsupported ramp value %d", ramp);
> +                       return -EINVAL;
> +               }
> +
> +               cfg |= enable;
> +       }
> +
> +       return regmap_update_bits(axp20x->regmap, reg, mask, cfg);
> +}
> +



-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
