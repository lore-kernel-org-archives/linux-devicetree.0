From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [RFC][PATCH 3/4] power: reset: Add sram-reboot-mode driver
Date: Fri, 5 Aug 2016 19:23:13 -0400
Message-ID: <CAP=VYLpE-+GmCA4XDwSvj9wzD-sNtrEZV+dP1XqjG01J+N=7qA@mail.gmail.com>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org> <1470265523-27557-4-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470265523-27557-4-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Caesar Wang <wxt@rock-chips.com>, Kees Cook <keescook@chromium.org>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 3, 2016 at 7:05 PM, John Stultz <john.stultz@linaro.org> wrote:
> Add sram-reboot-mode driver, which enables
> reboot modes to be specified from sram subnodes.
>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Heiko Stübner <heiko@sntech.de>
> Cc: Caesar Wang <wxt@rock-chips.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Guodong Xu <guodong.xu@linaro.org>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Vishal Bhoj <vishal.bhoj@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: Android Kernel Team <kernel-team@android.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/power/reset/Kconfig            | 10 ++++
>  drivers/power/reset/Makefile           |  1 +
>  drivers/power/reset/sram-reboot-mode.c | 95 ++++++++++++++++++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 drivers/power/reset/sram-reboot-mode.c
>
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 3bfac53..af553ed 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -208,5 +208,15 @@ config SYSCON_REBOOT_MODE
>           register, then the bootloader can read it to take different
>           action according to the mode.
>
> +config SRAM_REBOOT_MODE
> +       bool "Generic SRAM reboot mode driver"

Since this is bool, can we dump the module.h and any MODULE_*
tags from the driver, and register using a builtin variant?

Thanks,
Paul.
--

> +       select REBOOT_MODE
> +       select SRAM
> +       help
> +        Say y here will enable reboot mode driver. This will
> +        get reboot mode arguments and store it in an SRAM
> +        address, then the bootloader can read it to take different
> +        action according to the mode.
> +
>  endif
>
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index 1be307c..14f23ad 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -24,3 +24,4 @@ obj-$(CONFIG_POWER_RESET_RMOBILE) += rmobile-reset.o
>  obj-$(CONFIG_POWER_RESET_ZX) += zx-reboot.o
>  obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
> +obj-$(CONFIG_SRAM_REBOOT_MODE) += sram-reboot-mode.o
> diff --git a/drivers/power/reset/sram-reboot-mode.c b/drivers/power/reset/sram-reboot-mode.c
> new file mode 100644
> index 0000000..8945dac
> --- /dev/null
> +++ b/drivers/power/reset/sram-reboot-mode.c
> @@ -0,0 +1,95 @@
> +/*
> + * Copyright (c) 2016, Linaro Limited
> + * Based on syscon-reboot-mode.c
> + * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/regmap.h>
> +#include "reboot-mode.h"
> +
