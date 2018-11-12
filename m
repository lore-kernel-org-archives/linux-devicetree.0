Return-Path: <SRS0=X2xC=NX=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181107182733.62155-1-chris.brandt@renesas.com> <20181107182733.62155-2-chris.brandt@renesas.com>
In-Reply-To: <20181107182733.62155-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Nov 2018 19:58:57 +0100
Message-ID: <CAMuHMdWePvqbv_SmkGQAWm8aynkXBjmf25BuA3O09_H9Xdtjyg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: Add RZ/A2 pin and gpio controller
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo@jmondi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Nov 7, 2018 at 7:27 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Adds support for the pin and gpio controller found in R7S9210 (RZ/A2) SoCs.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -195,6 +195,17 @@ config PINCTRL_RZA1
>         help
>           This selects pinctrl driver for Renesas RZ/A1 platforms.
>
> +config PINCTRL_RZA2
> +       bool "Renesas RZ/A2 gpio and pinctrl driver"
> +       depends on OF
> +       depends on ARCH_R7S9210 || COMPILE_TEST
> +       select GPIOLIB
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF

Given the PFS_ISEL bit, I think you can select GPIOLIB_IRQCHIP, and
implement interrupt support on GPIOs.
Of course that can be added later...

> +       help
> +         This selects pinctrl driver for Renesas RZ/A2 platforms.

GPIO and pinctrl?

> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-rza2.c
> @@ -0,0 +1,530 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Combined GPIO and pin controller support for Renesas RZ/A2 (R7S9210) SoC
> + *
> + * Copyright (C) 2018 Chris Brandt
> + */
> +
> +/*
> + * This pin controller/gpio combined driver supports Renesas devices of RZ/A2
> + * family.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "core.h"
> +#include "pinmux.h"
> +
> +#define DRIVER_NAME            "pinctrl-rza2"
> +
> +#define RZA2_PINS_PER_PORT     8
> +#define RZA2_NPINS             (RZA2_PINS_PER_PORT * RZA2_NPORTS)
> +#define RZA2_PIN_ID_TO_PORT(id)        ((id) / RZA2_PINS_PER_PORT)
> +#define RZA2_PIN_ID_TO_PIN(id) ((id) % RZA2_PINS_PER_PORT)
> +
> +/*
> + * Use 16 lower bits [15:0] for pin identifier
> + * Use 16 higher bits [31:16] for pin mux function
> + */
> +#define MUX_PIN_ID_MASK                GENMASK(15, 0)
> +#define MUX_FUNC_MASK          GENMASK(31, 16)
> +#define MUX_FUNC_OFFS          16
> +#define MUX_FUNC(pinconf)      ((pinconf & MUX_FUNC_MASK) >> MUX_FUNC_OFFS)
> +
> +enum pfc_pin_port_name {PORT0, PORT1, PORT2, PORT3, PORT4, PORT5, PORT6, PORT7,
> +                       PORT8, PORT9, PORTA, PORTB, PORTC, PORTD, PORTE, PORTF,
> +                       PORTG, PORTH, PORTJ, PORTK, PORTL, PORTM, RZA2_NPORTS};

The only reason for this enum is to fix the value of RZA2_NPORTS,  right?

> +#define RZA2_PDR_BASE(_b)      ((_b) + 0x0000) /* 16-bit, 2 bytes apart */
> +#define RZA2_PODR_BASE(_b)     ((_b) + 0x0040) /* 8-bit, 1 byte apart */
> +#define RZA2_PIDR_BASE(_b)     ((_b) + 0x0060) /* 8-bit, 1 byte apart */
> +#define RZA2_PMR_BASE(_b)      ((_b) + 0x0080) /* 8-bit, 1 byte apart */
> +#define RZA2_DSCR_BASE(_b)     ((_b) + 0x0140) /* 16-bit, 2 bytes apart */
> +#define RZA2_PFS_BASE(_b)      ((_b) + 0x0200) /* 8-bit, 8 bytes apart */
> +#define RZA2_PWPR(_b)          ((_b) + 0x02FF) /* 8-bit */
> +#define RZA2_PFENET(_b)                ((_b) + 0x0820) /* 8-bit */
> +#define RZA2_PPOC(_b)          ((_b) + 0x0900) /* 32-bit */
> +#define RZA2_PHMOMO(_b)                ((_b) + 0x0980) /* 32-bit */
> +#define RZA2_PCKIO(_b)         ((_b) + 0x09D0) /* 8-bit */
> +
> +#define RZA2_PDR(_b, _port)            (RZA2_PDR_BASE(_b) + ((_port) * 2))
> +#define RZA2_PODR(_b, _port)           (RZA2_PODR_BASE(_b) + (_port))
> +#define RZA2_PIDR(_b, _port)           (RZA2_PIDR_BASE(_b) + (_port))
> +#define RZA2_PMR(_b, _port)            (RZA2_PMR_BASE(_b) + (_port))
> +#define RZA2_DSCR(_b, _port)           (RZA2_DSCR_BASE(_b) + ((_port) * 2))
> +#define RZA2_PFS(_b, _port, _pin)      (RZA2_PFS_BASE(_b) + ((_port) * 8) \
> +                                       + (_pin))

