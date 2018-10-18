Return-Path: <SRS0=MYDa=M6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:57645 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbeJRR50 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Oct 2018 13:57:26 -0400
Date: Thu, 18 Oct 2018 11:57:06 +0200
From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Message-ID: <20181018095706.GD17549@w540>
References: <20181005150951.22129-1-chris.brandt@renesas.com>
 <20181005150951.22129-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline
In-Reply-To: <20181005150951.22129-2-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,
   thanks for the patches.

On Fri, Oct 05, 2018 at 10:09:50AM -0500, Chris Brandt wrote:
> Adds support for the pin and gpio controller found in R7S9210 (RZ/A2) SoC=
s.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/pinctrl/Kconfig        |  11 +
>  drivers/pinctrl/Makefile       |   1 +
>  drivers/pinctrl/pinctrl-rza2.c | 519 +++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 531 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-rza2.c
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 978b2ed4d014..5819e0c9c3a8 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -195,6 +195,17 @@ config PINCTRL_RZA1
>  	help
>  	  This selects pinctrl driver for Renesas RZ/A1 platforms.
>
> +config PINCTRL_RZA2
> +	bool "Renesas RZ/A2 gpio and pinctrl driver"
> +	depends on OF
> +	depends on ARCH_R7S9210 || COMPILE_TEST
> +	select GPIOLIB
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GENERIC_PINCONF
> +	help
> +	  This selects pinctrl driver for Renesas RZ/A2 platforms.
> +
>  config PINCTRL_SINGLE
>  	tristate "One-register-per-pin type device tree based pinctrl driver"
>  	depends on OF
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 8e127bd8610f..9354f0c2044c 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_PINCTRL_PIC32)	+=3D pinctrl-pic32.o
>  obj-$(CONFIG_PINCTRL_PISTACHIO)	+=3D pinctrl-pistachio.o
>  obj-$(CONFIG_PINCTRL_ROCKCHIP)	+=3D pinctrl-rockchip.o
>  obj-$(CONFIG_PINCTRL_RZA1)	+=3D pinctrl-rza1.o
> +obj-$(CONFIG_PINCTRL_RZA2)	+=3D pinctrl-rza2.o
>  obj-$(CONFIG_PINCTRL_SINGLE)	+=3D pinctrl-single.o
>  obj-$(CONFIG_PINCTRL_SIRF)	+=3D sirf/
>  obj-$(CONFIG_PINCTRL_SX150X)	+=3D pinctrl-sx150x.o
> diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza=
2.c
> new file mode 100644
> index 000000000000..db8d5a3cf2ea
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-rza2.c
> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Combined GPIO and pin controller support for Renesas RZ/A2 (R7S72100)=
 SoC

R7S9210

> + *
> + * Copyright (C) 2018 Chris Brandt
> + */
> +
> +/*
> + * This pin controller/gpio combined driver supports Renesas devices of =
RZ/A2
> + * family.
> + */
> +
> +#include <linux/gpio.h>
> +#include <linux/bitops.h>

Headers sorted please :)

> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "core.h"
> +#include "pinmux.h"
> +
> +#define DRIVER_NAME		"pinctrl-rza2"
> +
> +#define RZA2_NPORTS		(PM + 1)

Why not making this part of the enum itself?

> +#define RZA2_PINS_PER_PORT	8
> +#define RZA2_NPINS		(RZA2_PINS_PER_PORT * RZA2_NPORTS)
> +#define RZA2_PIN_ID_TO_PORT(id)	((id) / RZA2_PINS_PER_PORT)
> +#define RZA2_PIN_ID_TO_PIN(id)	((id) % RZA2_PINS_PER_PORT)
> +
> +/*
> + * Use 16 lower bits [15:0] for pin identifier
> + * Use 16 higher bits [31:16] for pin mux function
> + */
> +#define MUX_PIN_ID_MASK		GENMASK(15, 0)
> +#define MUX_FUNC_MASK		GENMASK(31, 16)
> +#define MUX_FUNC_OFFS		16
> +#define MUX_FUNC(pinconf)	((pinconf & MUX_FUNC_MASK) >> MUX_FUNC_OFFS)
> +#define MUX_FUNC(pinconf)	((pinconf & MUX_FUNC_MASK) >> MUX_FUNC_OFFS)

