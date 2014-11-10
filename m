From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 12/17] ARM: mvebu: Armada XP GP specific suspend/resume
 code
Date: Mon, 10 Nov 2014 14:53:38 +0100
Message-ID: <5460C362.2090802@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com> <1414151970-6626-13-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414151970-6626-13-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

[...]

> +#include "common.h"
> +
> +#define ARMADA_XP_GP_PIC_NR_GPIOS 3
> +
> +static void __iomem *gpio_ctrl;
> +static int pic_gpios[ARMADA_XP_GP_PIC_NR_GPIOS];
> +static int pic_raw_gpios[ARMADA_XP_GP_PIC_NR_GPIOS];
> +
> +static void mvebu_armada_xp_gp_pm_enter(void __iomem *sdram_reg, u32 srcmd)
> +{
> +	u32 reg, ackcmd;
> +	int i;
> +
> +	/* Put 001 as value on the GPIOs */
> +	reg = readl(gpio_ctrl);
> +	for (i = 0; i < ARMADA_XP_GP_PIC_NR_GPIOS; i++)
> +		reg &= ~BIT(pic_raw_gpios[i]);
> +	reg |= BIT(pic_raw_gpios[0]);
> +	writel(reg, gpio_ctrl);
> +
> +	/* Prepare writing 111 to the GPIOs */
> +	ackcmd = readl(gpio_ctrl);
> +	for (i = 0; i < ARMADA_XP_GP_PIC_NR_GPIOS; i++)
> +		ackcmd |= BIT(pic_raw_gpios[i]);
> +
> +	/* Wait a while */
> +	mdelay(250);
> +
> +	asm volatile (
> +		/* Align to a cache line */
> +		".balign 32\n\t"
> +
> +		/* Enter self refresh */
> +		"str %[srcmd], [%[sdram_reg]]\n\t"
> +
> +		/* Wait 100 cycles for DDR to enter self refresh */
> +		"1: subs r1, r1, #1\n\t"

I should miss something obvious, but I don't see where you load 100 in
the r1 register. According to your comment and the code, you remove 1 from
r1 until it reaches 0, so I expected that just before you have loaded 100 in r1.

Thanks,

Gregory

> +		"bne 1b\n\t"
> +
> +		/* Issue the command ACK */
> +		"str %[ackcmd], [%[gpio_ctrl]]\n\t"
> +
> +		/* Trap the processor */
> +		"b .\n\t"
> +		: : [srcmd] "r" (srcmd), [sdram_reg] "r" (sdram_reg),
> +		  [ackcmd] "r" (ackcmd), [gpio_ctrl] "r" (gpio_ctrl) : "r1");
> +}

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
