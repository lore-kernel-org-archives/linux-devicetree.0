From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: add generic driver for fixed rate clock
Date: Tue, 17 Nov 2015 16:46:29 +0100
Message-ID: <CAMuHMdXhxuawY-V+35YoeZWZ3jZ-Vj_MzuRDGBfDD9i9iy=oGA@mail.gmail.com>
References: <1378010420-20031-1-git-send-email-stefan.kristiansson@saunalahti.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1378010420-20031-1-git-send-email-stefan.kristiansson@saunalahti.fi>
Sender: linux-clk-owner@vger.kernel.org
To: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

(quoting the full driver, as it predates linux-clk)

On Sun, Sep 1, 2013 at 6:40 AM, Stefan Kristiansson
<stefan.kristiansson@saunalahti.fi> wrote:
> This adds a simple driver with the only purpose to initialise
> the fixed rate clock.
> This is useful for systems that do not wish to use seperate init
> code for the fixed rate clock init, but rather only rely on a
> device tree description of it.
>
> Signed-off-by: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>

Thanks, this is still very useful!

I stumbled across this old patch while trying to instantiate a fixed rate
clock from a DT overlay.
Without this, the clock is never instantiated, as drivers/clk/clk-fixed-rate.c
uses CLK_OF_DECLARE() :-( With your driver, it works as expected
(after fixing the modpost complaint, cfr. below).

However, I think that instead of creating a new driver, you should just add
the meat of clk-generic-fixed.c to clk-fixed-rate.c.

> ---
>  drivers/clk/Kconfig             |  8 ++++++
>  drivers/clk/Makefile            |  1 +
>  drivers/clk/clk-generic-fixed.c | 59 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 68 insertions(+)
>  create mode 100644 drivers/clk/clk-generic-fixed.c
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 51380d6..7c8ea78 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -87,6 +87,14 @@ config CLK_PPC_CORENET
>           This adds the clock driver support for Freescale PowerPC corenet
>           platforms using common clock framework.
>
> +config COMMON_CLK_GENERIC_FIXED
> +       tristate "Generic fixed rate clock driver"
> +       depends on OF
> +       ---help---
> +         Driver for systems that do not want to register their fixed rate
> +         clocks through init code, but rather through the device tree
> +         description.
> +
>  endmenu
>
>  source "drivers/clk/mvebu/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 4038c2b..2d46647 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_COMMON_CLK)        += clk-fixed-rate.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-gate.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-mux.o
>  obj-$(CONFIG_COMMON_CLK)       += clk-composite.o
> +obj-$(CONFIG_COMMON_CLK_GENERIC_FIXED) += clk-generic-fixed.o
>
>  # SoCs specific
>  obj-$(CONFIG_ARCH_BCM2835)     += clk-bcm2835.o
> diff --git a/drivers/clk/clk-generic-fixed.c b/drivers/clk/clk-generic-fixed.c
> new file mode 100644
> index 0000000..85df8a8
> --- /dev/null
> +++ b/drivers/clk/clk-generic-fixed.c
> @@ -0,0 +1,59 @@
> +/*
> + * Copyright 2013 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Generic driver for fixed rate clock
> + */
> +#include <linux/platform_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/module.h>
> +
> +static const struct of_device_id generic_fixed_clk_match[] __initconst = {

Please drop the __initconst, as it causes a section mismatch.

> +       { .compatible = "fixed-clock",},
> +       {}
> +};
> +
> +static int generic_fixed_clk_probe(struct platform_device *pdev)
> +{
> +       of_fixed_clk_setup(pdev->dev.of_node);
> +
> +       return 0;
> +}
> +
> +static int generic_fixed_clk_remove(struct platform_device *pdev)
> +{
> +       of_clk_del_provider(pdev->dev.of_node);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver generic_fixed_clk_driver = {
> +       .driver = {
> +               .name = "generic-fixed-clk",
> +               .owner = THIS_MODULE,
> +               .of_match_table = generic_fixed_clk_match,
> +       },
> +       .probe  = generic_fixed_clk_probe,
> +       .remove = generic_fixed_clk_remove,
> +};
> +
> +static int __init generic_fixed_clk_init(void)
> +{
> +       return platform_driver_register(&generic_fixed_clk_driver);
> +}
> +subsys_initcall(generic_fixed_clk_init);
> +
> +static void __exit generic_fixed_exit(void)
> +{
> +       platform_driver_unregister(&generic_fixed_clk_driver);
> +}
> +module_exit(generic_fixed_exit);
> +
> +MODULE_AUTHOR("Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>");
> +MODULE_DESCRIPTION("Generic driver for fixed rate clock");
> +MODULE_LICENSE("GPL v2");

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