Seems like the same line to me.
Also, double empty line.

> +
> +
> +enum pfc_pin_port_name {P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, PA, PB, =
PC, PD,
> +			PE, PF, PG, PH,	    PJ, PK, PL, PM};
weird spacing                          ^^^^

> +static const char port_names[] =3D "0123456789ABCDEFGHJKLM";
> +
> +struct rza2_pinctrl_priv {
> +	struct device *dev;
> +	void __iomem *base;
> +
> +	struct pinctrl_pin_desc *pins;
> +	struct pinctrl_desc desc;
> +	struct pinctrl_dev *pctl;
> +};
> +
> +#define PDR_BASE(b)	(b + 0x0000)	/* 16-bit, 2 bytes apart */

() around macros parameters when used:
                        ((b) + 0x0000)
                        which is just (b) by the way :)

Also, please prefix all defines with RZA2_ not to pollute the global
symbols space.

> +#define PODR_BASE(b)	(b + 0x0040)	/* 8-bit, 1 byte apart */
> +#define PIDR_BASE(b)	(b + 0x0060)	/* 8-bit, 1 byte apart */
> +#define PMR_BASE(b)	(b + 0x0080)	/* 8-bit, 1 byte apart */
> +#define DSCR_BASE(b)	(b + 0x0140)	/* 16-bit, 2 bytes apart */
> +#define PFS_BASE(b)	(b + 0x0200)	/* 8-bit, 8 bytes apart */

Here you define registers address bases, but instead of computing
everytime the port-pin dedicated register address (I'm thinking about
PFS specifically but it applies to others), would you consider providing
accessors helpers to write the offset computations process just once here?

Eg.
#define RZA2_PFS(_b, _port, _pin) (RZA2_PFS_BASE(_b) + (_port) * 8 + (_pin))

Same for other register which needs offset calculation based on port
and pin values.

> +#define PWPR(b)		(b + 0x02FF)	/* 8-bit */
> +#define PFENET(b)	(b + 0x0820)	/* 8-bit */
> +#define PPOC(b)		(b + 0x0900)	/* 32-bit */
> +#define PHMOMO(b)	(b + 0x0980)	/* 32-bit */
> +#define PMODEPFS(b)	(b + 0x09C0)	/* 32-bit */
> +#define PCKIO(b)	(b + 0x09D0)	/* 8-bit */

> +
> +void rza2_set_pin_function(void __iomem *pfc_base, u8 port, u8 pin, u8 f=
unc)
static ?

> +{
> +	u8 reg8;
> +	u16 reg16;
> +	u16 mask16;
> +
> +	/* Set pin to 'Non-use (Hi-z input protection)'  */
> +	reg16 =3D readw(PDR_BASE(pfc_base) + (port * 2));

as in example,

        reg16 =3D readw(RZA2_PDR(pfc_base), port));

it's nicer and isolates the offset calculations, which differs
=66rom one register to another (the 'x bytes apart' comment you added in
the registers definitions represents this, right? )


