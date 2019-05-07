From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 4/6] pinctrl: meson: Rework enable/disable bias part
Date: Tue, 7 May 2019 19:53:44 +0200
Message-ID: <CAFBinCBQSE7wh367Aa25zwtDphsx8Z_KGDTn8dcSCir6bLvq_A@mail.gmail.com>
References: <20190507115726.23714-1-glaroque@baylibre.com> <20190507115726.23714-5-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507115726.23714-5-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guillaume,

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> rework bias enable/disable part to prepare drive-strength integration
if it was my patch I would add "no functional changes" at the end to
make it explicit that this only changes the structure of the code.

>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
with the minor comments from below addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 79 ++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 96a4a72708e4..a216a7537564 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -174,13 +174,57 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>         return 0;
>  }
>
> +static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
> +                                     unsigned int pin)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit = 0;
> +       int ret;
> +
> +       ret = meson_get_bank(pc, pin, &bank);
> +       if (ret)
> +               return ret;
add an empty line here to keep it consistent with the rest of the code

[...]
>  static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>                              unsigned long *configs, unsigned num_configs)
>  {
>         struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>         struct meson_bank *bank;
bank is not read anymore (it's passed to meson_get_bank to set it, but
then it's not read, which is probably why my compiler doesn't
complain)

>         enum pin_config_param param;
> -       unsigned int reg, bit;
>         int i, ret;
>
>         ret = meson_get_bank(pc, pin, &bank);
> @@ -192,44 +236,17 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>
>                 switch (param) {
>                 case PIN_CONFIG_BIAS_DISABLE:
> -                       dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
> -                                              &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), 0);
> +                       ret = meson_pinconf_disable_bias(pc, pin);
>                         if (ret)
>                                 return ret;
>                         break;
>                 case PIN_CONFIG_BIAS_PULL_UP:
> -                       dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
> -                                              &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), BIT(bit));
> -                       if (ret)
> -                               return ret;
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pull, reg,
> -                                                BIT(bit), BIT(bit));
> +                       ret = meson_pinconf_enable_bias(pc, pin, 1);
use "true" instead of "1"?

>                         if (ret)
>                                 return ret;
>                         break;
>                 case PIN_CONFIG_BIAS_PULL_DOWN:
> -                       dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
> -                                              &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), BIT(bit));
> -                       if (ret)
> -                               return ret;
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pull, reg,
> -                                                BIT(bit), 0);
> +                       ret = meson_pinconf_enable_bias(pc, pin, 0);
use "false" instead of "0"?

one overall comment: thank you for working on this!
in my opinion it's a good preparation step to ensure that
meson_pinconf_set is easy to understand even if we add more
functionality here


Regards
Martin
