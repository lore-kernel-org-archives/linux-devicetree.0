From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH 8/9] pinctrl: mvebu: add driver for Armada CP110 pinctrl
Date: Sat, 20 May 2017 15:09:04 -0400
Message-ID: <CAP=VYLo3FPWwkqX1fqxLh_KTAAPWMTgpgcop+SNtC+HVgBusUg@mail.gmail.com>
References: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
 <00e3f4966a18340cb060c0d39da1f92a9c76fcda.1495209664.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <00e3f4966a18340cb060c0d39da1f92a9c76fcda.1495209664.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 12:04 PM, Gregory CLEMENT
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> From: Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> This commit adds a pinctrl driver for the CP110 part of the Marvell
> Armada 7K and 8K SoCs. The Armada 7K has a single CP110, where almost all
> the MPP pins are available. On the other side, the Armada 8K has two
> CP110, and the available MPPs are split between the master CP110 (MPPs 32
> to 62) and the slave CP110 (MPPs 0 to 31).
>
> The register interface to control the MPPs is however the same as all
> other mvebu SoCs, so we can reuse the common pinctrl-mvebu.c logic.
>
> Signed-off-by: Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> [updated for mvebu pinctrl and 4.9 changes:
>  - converted to simple_mmio
>  - converted to syscon/regmap
>  - removed unimplemented .remove function
>  - dropped DTS changes
>  - defered gpio ranges to DT
>  - fixed warning
>  - properly set soc->nmodes
>  -- rmk]
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>
> [ add missing MPP[61:56] function 14 (SDIO)
> -- Konstantin Porotchkin]
> Signed-off-by: Konstantin Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> [ allow to properly register more then one instance of this driver
> -- Grzegorz Jaszczyk]
> Signed-off-by: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
>
> [ - rebased on 4.12-rc1
>   - fixed the 80 character limit for mvebu_mpp_mode array
>   - aligned the compatible name on the ones already used
>   - fixed the MPP table for CP110: some MPP are not available on Armada 7K
> -- Gregory CLEMENT]
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/pinctrl/mvebu/Kconfig                |   4 +-
>  drivers/pinctrl/mvebu/Makefile               |   1 +-
>  drivers/pinctrl/mvebu/pinctrl-armada-cp110.c | 692 ++++++++++++++++++++-
>  3 files changed, 697 insertions(+)
>  create mode 100644 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
>
> diff --git a/drivers/pinctrl/mvebu/Kconfig b/drivers/pinctrl/mvebu/Kconfig
> index 0e0b009f2b71..d9773b77ff9f 100644
> --- a/drivers/pinctrl/mvebu/Kconfig
> +++ b/drivers/pinctrl/mvebu/Kconfig
> @@ -32,6 +32,10 @@ config PINCTRL_ARMADA_AP806
>         bool
>         select PINCTRL_MVEBU
>
> +config PINCTRL_ARMADA_CP110
> +       bool
> +       select PINCTRL_MVEBU

Same comment for this driver; if we'd not add new instances of
non-modular code using the modular functions/macros, it would
be greatly appreciated.

Thanks,
Paul.
--

> +
>  config PINCTRL_ARMADA_XP
>         bool
>         select PINCTRL_MVEBU
> diff --git a/drivers/pinctrl/mvebu/Makefile b/drivers/pinctrl/mvebu/Makefile
> index 455db274b53d..5b03fd55e28d 100644
> --- a/drivers/pinctrl/mvebu/Makefile
> +++ b/drivers/pinctrl/mvebu/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_PINCTRL_ARMADA_375) += pinctrl-armada-375.o
>  obj-$(CONFIG_PINCTRL_ARMADA_38X) += pinctrl-armada-38x.o
>  obj-$(CONFIG_PINCTRL_ARMADA_39X) += pinctrl-armada-39x.o
>  obj-$(CONFIG_PINCTRL_ARMADA_AP806) += pinctrl-armada-ap806.o
> +obj-$(CONFIG_PINCTRL_ARMADA_CP110) += pinctrl-armada-cp110.o
>  obj-$(CONFIG_PINCTRL_ARMADA_XP)  += pinctrl-armada-xp.o
>  obj-$(CONFIG_PINCTRL_ARMADA_37XX)  += pinctrl-armada-37xx.o
>  obj-$(CONFIG_PINCTRL_ORION)  += pinctrl-orion.o
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
> new file mode 100644
> index 000000000000..f835f9262829
> --- /dev/null
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
> @@ -0,0 +1,692 @@
> +/*
> + * Marvell Armada CP110 pinctrl driver based on mvebu pinctrl core
> + *
> + * Copyright (C) 2017 Marvell
> + *
> + * Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>

 [...]

> +
> +module_platform_driver(armada_cp110_pinctrl_driver);
> +
> +MODULE_AUTHOR("Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_DESCRIPTION("Marvell Armada CP110 pinctrl driver");
> +MODULE_LICENSE("GPL v2");
> --
> git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
