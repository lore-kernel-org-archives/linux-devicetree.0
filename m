From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/5] pinctrl: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Date: Tue, 30 Oct 2018 14:04:20 +0100
Message-ID: <CACRpkdbYtphSk+9E5Wzz4kZvQiT=RANDg_hYqRac7pb0M02oAA@mail.gmail.com>
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com> <20181019095003.26046-5-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181019095003.26046-5-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2018 at 11:50 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
>
> Lochnagar provides many pins which can generally be used for an
> audio function such as an AIF or a PDM interface, but also as
> GPIOs.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Changes since v2:
>  - Updated aif-master/aif-slave to use a vendor prefix
>  - Correctly get and put of_node pointer in probe/remove

Looks better and better! Some comments, probably not the last comments:

> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>

#include <linux/bits.h>

> +struct lochnagar_aif {
> +       const char name[16];
> +
> +       unsigned int pins[4];
> +
> +       unsigned int src_reg;

u32?

> +       unsigned int src_mask;

u32?

> +
> +       unsigned int ctrl_reg;

u32?

> +       unsigned int ena_mask;

u32?

> +       unsigned int master_mask;

u32?

> +struct lochnagar_func {
> +       const char * const name;
> +
> +       enum lochnagar_func_type type;
> +
> +       int op;

unsigned int? u32?

Looks like u8 actually.

> +struct lochnagar_group {
> +       const char * const name;
> +
> +       enum lochnagar_func_type type;
> +
> +       const unsigned int *pins;
> +       int npins;

unsigned int npins?

> +struct lochnagar_func_groups {
> +       const char **groups;
> +       int ngroups;

unsigned int ngroups?

> +struct lochnagar_pin_priv {
> +       struct lochnagar *lochnagar;
> +       struct device *dev;
> +
> +       const struct lochnagar_func *funcs;
> +       int nfuncs;
> +
> +       const struct pinctrl_pin_desc *pins;
> +       int npins;
> +
> +       const struct lochnagar_group *groups;
> +       int ngroups;
> +
> +       struct lochnagar_func_groups func_groups[LN_FTYPE_COUNT];
> +
> +       struct gpio_chip gpio_chip;
> +};

I bet some of these should be unsigned as well.

> +static const struct pinconf_generic_params lochnagar_dt_params[] = {
> +       {"cirrus,aif-master", PIN_CONFIG_AIFMASTER,  0},
> +       {"cirrus,aif-slave",  PIN_CONFIG_AIFSLAVE,   0},
> +};

I guess these are documented in the device tree bindings.

They look suspciously like muxing but I guess it is explained
there.

> +static void lochnagar_gpio_set(struct gpio_chip *chip,
> +                              unsigned int offset, int value)
> +{
> +       struct lochnagar_pin_priv *priv = gpiochip_get_data(chip);
> +       struct lochnagar *lochnagar = priv->lochnagar;
> +       const struct lochnagar_pin *pin = priv->pins[offset].drv_data;
> +       int ret;
> +
> +       value = !!value;

value = value ? BIT(pin->shift) : 0;

> +       dev_dbg(priv->dev, "Set GPIO %s to %s\n",
> +               pin->name, value ? "high" : "low");
> +
> +       switch (pin->type) {
> +       case LN_PTYPE_MUX:
> +               value |= LN2_OP_GPIO;
> +
> +               ret = lochnagar_pin_set_mux(priv, pin, value);
> +               break;
> +       case LN_PTYPE_GPIO:
> +               if (pin->invert)
> +                       value = !value;
> +
> +               ret = regmap_update_bits(lochnagar->regmap, pin->reg,
> +                                        0x1 << pin->shift,

BIT(pin->shift)

> +                                        value << pin->shift);

Just value provided you used the construction above
to construct it.

Yours,
Linus Walleij