The above two sets of macros split information in two locations, and partially
duplicates it. I think it becomes easier to read if you combine them, and factor
out the addition of the base address. E.g.

        #define RZA2_PDR(port)        (0x0000 + (port) * 2) /* Port
Direction, 16-bit */

Then you can write:

        reg16 = readw(pfc_base + RZA2_PDR(port));
        mask16 = RZA2_PDR_MASK << (pin * 2);
        reg16 &= ~mask16;
        writew(reg16, pfc_base + RZA2_PDR(port));

> +static void rza2_set_pin_function(void __iomem *pfc_base, u8 port, u8 pin,
> +                                 u8 func)
> +{
> +       u8 reg8;
> +       u16 reg16;
> +       u16 mask16;
> +
> +       /* Set pin to 'Non-use (Hi-z input protection)'  */
> +       reg16 = readw(RZA2_PDR(pfc_base, port));
> +       mask16 = 0x03 << (pin * 2);

mask16 = RZA2_PDR_MASK << (pin * 2);

> +       reg16 &= ~mask16;
> +       writew(reg16, RZA2_PDR(pfc_base, port));
> +
> +       /* Temporarily switch to GPIO */
> +       reg8 = readb(RZA2_PMR(pfc_base, port));
> +       reg8 &= ~BIT(pin);
> +       writeb(reg8, RZA2_PMR(pfc_base, port));
> +
> +       /* PFS Register Write Protect : OFF */
> +       writeb(0x00, RZA2_PWPR(pfc_base));      /* B0WI=0, PFSWE=0 */
> +       writeb(0x40, RZA2_PWPR(pfc_base));      /* B0WI=0, PFSWE=1 */

#define PWPR_B0WI        BIT(7)        /* Bit Write Disable */
#define PWPR_PFSWE       BIT(6)        /* PFS Register Write Enable */

> +
> +       /* Set Pin function (interrupt disabled, ISEL=0) */
> +       writeb(func, RZA2_PFS(pfc_base, port, pin));

#define PFS_ISEL        BIT(6)        /* Interrupt Select */

> +
> +       /* PFS Register Write Protect : ON */
> +       writeb(0x00, RZA2_PWPR(pfc_base));      /* B0WI=0, PFSWE=0 */
> +       writeb(0x80, RZA2_PWPR(pfc_base));      /* B0WI=1, PFSWE=0 */
> +
> +       /* Port Mode  : Peripheral module pin functions */
> +       reg8 = readb(RZA2_PMR(pfc_base, port));
> +       reg8 |= BIT(pin);
> +       writeb(reg8, RZA2_PMR(pfc_base, port));
> +}
> +
> +static void rza2_pin_to_gpio(void __iomem *pfc_base, u8 port, u8 pin, u8 dir)
> +{
> +       u16 reg16;
> +       u16 mask16;
> +
> +       reg16 = readw(RZA2_PDR(pfc_base, port));
> +       mask16 = RZA2_PDR_MASK << (pin * 2);
> +       reg16 &= ~mask16;
> +
> +       if (dir == GPIOF_DIR_IN)
> +               reg16 |= RZA2_PDR_INPUT << (pin * 2);   /* pin as input */
> +       else
> +               reg16 |= RZA2_PDR_OUTPUT << (pin * 2);  /* pin as output */
> +
> +       writew(reg16, RZA2_PDR(pfc_base, port));
> +}
> +
> +static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
> +       u8 port = offset / 8;
> +       u8 pin = offset % 8;

GPIO offset numbers are identical to PIN numbers, right?
So you can use RZA2_PIN_ID_TO_PORT(), RZA2_PIN_ID_TO_PIN()
for consistency.

