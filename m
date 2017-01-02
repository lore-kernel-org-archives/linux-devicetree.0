From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] iio: adc: Add Renesas GyroADC driver
Date: Mon, 2 Jan 2017 11:01:01 +0100
Message-ID: <CAMuHMdX20kc8h4DiNLu0KwaA0FL6F-WXLnA3YXvu02VJTh_7fQ@mail.gmail.com>
References: <20161230191800.2532-1-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161230191800.2532-1-marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Fri, Dec 30, 2016 at 8:18 PM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add IIO driver for the Renesas RCar GyroADC block. This block is a
> simple 4/8-channel ADC which samples 12/15/24 bits of data every
> cycle from all channels.

Thanks for your patch!

> Signed-off-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> ---
>  .../bindings/iio/adc/renesas,gyroadc.txt           |  38 +++
>  MAINTAINERS                                        |   6 +
>  drivers/iio/adc/Kconfig                            |  10 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/iio/adc/rcar_gyro_adc.c                    | 379 +++++++++++++++++++++
>  5 files changed, 434 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
>  create mode 100644 drivers/iio/adc/rcar_gyro_adc.c
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt b/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
> new file mode 100644
> index 0000000..3fd5f57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
> @@ -0,0 +1,38 @@
> +* Renesas RCar GyroADC device driver
> +
> +Required properties:
> +- compatible:  Should be "renesas,rcar-gyroadc" for regular GyroADC or
> +               "renesas,rcar-gyroadc-r8a7792" for GyroADC without interrupt

Please use "renesas,r8a7792-gyroadc" to match existing practices.

Unfortunately we cannot just look at the presence of an "interrupts" property
to distinguish between the two variants, as the interrupt is handled
by a different
block (Speed Pulse IF).

Do you have a (future) use for the interrupt? If yes, we will need a phandle
link to the Speed Pulse IF device node later...

BTW, it's a good idea to always cater for SoC-specific differences that may
be discovered later by adding SoC-specific compatible values.

BTW, the same hardware block seems to be present in R-Car Gen1 and
R-Car Gen3 SoCs.

> +               block found in R8A7792.

> +- renesas,gyroadc-vref:        Array of reference voltage values for each input to
> +                       the GyroADC, in uV. Array must have 4 elemenets for
> +                       mode 1 and 8 elements for mode 2 and 3.

Should this be an array of phandles to regulators instead?

> --- /dev/null
> +++ b/drivers/iio/adc/rcar_gyro_adc.c
> @@ -0,0 +1,379 @@
> +/*
> + * Renesas RCar GyroADC driver

R-Car

> + *
> + * Copyright 2016 Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

MODULE_LICENSE() says GPL V2 only?

> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>

Do you need this include? There's no interrupt support.

> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/regulator/consumer.h>

Do you need this include?
Ah, you were already anticipating the array of phandles to regulators ;-)


> +struct rcar_gyroadc {
> +       struct device           *dev;
> +       void __iomem            *regs;
> +       struct clk              *fclk;
> +       struct clk              *clk;

iclk?

> +static void rcar_gyroadc_hw_init(struct rcar_gyroadc *priv)
> +{
> +       unsigned long clk_mhz = clk_get_rate(priv->clk) / 1000000;
> +
> +       /* Stop the GyroADC. */
> +       writel(0, priv->regs + RCAR_GYROADC_START_STOP);
> +
> +       /* Disable IRQ, except on V2H. */
> +       if (priv->model != RCAR_GYROADC_MODEL_R8A7792)
> +               writel(0, priv->regs + RCAR_GYROADC_INTENR);
> +
> +       /* Set mode and timing. */
> +       writel(priv->mode, priv->regs + RCAR_GYROADC_MODE_SELECT);
> +
> +       if (priv->mode == RCAR_GYROADC_MODE_SELECT_1_MB88101A)
> +               writel(clk_mhz * 10, priv->regs + RCAR_GYROADC_CLOCK_LENGTH);
> +       else if (priv->mode == RCAR_GYROADC_MODE_SELECT_2_ADCS7476)
> +               writel(clk_mhz * 5, priv->regs + RCAR_GYROADC_CLOCK_LENGTH);
> +       else if (priv->mode == RCAR_GYROADC_MODE_SELECT_3_MAX1162)
> +               writel(clk_mhz * 5, priv->regs + RCAR_GYROADC_CLOCK_LENGTH);
> +       writel(clk_mhz * 1250, priv->regs + RCAR_GYROADC_1_25MS_LENGTH);
> +
> +       /*
> +        * We can possibly turn the sampling on/off on-demand to reduce power

And the module clock, using runtime PM (see below).

> +        * consumption, but for the sake of quick availability of samples, we
> +        * don't do it now.
> +        */
> +       writel(RCAR_GYROADC_START_STOP_START,
> +              priv->regs + RCAR_GYROADC_START_STOP);
> +
> +       /* Wait for the first conversion to complete. */
> +       udelay(1250);
> +}