> +	mask16 =3D 0x03 << (pin * 2);
> +	reg16 &=3D ~mask16;
> +	writew(reg16, PDR_BASE((pfc_base)) + port * 2);
> +
> +	/* Temporarily switch to GPIO */
> +	reg8 =3D readb(PMR_BASE(pfc_base) + port);
> +	reg8 &=3D ~BIT(pin);
> +	writeb(reg8, PMR_BASE(pfc_base) + port);
> +
> +	/* PFS Register Write Protect : OFF */
> +	writeb(0x00, PWPR(pfc_base));	/* B0WI=3D0, PFSWE=3D0 */
> +	writeb(0x40, PWPR(pfc_base));	/* B0WI=3D0, PFSWE=3D1 */
> +
> +	/* Set Pin function (interrupt disabled, ISEL=3D0) */
> +	writeb(func, PFS_BASE(pfc_base) + (port * 8) + pin);
> +
> +	/* PFS Register Write Protect : ON */
> +	writeb(0x00, PWPR(pfc_base));	/* B0WI=3D0, PFSWE=3D0 */
> +	writeb(0x80, PWPR(pfc_base));	/* B0WI=3D1, PFSWE=3D0 */
> +
> +	/* Port Mode  : Peripheral module pin functions */
> +	reg8 =3D readb(PMR_BASE(pfc_base) + port);
> +	reg8 |=3D BIT(pin);
> +	writeb(reg8, PMR_BASE(pfc_base) + port);
> +}
> +
> +static void rza2_pin_to_gpio(void __iomem *pfc_base, u8 port, u8 pin, u8=
 dir)
> +{
> +	u16 reg16;
> +	u16 mask16;
> +
> +	reg16 =3D readw(PDR_BASE(pfc_base) + (port * 2));
> +	mask16 =3D 0x03 << (pin * 2);
> +	reg16 &=3D ~mask16;
> +
> +	if (dir =3D=3D GPIOF_DIR_IN)
> +		reg16 |=3D 2 << (pin * 2);	// pin as input

C++ comments style!

> +	else
> +		reg16 |=3D 3 << (pin * 2);	// pin as output

Also, you are using those '2' and '3' values here and there in the
code, as they represent the pin 'status. Would you consider making
a define for them? Actually, for all of them

#define RZA2_PIN_STATE_HIGHZ    0x00
#define RZA2_PIN_STATE_INPUT    0x02
#define RZA2_PIN_STATE_OUTPUT   0x03

> +
> +	writew(reg16, PDR_BASE((pfc_base)) + port * 2);
> +}
> +
> +static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +	struct rza2_pinctrl_priv *priv =3D gpiochip_get_data(chip);
> +	u8 port =3D offset / 8;
> +	u8 pin =3D offset % 8;
> +	u16 reg16;
> +
> +	reg16 =3D readw(PDR_BASE(priv->base) + (port * 2));
> +	reg16 =3D (reg16 >> (pin * 2)) & 0x03;
> +
> +	if (reg16 =3D=3D 3)
> +		return GPIOF_DIR_OUT;
> +
> +	if (reg16 =3D=3D 2)
> +		return GPIOF_DIR_IN;
> +
> +	/*
> +	 * This GPIO controller has a default Hi-Z state that is not input or
> +	 * output, so force the pin to input now.
> +	 */
I wonder if it is fine for the .get_direction callback to change the
pin state.
> +	rza2_pin_to_gpio(priv->base, port, pin, GPIOF_DIR_IN);

Empty line before return is nice (here and in other places).

I'll stop here with comments on the driver, as I should have a look at
bindings before. I'll comment there too and the get back to this.

Thanks
   j

> +	return GPIOF_DIR_IN;

