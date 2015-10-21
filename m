From: Alban <albeu@free.fr>
Subject: Re: [PATCH 4/5] MIPS: xilfpga: Add mipsfpga platform code
Date: Wed, 21 Oct 2015 16:35:02 +0200
Message-ID: <20151021163502.44be785f@avionic-0020>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1444827117-10939-5-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444827117-10939-5-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Alban <albeu@free.fr>, ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Wed, 14 Oct 2015 13:51:56 +0100
schrieb Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>:

> The xilfpga platform will be DT only.
> 
> Add required platform code. DT files have already been added separately
>
> [...]
>
> diff --git a/arch/mips/include/asm/mach-xilfpga/gpio.h b/arch/mips/include/asm/mach-xilfpga/gpio.h
> new file mode 100644
> index 0000000..26778fc
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-xilfpga/gpio.h
> @@ -0,0 +1,19 @@
> +/*
> + * Copyright (C) 2015 Imagination Technologies
> + * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#ifndef __ASM_MACH_XILFPGA_GPIO_H
> +#define __ASM_MACH_XILFPGA_GPIO_H
> +
> +#include <asm-generic/gpio.h>
> +
> +#define gpio_get_value __gpio_get_value
> +#define gpio_set_value __gpio_set_value
> +
> +#endif /* __ASM_MACH_XILFPGA_GPIO_H */

Custom gpio.h has been disabled, this file won't be used, it can just
be dropped.

> diff --git a/arch/mips/include/asm/mach-xilfpga/irq.h b/arch/mips/include/asm/mach-xilfpga/irq.h
> new file mode 100644
> index 0000000..0132a5b9
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-xilfpga/irq.h
> @@ -0,0 +1,18 @@
> +/*
> + * Copyright (C) 2015 Imagination Technologies
> + * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#ifndef __MIPS_ASM_MACH_XILFPGA_IRQ_H__
> +#define __MIPS_ASM_MACH_XILFPGA_IRQ_H__
> +
> +#define NR_IRQS 32
> +
> +#include_next <irq.h>
> +
> +#endif /* __MIPS_ASM_MACH_XILFPGA_IRQ_H__ */

Is this really needed? If not I would not add it to keep the maintenance
burden down.

> [...]
>
> diff --git a/arch/mips/xilfpga/time.c b/arch/mips/xilfpga/time.c
> new file mode 100644
> index 0000000..3f2e39e
> --- /dev/null
> +++ b/arch/mips/xilfpga/time.c
> @@ -0,0 +1,41 @@
> +/*
> + * Xilfpga clocksource/timer setup
> + *
> + * Copyright (C) 2015 Imagination Technologies
> + * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clocksource.h>
> +#include <linux/of.h>
> +
> +#include <asm/time.h>
> +
> +void __init plat_time_init(void)
> +{
> +	struct device_node *np;
> +	struct clk *clk = 0;
> +
> +	of_clk_init(NULL);
> +	clocksource_of_init();
> +
> +	np = of_get_cpu_node(0, NULL);
> +	if (!np) {
> +		pr_err("Failed to get CPU node\n");
> +		return;
> +	}
> +
> +	clk = of_clk_get(np, 0);
> +	if (IS_ERR(clk)) {
> +		pr_err("Failed to get CPU clock: %ld\n", PTR_ERR(clk));
> +		return;
> +	}
> +
> +	mips_hpt_frequency = clk_get_rate(clk) / 2;
> +	clk_put(clk);
> +}

I wanted to use something similar on ATH79 once all boards moved to DT.
On the other hand I saw that BMIPS use a dedicated property on the CPU
node to represent the HPT frequency. If possible it would make sense to
use a common scheme for all MIPS platforms. However I personally don't
know enough about MIPS in general to judge this.

On the other hand I think it might make more sense to have a dedicated
node in DT to represent the HPT timer instead of hacking on the CPU
node. That would also fit better if the HPT code ever become is a real
driver.

Alban