> +static const struct of_device_id rcar_gyroadc_match[] = {
> +       {
> +               /* RCar Gen2 compatible GyroADC */

R-Car

> +               .compatible     = "renesas,rcar-gyroadc",
> +               .data           = (void *)RCAR_GYROADC_MODEL_DEFAULT,
> +       }, {
> +               /* RCar V2H specialty without interrupt registers. */

R-Car

> +               .compatible     = "renesas,rcar-gyroadc-r8a7792",
> +               .data           = (void *)RCAR_GYROADC_MODEL_R8A7792,
> +       }, {
> +               /* sentinel */
> +       }
> +};

> +static int rcar_gyroadc_probe(struct platform_device *pdev)
> +{

> +       priv->fclk = devm_clk_get(dev, "fck");

The module clock isn't used directly by this driver (you don't need
e.g. its rate),
so you can leave out all handling related to this clock iff you enable
runtime PM:

    pm_runtime_enable(dev);
    pm_runtime_get_sync(dev);

Then runtime PM will take care of enabling the module clock, as the
GyroADC block is part of the CPG/MSSR clock domain.
Doing that also means the driver keeps on working in future SoCs where
the GyroADC block may be located in a power area.

> +       if (IS_ERR(priv->fclk)) {
> +               ret = PTR_ERR(priv->fclk);
> +               dev_err(dev, "Failed to get FCK clock (ret=%i)\n", ret);

Do you need this error message? It will add to the noise in case of
deferred probing.
Please either remove it, or make it depend on != -EPROBE_DEFER.

> +               return ret;
> +       }
> +
> +       priv->clk = devm_clk_get(dev, "if");
> +       if (IS_ERR(priv->clk)) {
> +               ret = PTR_ERR(priv->clk);
> +               dev_err(dev, "Failed to get IF clock (ret=%i)\n", ret);

Likewise.

> +               return ret;
> +       }
> +
> +       ret = of_property_read_u32(pdev->dev.of_node, "renesas,gyroadc-mode",
> +                                  &mode);
> +       if (ret || (mode < 1) || (mode > 3)) {
> +               dev_err(dev, "Failed to get GyroADC mode (ret=%i)\n", ret);

Note that this will print "ret=0" (no error?) if an invalid mode was specified.

> +               return ret;
> +       }
> +
> +       if (mode == 1)
> +               priv->mode = RCAR_GYROADC_MODE_SELECT_1_MB88101A;
> +       else if (mode == 2)
> +               priv->mode = RCAR_GYROADC_MODE_SELECT_2_ADCS7476;
> +       else if (mode == 3)
> +               priv->mode = RCAR_GYROADC_MODE_SELECT_3_MAX1162;

switch()? And print the invalid mode message here?

> +
> +       of_property_read_u32_array(pdev->dev.of_node, "renesas,gyroadc-vref",
> +                                  priv->vref_uv, (mode == 1) ? 4 : 8);

This call may fail.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
