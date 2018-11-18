From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [RFC v2 5/7] clocksource/drivers/rtl8186: Add RTL8186 timer
 driver
Date: Sun, 18 Nov 2018 02:39:31 +0100
Message-ID: <dd8dbad0-efc3-fab1-e1d8-75819af66879@linaro.org>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
 <20181001102952.7913-6-yasha.che3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181001102952.7913-6-yasha.che3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yasha Cherikovsky <yasha.che3@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hi Yasha,

except the few details below, the driver looks good to me.

On 01/10/2018 12:29, Yasha Cherikovsky wrote:
> The Realtek RTL8186 SoC is a MIPS based SoC
> used in some home routers [1][2].
> 
> This adds a driver to handle the built-in timers
> on this SoC.
> 
> Timers 0 and 1 are 24bit timers.
> Timers 2 and 3 are 32bit timers.
> 
> Use Timer2 as clocksource and Timer3 for clockevents.
> Timer2 is also used for sched_clock.
> 
> [1] https://www.linux-mips.org/wiki/Realtek_SOC#Realtek_RTL8186
> [2] https://wikidevi.com/wiki/Realtek_RTL8186
> 
> Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-mips@linux-mips.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clocksource/Kconfig         |   9 ++
>  drivers/clocksource/Makefile        |   1 +
>  drivers/clocksource/timer-rtl8186.c | 220 ++++++++++++++++++++++++++++
>  3 files changed, 230 insertions(+)
>  create mode 100644 drivers/clocksource/timer-rtl8186.c
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index dec0dd88ec15..da87f73d0631 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -609,4 +609,13 @@ config ATCPIT100_TIMER
>  	help
>  	  This option enables support for the Andestech ATCPIT100 timers.
>  
> +config RTL8186_TIMER
> +	bool "RTL8186 timer driver"
> +	depends on MACH_RTL8186
> +	depends on COMMON_CLK
> +	select TIMER_OF
> +	select CLKSRC_MMIO
> +	help
> +	  Enables support for the RTL8186 timer driver.
> +

Please, convert this entry like the MTK_TIMER or the SPRD_TIMER.

>  endmenu
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 00caf37e52f9..734e8566e1b6 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -78,3 +78,4 @@ obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
>  obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
>  obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
>  obj-$(CONFIG_ATCPIT100_TIMER)		+= timer-atcpit100.o
> +obj-$(CONFIG_RTL8186_TIMER)		+= timer-rtl8186.o
> diff --git a/drivers/clocksource/timer-rtl8186.c b/drivers/clocksource/timer-rtl8186.c
> new file mode 100644
> index 000000000000..47ef4b09ad27
> --- /dev/null
> +++ b/drivers/clocksource/timer-rtl8186.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Realtek RTL8186 SoC timer driver.
> + *
> + * Timer0 (24bit): Unused
> + * Timer1 (24bit): Unused
> + * Timer2 (32bit): Used as clocksource
> + * Timer3 (32bit): Used as clock event device
> + *
> + * Copyright (C) 2018 Yasha Cherikovsky
> + */
> +
> +#include <linux/init.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/interrupt.h>
> +#include <linux/jiffies.h>
> +#include <linux/sched_clock.h>
> +#include <linux/of_clk.h>
> +#include <linux/io.h>
> +
> +#include <asm/time.h>
> +#include <asm/idle.h>

Why do you need those 2 includes above ?

> +#include "timer-of.h"
> +
> +/* Timer registers */
> +#define TCCNR			0x0
> +#define TCIR			0x4
> +#define TC_DATA(t)		(0x10 + 4 * (t))
> +#define TC_CNT(t)		(0x20 + 4 * (t))
> +
> +/* TCCNR register bits */
> +#define TCCNR_TC_EN_BIT(t)		BIT((t) * 2)
> +#define TCCNR_TC_MODE_BIT(t)		BIT((t) * 2 + 1)
> +#define TCCNR_TC_SRC_BIT(t)		BIT((t) + 8)
> +
> +/* TCIR register bits */
> +#define TCIR_TC_IE_BIT(t)		BIT(t)
> +#define TCIR_TC_IP_BIT(t)		BIT((t) + 4)
> +
> +
> +/* Forward declaration */
> +static struct timer_of to;
> +
> +static void __iomem *base;
> +
> +

nit: extra line

> +#define RTL8186_TIMER_MODE_COUNTER	0
> +#define RTL8186_TIMER_MODE_TIMER	1
> +

[ ... ]

Thanks

  -- Daniel



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
