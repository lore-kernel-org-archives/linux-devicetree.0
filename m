From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 5/5] gpio: syscon: Add support for the Xylon LogiCVC GPIOs
Date: Thu, 3 Oct 2019 10:26:17 +0200
Message-ID: <CAMpxmJWQ9iuNj8Nfhf0hVzP6piNPrb8_e7ucth0rmg8KwT4HdA@mail.gmail.com>
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com> <20190927100407.1863293-6-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927100407.1863293-6-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Paul,

just two nits:

pt., 27 wrz 2019 o 12:04 Paul Kocialkowski
<paul.kocialkowski@bootlin.com> napisa=C5=82(a):
>
> The LogiCVC display hardware block comes with GPIO capabilities
> that must be exposed separately from the main driver (as GPIOs) for
> use with regulators and panels. A syscon is used to share the same
> regmap across the two drivers.
>
> Since the GPIO capabilities are pretty simple, add them to the syscon
> GPIO driver.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/gpio/gpio-syscon.c | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
> index 05c537ed73f1..cdcb913b8f0c 100644
> --- a/drivers/gpio/gpio-syscon.c
> +++ b/drivers/gpio/gpio-syscon.c
> @@ -190,6 +190,70 @@ static const struct syscon_gpio_data keystone_dsp_gp=
io =3D {
>         .set            =3D keystone_gpio_set,
>  };
>
> +#define LOGICVC_CTRL_REG               0x40
> +#define LOGICVC_CTRL_GPIO_SHIFT                11
> +#define LOGICVC_CTRL_GPIO_BITS         5
> +
> +#define LOGICVC_POWER_CTRL_REG         0x78
> +#define LOGICVC_POWER_CTRL_GPIO_SHIFT  0
> +#define LOGICVC_POWER_CTRL_GPIO_BITS   4
> +
> +static void logicvc_gpio_offset(struct syscon_gpio_priv *priv,
> +                               unsigned offset, unsigned int *reg,
> +                               unsigned int *bit)
> +{
> +       if (offset >=3D LOGICVC_CTRL_GPIO_BITS) {
> +               *reg =3D LOGICVC_POWER_CTRL_REG;
> +
> +               /* To the (virtual) power ctrl offset. */
> +               offset -=3D LOGICVC_CTRL_GPIO_BITS;
> +               /* To the actual bit offset in reg. */
> +               offset +=3D LOGICVC_POWER_CTRL_GPIO_SHIFT;
> +       } else {
> +               *reg =3D LOGICVC_CTRL_REG;
> +
> +               /* To the actual bit offset in reg. */
> +               offset +=3D LOGICVC_CTRL_GPIO_SHIFT;
> +       }
> +
> +       *bit =3D BIT(offset);
> +}
> +
> +static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct syscon_gpio_priv *priv =3D gpiochip_get_data(chip);
> +       unsigned int reg;
> +       unsigned int bit;
> +       unsigned int value;

Can you put these on a single line?

> +       int ret;
> +
> +       logicvc_gpio_offset(priv, offset, &reg, &bit);
> +
> +       ret =3D regmap_read(priv->syscon, reg, &value);
> +       if (ret)
> +               return ret;
> +
> +       return !!(value & bit);
> +}
> +
> +static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, in=
t val)
> +{
> +       struct syscon_gpio_priv *priv =3D gpiochip_get_data(chip);
> +       unsigned int reg;
> +       unsigned int bit;

Same here.

Bart

> +
> +       logicvc_gpio_offset(priv, offset, &reg, &bit);
> +
> +       regmap_update_bits(priv->syscon, reg, bit, val ? bit : 0);
> +}
> +
> +static const struct syscon_gpio_data logicvc_gpio =3D {
> +       .flags          =3D GPIO_SYSCON_FEAT_OUT,
> +       .bit_count      =3D LOGICVC_CTRL_GPIO_BITS + LOGICVC_POWER_CTRL_G=
PIO_BITS,
> +       .get            =3D logicvc_gpio_get,
> +       .set            =3D logicvc_gpio_set,
> +};
> +
>  static const struct of_device_id syscon_gpio_ids[] =3D {
>         {
>                 .compatible     =3D "cirrus,ep7209-mctrl-gpio",
> @@ -203,6 +267,10 @@ static const struct of_device_id syscon_gpio_ids[] =
=3D {
>                 .compatible     =3D "rockchip,rk3328-grf-gpio",
>                 .data           =3D &rockchip_rk3328_gpio_mute,
>         },
> +       {
> +               .compatible     =3D "xylon,logicvc-3.02.a-gpio",
> +               .data           =3D &logicvc_gpio,
> +       },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
> --
> 2.23.0
>