> +       u16 reg16;
> +
> +       reg16 = readw(RZA2_PDR(priv->base, port));
> +       reg16 = (reg16 >> (pin * 2)) & RZA2_PDR_MASK;
> +
> +       if (reg16 == RZA2_PDR_OUTPUT)
> +               return GPIOF_DIR_OUT;
> +
> +       if (reg16 == RZA2_PDR_INPUT)
> +               return GPIOF_DIR_IN;
> +
> +       /*
> +        * This GPIO controller has a default Hi-Z state that is not input or
> +        * output, so force the pin to input now.
> +        */
> +       rza2_pin_to_gpio(priv->base, port, pin, GPIOF_DIR_IN);
> +
> +       return GPIOF_DIR_IN;
> +}
> +
> +static int rza2_chip_direction_input(struct gpio_chip *chip,
> +                                    unsigned int offset)
> +{
> +       struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
> +       u8 port = offset / 8;
> +       u8 pin = offset % 8;
> +
> +       rza2_pin_to_gpio(priv->base, port, pin, GPIOF_DIR_IN);

Perhaps pass offset to rza2_pin_to_gpio() directly?

> +
> +       return 0;
> +}
> +
> +static int rza2_chip_direction_output(struct gpio_chip *chip,
> +                                     unsigned int offset, int val)
> +{
> +       struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
> +       u8 port = offset / 8;
> +       u8 pin = offset % 8;
> +
> +       rza2_pin_to_gpio(priv->base, port, pin, GPIOF_DIR_OUT);
> +
> +       return 0;
> +}
> +
> +static int rza2_chip_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
> +       u8 port = offset / 8;
> +       u8 pin = offset % 8;
> +
> +       return (readb(RZA2_PIDR(priv->base, port)) >> pin) & 1;

Might be easier to read if you maintain symmetry with below:

    return !!(readb(RZA2_PIDR(priv->base, port) & BIT(pin));

> +}
> +
> +static void rza2_chip_set(struct gpio_chip *chip, unsigned int offset,
> +                         int value)
> +{
> +       struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
> +       u8 port = offset / 8;
> +       u8 pin = offset % 8;
> +       u8 new_value = readb(RZA2_PODR(priv->base, port));
> +
> +       if (value)
> +               new_value |= (1 << pin);

new_value |= BIT(pin);

> +       else
> +               new_value &= ~(1 << pin);

new_value &= ~BIT(pin);

> +
> +       writeb(new_value, RZA2_PODR(priv->base, port));
> +}
> +
> +static const char * const rza2_gpio_names[] = {
> +       "P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
> +       "P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
> +       "P2_0", "P2_1", "P2_2", "P2_3", "P2_4", "P2_5", "P2_6", "P2_7",
> +       "P3_0", "P3_1", "P3_2", "P3_3", "P3_4", "P3_5", "P3_6", "P3_7",
> +       "P4_0", "P4_1", "P4_2", "P4_3", "P4_4", "P4_5", "P4_6", "P4_7",
> +       "P5_0", "P5_1", "P5_2", "P5_3", "P5_4", "P5_5", "P5_6", "P5_7",
> +       "P6_0", "P6_1", "P6_2", "P6_3", "P6_4", "P6_5", "P6_6", "P6_7",
> +       "P7_0", "P7_1", "P7_2", "P7_3", "P7_4", "P7_5", "P7_6", "P7_7",
> +       "P8_0", "P8_1", "P8_2", "P8_3", "P8_4", "P8_5", "P8_6", "P8_7",
> +       "P9_0", "P9_1", "P9_2", "P9_3", "P9_4", "P9_5", "P9_6", "P9_7",
> +       "PA_0", "PA_1", "PA_2", "PA_3", "PA_4", "PA_5", "PA_6", "PA_7",
> +       "PB_0", "PB_1", "PB_2", "PB_3", "PB_4", "PB_5", "PB_6", "PB_7",
> +       "PC_0", "PC_1", "PC_2", "PC_3", "PC_4", "PC_5", "PC_6", "PC_7",
> +       "PD_0", "PD_1", "PD_2", "PD_3", "PD_4", "PD_5", "PD_6", "PD_7",
> +       "PE_0", "PE_1", "PE_2", "PE_3", "PE_4", "PE_5", "PE_6", "PE_7",
> +       "PF_0", "PF_1", "PF_2", "PF_3", "P0_4", "PF_5", "PF_6", "PF_7",
> +       "PG_0", "PG_1", "PG_2", "P0_3", "PG_4", "PG_5", "PG_6", "PG_7",
> +       "PH_0", "PH_1", "PH_2", "PH_3", "PH_4", "PH_5", "PH_6", "PH_7",
> +       /* port I does not exist */

Hence shouldn't you have 8 NULL entries here?

 * @names: if set, must be an array of strings to use as alternative
 *      names for the GPIOs in this chip. Any entry in the array
 *      may be NULL if there is no alias for the GPIO, however the
 *      array must be @ngpio entries long.  A name can include a single printk
 *      format specifier for an unsigned int.  It is substituted by the actual
 *      number of the gpio.

> +       "PJ_0", "PJ_1", "PJ_2", "PJ_3", "PJ_4", "PJ_5", "PJ_6", "PJ_7",
> +       "PK_0", "PK_1", "PK_2", "PK_3", "PK_4", "PK_5", "PK_6", "PK_7",
> +       "PL_0", "PL_1", "PL_2", "PL_3", "PL_4", "PL_5", "PL_6", "PL_7",
> +       "PM_0", "PM_1", "PM_2", "PM_3", "PM_4", "PM_5", "PM_6", "PM_7",
> +};
> +
> +static struct gpio_chip chip = {
> +       .names = rza2_gpio_names,

BTW, is their much value in filling gpio_chip.names[]?
I had never seen that before.

> +       .base = -1,
> +       .ngpio = RZA2_NPINS,
> +       .get_direction = rza2_chip_get_direction,
> +       .direction_input = rza2_chip_direction_input,
> +       .direction_output = rza2_chip_direction_output,
> +       .get = rza2_chip_get,
> +       .set = rza2_chip_set,

You may want to implement .[gs]et_multiple(), too.

> +};
> +
> +struct pinctrl_gpio_range gpio_range;

