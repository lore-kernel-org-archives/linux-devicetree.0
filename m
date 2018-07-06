Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180617120535.2529-3-daniel@zonque.org>
References: <20180617120535.2529-1-daniel@zonque.org>
 <20180617120535.2529-3-daniel@zonque.org>
Message-ID: <153090219921.143105.13192784806759479635@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 2/2] clk: Add driver for MAX9485
Date: Fri, 06 Jul 2018 11:36:39 -0700
To: Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Daniel Mack (2018-06-17 05:05:35)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 721572a8c429..ae5539a1d283 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -45,6 +45,12 @@ config COMMON_CLK_MAX77686
>           This driver supports Maxim 77620/77686/77802 crystal oscillator
>           clock.
>  =

> +config COMMON_CLK_MAX9485
> +       tristate "Clock driver for Maxim 9485 Programmable Clock Generato=
r"

Drop the "Clock driver for" part please. These are all clock drivers.

> +       depends on I2C
> +       ---help---
> +         This driver supports Maxim 9485 Programmable Audio Clock Genera=
tor
> +
>  config COMMON_CLK_RK808
>         tristate "Clock driver for RK805/RK808/RK818"
>         depends on MFD_RK808
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index ae40cbe770f0..24fc2b634362 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_COMMON_CLK_ASPEED)               +=3D clk-=
aspeed.o
>  obj-$(CONFIG_ARCH_HIGHBANK)            +=3D clk-highbank.o
>  obj-$(CONFIG_CLK_HSDK)                 +=3D clk-hsdk-pll.o
>  obj-$(CONFIG_COMMON_CLK_MAX77686)      +=3D clk-max77686.o
> +obj-$(CONFIG_COMMON_CLK_MAX9485)       +=3D clk-max9485.o
>  obj-$(CONFIG_ARCH_MOXART)              +=3D clk-moxart.o
>  obj-$(CONFIG_ARCH_NOMADIK)             +=3D clk-nomadik.o
>  obj-$(CONFIG_ARCH_NPCM7XX)             +=3D clk-npcm7xx.o
> diff --git a/drivers/clk/clk-max9485.c b/drivers/clk/clk-max9485.c
> new file mode 100644
> index 000000000000..4bae7deeda10
> --- /dev/null
> +++ b/drivers/clk/clk-max9485.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * clk-max9485.c: MAX9485 Programmable Audio Clock Generator
> + *
> + * (c) 2018 Daniel Mack <daniel@zonque.org>
> + *
> + * References:
> + *   MAX9485 Datasheet
> + *     http://www.maximintegrated.com/datasheet/index.mvp/id/4421
> + *
> + * This program is free software; you can redistribute  it and/or modify=
 it
> + * under  the terms of  the GNU General  Public License as published by =
the
> + * Free Software Foundation;  either version 2 of the  License, or (at y=
our
> + * option) any later version.

With SPDX tag this is suppose to be removed. Can you resend with this
license blurb removed?

> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <dt-bindings/clock/maxim,max9485.h>
> +
> +#define MAX9485_NUM_CLKS 4
> +
> +/* This chip has only one register of 8 bit width. */
> +
> +#define MAX9485_FS_12KHZ       (0 << 0)
> +#define MAX9485_FS_32KHZ       (1 << 0)
> +#define MAX9485_FS_44_1KHZ     (2 << 0)
> +#define MAX9485_FS_48KHZ       (3 << 0)
> +
> +#define MAX9485_SCALE_256      (0 << 2)
> +#define MAX9485_SCALE_384      (1 << 2)
> +#define MAX9485_SCALE_768      (2 << 2)
> +
> +#define MAX9485_DOUBLE         BIT(4)
> +#define MAX9485_CLKOUT1_ENABLE BIT(5)
> +#define MAX9485_CLKOUT2_ENABLE BIT(6)
> +#define MAX9485_MCLK_ENABLE    BIT(7)
> +#define MAX9485_FREQ_MASK      0x1f
> +
> +struct max9485_rate {
> +       unsigned long out;
> +       u8 reg_value;
> +};
> +
> +/*
> + * Ordered by frequency. For frequency the hardware can generate with
> + * multiple settings, the one with lowest jitter is listed first.
> + */
> +static const struct max9485_rate max9485_rates[] =3D {
> +       {  3072000, MAX9485_FS_12KHZ   | MAX9485_SCALE_256 },
> +       {  4608000, MAX9485_FS_12KHZ   | MAX9485_SCALE_384 },
> +       {  8192000, MAX9485_FS_32KHZ   | MAX9485_SCALE_256 },
> +       {  9126000, MAX9485_FS_12KHZ   | MAX9485_SCALE_768 },
> +       { 11289600, MAX9485_FS_44_1KHZ | MAX9485_SCALE_256 },
> +       { 12288000, MAX9485_FS_48KHZ   | MAX9485_SCALE_256 },
> +       { 12288000, MAX9485_FS_32KHZ   | MAX9485_SCALE_384 },
> +       { 16384000, MAX9485_FS_32KHZ   | MAX9485_SCALE_256 | MAX9485_DOUB=
LE },
> +       { 16934400, MAX9485_FS_44_1KHZ | MAX9485_SCALE_384 },
> +       { 18384000, MAX9485_FS_48KHZ   | MAX9485_SCALE_384 },
> +       { 22579200, MAX9485_FS_44_1KHZ | MAX9485_SCALE_256 | MAX9485_DOUB=
LE },
> +       { 24576000, MAX9485_FS_48KHZ   | MAX9485_SCALE_256 | MAX9485_DOUB=
LE },
> +       { 24576000, MAX9485_FS_32KHZ   | MAX9485_SCALE_384 | MAX9485_DOUB=
LE },
> +       { 24576000, MAX9485_FS_32KHZ   | MAX9485_SCALE_768 },
> +       { 33868800, MAX9485_FS_44_1KHZ | MAX9485_SCALE_384 | MAX9485_DOUB=
LE },
> +       { 33868800, MAX9485_FS_44_1KHZ | MAX9485_SCALE_768 },
> +       { 36864000, MAX9485_FS_48KHZ   | MAX9485_SCALE_384 | MAX9485_DOUB=
LE },
> +       { 36864000, MAX9485_FS_48KHZ   | MAX9485_SCALE_768 },
> +       { 49152000, MAX9485_FS_32KHZ   | MAX9485_SCALE_768 | MAX9485_DOUB=
LE },
> +       { 67737600, MAX9485_FS_44_1KHZ | MAX9485_SCALE_768 | MAX9485_DOUB=
LE },
> +       { 73728000, MAX9485_FS_48KHZ   | MAX9485_SCALE_768 | MAX9485_DOUB=
LE },
> +       { } /* sentinel */

Behold the sentinel!

> +};
> +
> +struct max9485_driver_data;
> +
> +struct max9485_clk_hw {
> +       struct clk_hw hw;
> +       struct clk_init_data init;
> +       u8 enable_bit;
> +       struct max9485_driver_data *drvdata;
> +};
> +
> +struct max9485_driver_data {
> +       struct clk *xclk;
> +       struct i2c_client *client;
> +       u8 reg_value;
> +       struct regulator *supply;
> +       struct gpio_desc *reset_gpio;
> +       struct max9485_clk_hw hw[MAX9485_NUM_CLKS];
> +};
> +
> +static inline struct max9485_clk_hw *to_max9485_clk(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct max9485_clk_hw, hw);
> +}
> +
> +static int max9485_update_bits(struct max9485_driver_data *drvdata,
> +                              u8 mask, u8 value)
> +{
> +       int ret;
> +
> +       drvdata->reg_value &=3D ~mask;
> +       drvdata->reg_value |=3D value;
> +
> +       dev_dbg(&drvdata->client->dev,
> +               "updating mask %02x value %02x -> %02x\n",

May want to add 0x here so you know it's in hex?
 =

> +               mask, value, drvdata->reg_value);
> +
> +       ret =3D i2c_master_send(drvdata->client,
> +                             &drvdata->reg_value,
> +                             sizeof(drvdata->reg_value));
> +
> +       return ret < 0 ? ret : 0;
> +}
> +
> +static int max9485_clk_prepare(struct clk_hw *hw)
> +{
> +       struct max9485_clk_hw *clk_hw =3D to_max9485_clk(hw);
> +
> +       return max9485_update_bits(clk_hw->drvdata,
> +                                  clk_hw->enable_bit,
> +                                  clk_hw->enable_bit);
> +}
> +
> +static void max9485_clk_unprepare(struct clk_hw *hw)
> +{
> +       struct max9485_clk_hw *clk_hw =3D to_max9485_clk(hw);
> +
> +       max9485_update_bits(clk_hw->drvdata, clk_hw->enable_bit, 0);
> +}
> +
> +/*
> + * CLKOUT - configurable clock output
> + */
> +static int max9485_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                  unsigned long parent_rate)
> +{
> +       struct max9485_clk_hw *clk_hw =3D to_max9485_clk(hw);
> +       const struct max9485_rate *entry;
> +
> +       for (entry =3D max9485_rates; entry->out !=3D 0; entry++)
> +               if (entry->out =3D=3D rate)
> +                       break;
> +
> +       if (entry->out =3D=3D 0)
> +               return -EINVAL;
> +
> +       return max9485_update_bits(clk_hw->drvdata,
> +                                  MAX9485_FREQ_MASK,
> +                                  entry->reg_value);
> +}
> +
> +static unsigned long max9485_clkout_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct max9485_clk_hw *clk_hw =3D to_max9485_clk(hw);
> +       struct max9485_driver_data *drvdata =3D clk_hw->drvdata;
> +       const struct max9485_rate *entry;
> +       int ret;
> +
> +       ret =3D i2c_master_recv(drvdata->client,
> +                             &drvdata->reg_value,
> +                             sizeof(drvdata->reg_value));
> +       if (ret < 0) {
> +               dev_warn(&drvdata->client->dev,
> +                        "Unable to read register: %d\n", ret);
> +               return 0;
> +       }
> +
> +       for (entry =3D max9485_rates; entry->out !=3D 0; entry++)
> +               if ((drvdata->reg_value & MAX9485_FREQ_MASK) =3D=3D entry=
->reg_value)
> +                       return entry->out;

Can you make a local variable, like u8 val, and then use that everywhere
in this function and assign that to drvdata->reg_value after reading it?
It will make the lines much shorter. I really don't like how this
function is caching the reg_value at all BTW. It means we rely on
recalc_rate() being called before things work, which is fragile.
Preferably that reading and caching is done once in the probe of this
driver and then never done again. Can you change to do that?

> +
> +       return 0;
> +}
