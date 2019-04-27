From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: meson: add support of drive-strength-uA
Date: Sat, 27 Apr 2019 21:44:49 +0200
Message-ID: <CAFBinCDNz1txJ7_aQU8MwjpeVFC6BgyG_gkg-jJRnnerSjbP9A@mail.gmail.com>
References: <20190418124758.24022-1-glaroque@baylibre.com> <20190418124758.24022-5-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418124758.24022-5-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Guillaume,

On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> drive-strength-uA is a new feature needed for G12A SoC.
> the default DS setting after boot is usually 500uA and it is not enough for
> many functions. We need to be able to set the drive strength to reliably
> enable things like MMC, I2C, etc ...
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
I gave this a go on Meson8m2 (meaning I applied all four patches from
this series and booted the result on my board):
[Meson8m2 doesn't support drive strength and still boots without any
crashes or obvious regressions]
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  36 ++---
>  drivers/pinctrl/meson/pinctrl-meson.c      | 166 ++++++++++++++++-----
>  drivers/pinctrl/meson/pinctrl-meson.h      |  20 ++-
personally I would have split this into two separate patches:
- one for the generic pinctrl-meson part which adds drive-strength-uA support
- another patch for enabling this on G12A

if nobody else wants you to split this then it's fine for me as well

>  3 files changed, 163 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index d494492e98e9..3475cd7bd2af 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -1304,28 +1304,28 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
>  };
>
>  static struct meson_bank meson_g12a_periphs_banks[] = {
> -       /* name  first  last  irq  pullen  pull  dir  out  in */
> -       BANK("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
> -            4,  0,  4,  0,  12,  0,  13, 0,  14, 0),
> -       BANK("H",    GPIOH_0,    GPIOH_8, 28, 36,
> -            3,  0,  3,  0,  9,  0,  10,  0,  11,  0),
> -       BANK("BOOT", BOOT_0,     BOOT_15,  37, 52,
> -            0,  0,  0,  0,  0, 0,  1, 0,  2, 0),
> -       BANK("C",    GPIOC_0,    GPIOC_7,  53, 60,
> -            1,  0,  1,  0,  3, 0,  4, 0,  5, 0),
> -       BANK("A",    GPIOA_0,    GPIOA_15,  61, 76,
> -            5,  0,  5,  0,  16,  0,  17,  0,  18,  0),
> -       BANK("X",    GPIOX_0,    GPIOX_19,   77, 96,
> -            2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
> +       BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
> +               4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
> +       BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
> +               3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
> +       BANK_DS("BOOT", BOOT_0,     BOOT_15,  37, 52,
> +               0,  0,  0,  0,  0, 0,  1, 0,  2, 0, 0, 0),
> +       BANK_DS("C",    GPIOC_0,    GPIOC_7,  53, 60,
> +               1,  0,  1,  0,  3, 0,  4, 0,  5, 0, 1, 0),
> +       BANK_DS("A",    GPIOA_0,    GPIOA_15,  61, 76,
> +               5,  0,  5,  0,  16,  0,  17,  0,  18,  0, 6, 0),
> +       BANK_DS("X",    GPIOX_0,    GPIOX_19,   77, 96,
> +               2,  0,  2,  0,  6,  0,  7,  0,  8,  0, 2, 0),
>  };
>
>  static struct meson_bank meson_g12a_aobus_banks[] = {
> -       /* name  first  last  irq  pullen  pull  dir  out  in  */
> -       BANK("AO",   GPIOAO_0,  GPIOAO_11,  0, 11,
> -            3,  0,  2, 0,  0,  0,  4, 0,  1,  0),
> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
> +       BANK_DS("AO", GPIOAO_0, GPIOAO_11, 0, 11, 3, 0, 2, 0, 0, 0, 4, 0, 1, 0,
> +               0, 0),
>         /* GPIOE actually located in the AO bank */
> -       BANK("E",   GPIOE_0,  GPIOE_2,   97, 99,
> -            3,  16,  2, 16,  0,  16,  4, 16,  1,  16),
> +       BANK_DS("E", GPIOE_0, GPIOE_2, 97, 99, 3, 16, 2, 16, 0, 16, 4, 16, 1,
> +               16, 1, 0),
>  };
these definitions are really hard to read, but it's been like this
even before your patch

>  static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 96a4a72708e4..5108e5aa6514 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -174,62 +174,106 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>         return 0;
>  }
>
> -static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
> -                            unsigned long *configs, unsigned num_configs)
> +static int meson_pinconf_set_bias(struct meson_pinctrl *pc, unsigned int pin,
> +                                 enum pin_config_param conf)
can you please confirm that I understood the purpose of this correctly:
I think you introduce this to make setting the bias consistent with
how you set the drive-strength.
if so then it would be great to have a separate patch which describes
that it's only a code-style change and a functional no-op

additionally the function arguments are not consistent with
meson_pinconf_get_drive_strength():
- here you pass the pinctrl subsystem specific parameters (enum
pin_config_param conf)
- in meson_pinconf_get_drive_strength the conversion for pinctrl
subsystem specific values (pinconf_to_config_argument) is part of
meson_pinconf_set
I'm wondering whether two separate functions
(meson_pinconf_disable_bias and meson_pinconf_enable_bias) would make
things easier to read. I haven't tried whether this would really make
things better, so I'd like to hear your opinion on this Guillaume!

[...]
> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin, u16 arg)
>  {
> -       struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>         struct meson_bank *bank;
> -       enum pin_config_param param;
>         unsigned int reg, bit;
> -       int i, ret;
> +       unsigned int ds_val;
> +       int ret;
> +
> +       if (!pc->reg_ds) {
> +               dev_err(pc->dev, "drive-strength not supported\n");
> +               return -ENOTSUPP;
in meson_pinconf_set() we don't complain (with a dev_err) for this case.
I'm not sure what the best-practice is for the pinctrl subsystem,
maybe Linus can comment on this

> +       }
>
>         ret = meson_get_bank(pc, pin, &bank);
>         if (ret)
>                 return ret;
>
> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +       bit = bit << 1;
> +
> +       if (arg <= 500) {
> +               ds_val = MESON_PINCONF_DRV_500UA;
> +       } else if (arg <= 2500) {
> +               ds_val = MESON_PINCONF_DRV_2500UA;
> +       } else if (arg <= 3000) {
> +               ds_val = MESON_PINCONF_DRV_3000UA;
> +       } else if (arg <= 4000) {
> +               ds_val = MESON_PINCONF_DRV_4000UA;
> +       } else {
> +               dev_warn_once(pc->dev,
> +                             "pin %u: invalid drive-strength : %d , default to 4mA\n",
> +                             pin, arg);
> +               ds_val = MESON_PINCONF_DRV_4000UA;
why not return -EINVAL here? (my assumption is that the pinctrl
subsystem would like to have -EINVAL instead of drivers doing
fallbacks if the values are out-of-range, but I'm not 100% sure about
this)

[...]
> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin, u16 *arg)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit;
> +       unsigned int val;
> +       int ret;
> +
do you need to return -ENOTSUPP here if pc->reg_ds is NULL, similar to
what you already have in meson_pinconf_set_drive_strength()?


Regards
Martin