Please make this static.
Or even better, store it in rza2_pinctrl_priv?

> +static int rza2_pinctrl_register(struct rza2_pinctrl_priv *priv)
> +{
> +       struct pinctrl_pin_desc *pins;
> +       unsigned int i;
> +       int ret;
> +
> +       pins = devm_kcalloc(priv->dev, RZA2_NPINS, sizeof(*pins), GFP_KERNEL);
> +       if (!pins)
> +               return -ENOMEM;
> +
> +       priv->pins = pins;
> +       priv->desc.pins = pins;
> +       priv->desc.npins = RZA2_NPINS;
> +
> +       for (i = 0; i < RZA2_NPINS; i++) {
> +               unsigned int pin = RZA2_PIN_ID_TO_PIN(i);
> +               unsigned int port = RZA2_PIN_ID_TO_PORT(i);
> +
> +               pins[i].number = i;
> +               pins[i].name = devm_kasprintf(priv->dev, GFP_KERNEL, "P%c_%u",
> +                                             port_names[port], pin);

These are identical to rza2_gpio_names[], so can't you use those?

> +/*
> + * For each DT node, create a single pin mapping. That pin mapping will only
> + * contain a single group of pins, and that group of pins will only have a
> + * single function that can be selected.
> + */
> +static int rza2_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                              struct device_node *np,
> +                              struct pinctrl_map **map,
> +                              unsigned int *num_maps)
> +{
> +       struct rza2_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
> +       struct property *of_pins;
> +       int i;
> +       unsigned int *pins;
> +       unsigned int *psel_val;
> +       const char **pin_fn;
> +       int ret, npins;
> +       int gsel, fsel;

Some people prefer "reverse Xmas tree ordering" i.e. sorted by decreasing
declaration length.

[...]

> +       dev_dbg(priv->dev, "Parsed %s with %d pins\n", np->name, npins);

%pOF ... np

> +
> +       /* Create map where to retrieve function and mux settings from */
> +       *num_maps = 0;
> +       *map = kzalloc(sizeof(**map), GFP_KERNEL);
> +       if (!*map) {
> +               ret = -ENOMEM;
> +               goto remove_function;
> +       }
> +
> +       (*map)->type = PIN_MAP_TYPE_MUX_GROUP;
> +       (*map)->data.mux.group = np->name;
> +       (*map)->data.mux.function = np->name;
> +       *num_maps = 1;
> +
> +       return 0;
> +
> +remove_function:
> +       pinmux_generic_remove_function(pctldev, fsel);
> +
> +remove_group:
> +       pinctrl_generic_remove_group(pctldev, gsel);
> +
> +       dev_info(priv->dev, "Unable to parse DT node %s\n", np->name);

dev_err?

%pOF ... np


> +
> +       return ret;
> +}

> +static int rza2_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
> +                          unsigned int group)
> +{
> +       struct rza2_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
> +       struct function_desc *func;
> +       struct group_desc *grp;
> +       int i;
> +       unsigned int *psel_val;

Reverse Xmas tree ordering?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