> +}
> +
> +static int rza2_chip_direction_input(struct gpio_chip *chip,
> +				     unsigned int offset)
> +{
> +	struct rza2_pinctrl_priv *priv =3D gpiochip_get_data(chip);
> +	u8 port =3D offset / 8;
> +	u8 pin =3D offset % 8;
> +
> +	rza2_pin_to_gpio(priv->base, port, pin, GPIOF_DIR_IN);
> +
> +	return 0;
> +}
> +
> +static int rza2_chip_direction_output(struct gpio_chip *chip,
> +				      unsigned int offset, int val)
> +{
> +	struct rza2_pinctrl_priv *priv =3D gpiochip_get_data(chip);
> +	u8 port =3D offset / 8;
> +	u8 pin =3D offset % 8;
> +
> +	rza2_pin_to_gpio(priv->base, port, pin, GPIOF_DIR_OUT);
> +
> +	return 0;
> +}
> +
> +static int rza2_chip_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct rza2_pinctrl_priv *priv =3D gpiochip_get_data(chip);
> +	u8 port =3D offset / 8;
> +	u8 pin =3D offset % 8;
> +
> +	return (readb(PIDR_BASE(priv->base) + port) >> pin) & 1;
> +}
> +
> +static void rza2_chip_set(struct gpio_chip *chip, unsigned int offset,
> +			  int value)
> +{
> +	struct rza2_pinctrl_priv *priv =3D gpiochip_get_data(chip);
> +	u8 port =3D offset / 8;
> +	u8 pin =3D offset % 8;
> +	u8 new_value =3D readb(PODR_BASE(priv->base) + port);
> +
> +	if (value)
> +		new_value |=3D (1 << pin);
> +	else
> +		new_value &=3D ~(1 << pin);
> +
> +	writeb(new_value, PODR_BASE(priv->base) + port);
> +}
> +
> +static const char * const rza2_gpio_names[] =3D {
> +	"P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
> +	"P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
> +	"P2_0", "P2_1", "P2_2", "P2_3", "P2_4", "P2_5", "P2_6", "P2_7",
> +	"P3_0", "P3_1", "P3_2", "P3_3", "P3_4", "P3_5", "P3_6", "P3_7",
> +	"P4_0", "P4_1", "P4_2", "P4_3", "P4_4", "P4_5", "P4_6", "P4_7",
> +	"P5_0", "P5_1", "P5_2", "P5_3", "P5_4", "P5_5", "P5_6", "P5_7",
> +	"P6_0", "P6_1", "P6_2", "P6_3", "P6_4", "P6_5", "P6_6", "P6_7",
> +	"P7_0", "P7_1", "P7_2", "P7_3", "P7_4", "P7_5", "P7_6", "P7_7",
> +	"P8_0", "P8_1", "P8_2", "P8_3", "P8_4", "P8_5", "P8_6", "P8_7",
> +	"P9_0", "P9_1", "P9_2", "P9_3", "P9_4", "P9_5", "P9_6", "P9_7",
> +	"PA_0", "PA_1", "PA_2", "PA_3", "PA_4", "PA_5", "PA_6", "PA_7",
> +	"PB_0", "PB_1", "PB_2", "PB_3", "PB_4", "PB_5", "PB_6", "PB_7",
> +	"PC_0", "PC_1", "PC_2", "PC_3", "PC_4", "PC_5", "PC_6", "PC_7",
> +	"PD_0", "PD_1", "PD_2", "PD_3", "PD_4", "PD_5", "PD_6", "PD_7",
> +	"PE_0", "PE_1", "PE_2", "PE_3", "PE_4", "PE_5", "PE_6", "PE_7",
> +	"PF_0", "PF_1", "PF_2", "PF_3", "P0_4", "PF_5", "PF_6", "PF_7",
> +	"PG_0", "PG_1", "PG_2", "P0_3", "PG_4", "PG_5", "PG_6", "PG_7",
> +	"PH_0", "PH_1", "PH_2", "PH_3", "PH_4", "PH_5", "PH_6", "PH_7",
> +	/* port I does not exist */
> +	"PJ_0", "PJ_1", "PJ_2", "PJ_3", "PJ_4", "PJ_5", "PJ_6", "PJ_7",
> +	"PK_0", "PK_1", "PK_2", "PK_3", "PK_4", "PK_5", "PK_6", "PK_7",
> +	"PL_0", "PL_1", "PL_2", "PL_3", "PL_4", "PL_5", "PL_6", "PL_7",
> +	"PM_0", "PM_1", "PM_2", "PM_3", "PM_4", "PM_5", "PM_6", "PM_7",
> +};
> +
> +static struct gpio_chip chip =3D {
> +	.names =3D rza2_gpio_names,
> +	.base =3D -1,
> +	.ngpio =3D RZA2_NPINS,
> +	.get_direction =3D rza2_chip_get_direction,
> +	.direction_input =3D rza2_chip_direction_input,
> +	.direction_output =3D rza2_chip_direction_output,
> +	.get =3D rza2_chip_get,
> +	.set =3D rza2_chip_set,
> +};
> +
> +struct pinctrl_gpio_range gpio_range;
> +
> +static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)
> +{
> +	struct device_node *np =3D priv->dev->of_node;
> +	struct of_phandle_args of_args;
> +	int ret;
> +
> +	if (!of_property_read_bool(np, "gpio-controller")) {
> +		dev_info(priv->dev, "No gpio controller registered\n");
> +		return 0;
> +	}
> +
> +	chip.label =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%pOFn", np);
> +	chip.of_node =3D np;
> +	chip.parent =3D priv->dev;
> +
> +	ret =3D of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0,
> +					       &of_args);
> +	if (ret) {
> +		dev_err(priv->dev, "Unable to parse gpio-ranges\n");
> +		return ret;
> +	}
> +
> +	gpio_range.id =3D of_args.args[0];
> +	gpio_range.name =3D chip.label;
> +	gpio_range.pin_base =3D gpio_range.base =3D of_args.args[1];
> +	gpio_range.npins =3D of_args.args[2];
> +	gpio_range.gc =3D &chip;
> +
> +	/* Register our gpio chip with gpiolib */
> +	ret =3D devm_gpiochip_add_data(priv->dev, &chip, priv);
> +	if (ret)
> +		return ret;
> +
> +	/* Register pin range with pinctrl core */
> +	pinctrl_add_gpio_range(priv->pctl, &gpio_range);
> +
> +	dev_dbg(priv->dev, "Registered gpio controller\n");
> +
> +	return 0;
> +}
> +
> +static int rza2_pinctrl_register(struct rza2_pinctrl_priv *priv)
> +{
> +	struct pinctrl_pin_desc *pins;
> +	unsigned int i;
> +	int ret;
> +
> +	pins =3D devm_kcalloc(priv->dev, RZA2_NPINS, sizeof(*pins), GFP_KERNEL);
> +	if (!pins)
> +		return -ENOMEM;
> +
> +	priv->pins =3D pins;
> +	priv->desc.pins =3D pins;
> +	priv->desc.npins =3D RZA2_NPINS;
> +
> +	for (i =3D 0; i < RZA2_NPINS; i++) {
> +		unsigned int pin =3D RZA2_PIN_ID_TO_PIN(i);
> +		unsigned int port =3D RZA2_PIN_ID_TO_PORT(i);
> +
> +		pins[i].number =3D i;
> +		pins[i].name =3D devm_kasprintf(priv->dev, GFP_KERNEL, "P%c_%u",
> +					      port_names[port], pin);
> +	}
> +
> +	ret =3D devm_pinctrl_register_and_init(priv->dev, &priv->desc, priv,
> +					     &priv->pctl);
> +	if (ret) {
> +		dev_err(priv->dev, "pinctrl registration failed\n");
> +		return ret;
> +	}
> +
> +	ret =3D pinctrl_enable(priv->pctl);
> +	if (ret) {
> +		dev_err(priv->dev, "pinctrl enable failed\n");
> +		return ret;
> +	}
> +
> +	ret =3D rza2_gpio_register(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "GPIO registration failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * For each DT node, create a single pin mapping. That pin mapping will =
only
> + * contain a single group of pins, and that group of pins will only have=
 a
> + * single function that can be selected.
> + */
> +static int rza2_dt_node_to_map(struct pinctrl_dev *pctldev,
> +			       struct device_node *np,
> +			       struct pinctrl_map **map,
> +			       unsigned int *num_maps)
> +{
> +	struct rza2_pinctrl_priv *priv =3D pinctrl_dev_get_drvdata(pctldev);
> +	struct property *of_pins;
> +	int i;
> +	unsigned int *pins;
> +	unsigned int *psel_val;
> +	const char **pin_fn;
> +	int ret, npins;
> +	int gsel, fsel;
> +
> +	/* Find out how many pins to map */
> +	of_pins =3D of_find_property(np, "pinmux", NULL);
> +	if (!of_pins) {
> +		dev_info(priv->dev, "Missing pinmux property\n");
> +		return -ENOENT;
> +	}
> +	npins =3D of_pins->length / sizeof(u32);
> +
> +	pins =3D devm_kcalloc(priv->dev, npins, sizeof(*pins), GFP_KERNEL);
> +	psel_val =3D devm_kcalloc(priv->dev, npins, sizeof(*psel_val),
> +				GFP_KERNEL);
> +	pin_fn =3D devm_kzalloc(priv->dev, sizeof(*pin_fn), GFP_KERNEL);
> +	if (!pins || !psel_val || !pin_fn)
> +		return -ENOMEM;
> +
> +	/* Collect pin locations and mux settings from DT properties */
> +	for (i =3D 0; i < npins; ++i) {
> +		u32 value;
> +
> +		ret =3D of_property_read_u32_index(np, "pinmux", i, &value);
> +		if (ret)
> +			return ret;
> +		pins[i] =3D value & MUX_PIN_ID_MASK;
> +		psel_val[i] =3D MUX_FUNC(value);
> +	}
> +
> +	/* Register a single pin group listing all the pins we read from DT */
> +	gsel =3D pinctrl_generic_add_group(pctldev, np->name, pins, npins, NULL=
);
> +	if (gsel < 0)
> +		return gsel;
> +
> +	/*
> +	 * Register a single group function where the 'data' is an array PSEL
> +	 * register values read from DT.
> +	 */
> +	pin_fn[0] =3D np->name;
> +	fsel =3D pinmux_generic_add_function(pctldev, np->name, pin_fn, 1,
> +					   psel_val);
> +	if (fsel < 0) {
> +		ret =3D fsel;
> +		goto remove_group;
> +	}
> +
> +	dev_dbg(priv->dev, "Parsed %s with %d pins\n", np->name, npins);
> +
> +	/* Create map where to retrieve function and mux settings from */
> +	*num_maps =3D 0;
> +	*map =3D kzalloc(sizeof(**map), GFP_KERNEL);
> +	if (!*map) {
> +		ret =3D -ENOMEM;
> +		goto remove_function;
> +	}
> +
> +	(*map)->type =3D PIN_MAP_TYPE_MUX_GROUP;
> +	(*map)->data.mux.group =3D np->name;
> +	(*map)->data.mux.function =3D np->name;
> +	*num_maps =3D 1;
> +
> +	return 0;
> +
> +remove_function:
> +	pinmux_generic_remove_function(pctldev, fsel);
> +
> +remove_group:
> +	pinctrl_generic_remove_group(pctldev, gsel);
> +
> +	dev_info(priv->dev, "Unable to parse DT node %s\n", np->name);
> +
> +	return ret;
> +}
> +
> +static void rza2_dt_free_map(struct pinctrl_dev *pctldev,
> +			     struct pinctrl_map *map, unsigned int num_maps)
> +{
> +	kfree(map);
> +}
> +
> +static const struct pinctrl_ops rza2_pinctrl_ops =3D {
> +	.get_groups_count	=3D pinctrl_generic_get_group_count,
> +	.get_group_name		=3D pinctrl_generic_get_group_name,
> +	.get_group_pins		=3D pinctrl_generic_get_group_pins,
> +	.dt_node_to_map		=3D rza2_dt_node_to_map,
> +	.dt_free_map		=3D rza2_dt_free_map,
> +};
> +
> +static int rza2_set_mux(struct pinctrl_dev *pctldev, unsigned int select=
or,
> +			   unsigned int group)
> +{
> +	struct rza2_pinctrl_priv *priv =3D pinctrl_dev_get_drvdata(pctldev);
> +	struct function_desc *func;
> +	struct group_desc *grp;
> +	int i;
> +	unsigned int *psel_val;
> +
> +	grp =3D pinctrl_generic_get_group(pctldev, group);
> +	if (!grp)
> +		return -EINVAL;
> +
> +	func =3D pinmux_generic_get_function(pctldev, selector);
> +	if (!func)
> +		return -EINVAL;
> +
> +	psel_val =3D func->data;
> +
> +	for (i =3D 0; i < grp->num_pins; ++i) {
> +		dev_dbg(priv->dev, "Setting P%c_%d to PSEL=3D%d\n",
> +			port_names[RZA2_PIN_ID_TO_PORT(grp->pins[i])],
> +			RZA2_PIN_ID_TO_PIN(grp->pins[i]),
> +			psel_val[i]);
> +		rza2_set_pin_function(
> +			priv->base,
> +			RZA2_PIN_ID_TO_PORT(grp->pins[i]),
> +			RZA2_PIN_ID_TO_PIN(grp->pins[i]),
> +			psel_val[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct pinmux_ops rza2_pinmux_ops =3D {
> +	.get_functions_count	=3D pinmux_generic_get_function_count,
> +	.get_function_name	=3D pinmux_generic_get_function_name,
> +	.get_function_groups	=3D pinmux_generic_get_function_groups,
> +	.set_mux		=3D rza2_set_mux,
> +	.strict			=3D true,
> +};
> +
> +static int rza2_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct rza2_pinctrl_priv *priv;
> +	struct resource *res;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D &pdev->dev;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->desc.name		=3D DRIVER_NAME;
> +	priv->desc.pctlops	=3D &rza2_pinctrl_ops;
> +	priv->desc.pmxops	=3D &rza2_pinmux_ops;
> +	priv->desc.owner	=3D THIS_MODULE;
> +
> +	ret =3D rza2_pinctrl_register(priv);
> +	if (ret)
> +		return ret;
> +
> +	pr_info("RZ/A2 pin controller registered\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rza2_pinctrl_of_match[] =3D {
> +	{
> +		.compatible	=3D "renesas,r7s9210-pinctrl",
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver rza2_pinctrl_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.of_match_table =3D rza2_pinctrl_of_match,
> +	},
> +	.probe =3D rza2_pinctrl_probe,
> +};
> +
> +static int __init rza2_pinctrl_init(void)
> +{
> +	return platform_driver_register(&rza2_pinctrl_driver);
> +}
> +core_initcall(rza2_pinctrl_init);
> +
> +
> +MODULE_AUTHOR("Chris Brandt <chris.brandt@renesas.com>");
> +MODULE_DESCRIPTION("Pin and gpio controller driver for RZ/A2 SoC");
> +MODULE_LICENSE("GPL v2");
> --
> 2.16.1
>

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbyFjyAAoJEHI0Bo8WoVY8IxkP/jnCt3Mv8aWHnhsLdtAXk0z9
Ylz7dwmpegkK9aMdZt26DM8B8UdJTH65R2QQa2GI5badPRtnDxRWo6uEZk+9f6wq
kHegVONjsJ8p+5EfOnve+JKnB9z/4IxjIBaOTIcid+ldePKdWr6Xq29ONFvjTMHu
eedq4C4PJW+8a9imsN0IaVWQS7CikXr32oRy0EFyE22jeKfqkZ29zEBQKt7Uy2oD
HoxgMg9vkhygv1F9de2zb/2dfesM+kdtJgi7l8V0bKHsiibH1VntOcHMNetozTOE
XHN84oPM9fTKR4hz+sn3aUMeXraywBvZy+Kt4uhjfdCJGi42AXxnX7Jlznht20Nu
au++RFe9Y8Bqyxg0mP9MXjEc5aN7uF8t8xwLMW3YkxiKxsqPFBY4821nX15pyRcx
3YDRO+gofgNS0R36FXZ0JXuNlkq6/jsmGA5uLQrU/E+rrEGxNUkTQPn6YY9u0Siv
JH51KgyyqOW4SAlGhmChLjz2e6KvgKDySC/uxoND1vx9BdlaejohcvLq1uuN3Na9
hkG3stau6qrAfXTU/kj4hh7QMLzjeZI1p+IdBUokswqX07rpNDQpQEXF7hnv2E4P
QUpRhpzOCmxFJp7uCPaNIYS5GFzNwcZ3PGmrhg3ItpiM+Hb9qAa4ypAHaRdLV0n3
TNUCTZ5B+qWn346KyBnb
=cfQ5
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
