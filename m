From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH v3 3/3] reset: zx2967: add reset controller driver for
 ZTE's zx2967 family
Date: Wed, 1 Feb 2017 21:37:13 -0500
Message-ID: <CAP=VYLqhAEKAdnO7skBU7V+NxbQqXs_UbOO0J1hYHmCq3aKQow@mail.gmail.com>
References: <1484623377-16208-1-git-send-email-baoyou.xie@linaro.org> <1484623377-16208-3-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484623377-16208-3-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 10:22 PM, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch adds reset controller driver for ZTE's zx2967 family.
>
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/reset/Kconfig        |   6 +++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-zx2967.c | 106 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 drivers/reset/reset-zx2967.c
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 172dc96..f4cdfe9 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -86,6 +86,12 @@ config RESET_UNIPHIER
>           Say Y if you want to control reset signals provided by System Control
>           block, Media I/O block, Peripheral Block.
>
> +config RESET_ZX2967
> +       bool "ZTE ZX2967 Reset Driver"

This new driver just tripped my linux-next testing for non-modular code
that is using modular infrastructure.  Is there any value in having this
driver as a tristate, or should I send a patch to strip out the needless
references to anything modular?

Thanks,
Paul.
--

> +       depends on ARCH_ZX || COMPILE_TEST
> +       help
> +         This enables the reset controller driver for ZTE's zx2967 family.
> +
>  config RESET_ZYNQ
>         bool "ZYNQ Reset Driver" if COMPILE_TEST
>         default ARCH_ZYNQ
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 13b346e..2cd3f6c 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -13,4 +13,5 @@ obj-$(CONFIG_RESET_STM32) += reset-stm32.o
>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>  obj-$(CONFIG_TI_SYSCON_RESET) += reset-ti-syscon.o
>  obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
> +obj-$(CONFIG_RESET_ZX2967) += reset-zx2967.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
> diff --git a/drivers/reset/reset-zx2967.c b/drivers/reset/reset-zx2967.c
> new file mode 100644
> index 0000000..5d82151
> --- /dev/null
> +++ b/drivers/reset/reset-zx2967.c
> @@ -0,0 +1,106 @@
> +/*
> + * ZTE's zx2967 family reset controller driver
> + *
> + * Copyright (C) 2017 ZTE Ltd.
> + *
> + * Author: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + *
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +
> +#include <linux/module.h>

[...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
