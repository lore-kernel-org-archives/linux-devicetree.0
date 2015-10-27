From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] clk: bcm: Add BCM63138 clock support
Date: Tue, 27 Oct 2015 10:46:59 -0700
Message-ID: <20151027174659.GM19782@codeaurora.org>
References: <1445917997-3629-1-git-send-email-f.fainelli@gmail.com>
 <1445917997-3629-3-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1445917997-3629-3-git-send-email-f.fainelli@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

On 10/26, Florian Fainelli wrote:
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index 85260fb96b36..a0c18528b70d 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -1,3 +1,13 @@
> +config CLK_BCM_63XX
> +	bool "Broadcom BCM63xx clock support"
> +	depends on ARCH_BCM_63XX || COMPILE_TEST
> +	depends on COMMON_CLK
> +	select COMMON_CLK_IPROC
> +	default y

perhaps default CLK_BCM_63XX?

> +	help
> +	  Enable common clock framework support for Broadcom BCM63xx DSL SoCs
> +	  based on the ARM architecture
> +
>  config CLK_BCM_KONA
>  	bool "Broadcom Kona CCU clock support"
>  	depends on ARCH_BCM_MOBILE || COMPILE_TEST
> diff --git a/drivers/clk/bcm/clk-bcm63xx.c b/drivers/clk/bcm/clk-bcm63xx.c
> new file mode 100644
> index 000000000000..b7e0469d0522
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-bcm63xx.c
> @@ -0,0 +1,22 @@
> +/*
> + * Copyright (C) 2015 Broadcom Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation version 2.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> + * kind, whether express or implied; without even the implied warranty
> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <linux/kernel.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>

#include <linux/init.h> ?

I'm not sure what the kernel.h include is for.

> +#include "clk-iproc.h"
> +
> +static void __init bcm63138_armpll_init(struct device_node *node)
> +{
> +	iproc_armpll_setup(node);
> +}
> +CLK_OF_DECLARE(bcm63138_armpll, "brcm,bcm63138-armpll", bcm63138_armpll_init);
> -- 
> 2.1.0
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
