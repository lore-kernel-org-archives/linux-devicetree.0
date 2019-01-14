From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 02/17] clocksource: davinci-timer: new driver
Date: Mon, 14 Jan 2019 17:50:17 +0530
Message-ID: <08200de1-fde5-c525-c874-c7872259067b@ti.com>
References: <20190111172134.30147-1-brgl@bgdev.pl>
 <20190111172134.30147-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111172134.30147-3-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Bartosz,

On 11/01/19 10:51 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently the clocksource and clockevent support for davinci platforms
> lives in mach-davinci. It hard-codes many things, used global variables,
> implements functionalities unused by any platform and has code fragments
> scattered across many (often unrelated) files.
> 
> Implement a new, modern and simplified timer driver and put it into
> drivers/clocksource. We still need to support legacy board files so
> export a config structure and a function that allows machine code to
> register the timer.
> 
> We don't check the return values of regmap reads and writes since with
> mmio it's only likely to fail due to programmer's errors.
> 
> We also don't bother freeing resources on errors in
> davinci_timer_register() as the system won't boot without a timer anyway.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

With this series, DA830 fails to boot. Rest of the devices are okay from
boot perspective.

DA830 is pretty unique because it uses the same timer-half for both
clocksource and clockevent. May be you can set the same configuration on
your DA850 to see the same issue? Else, I will enable low-level debug
and try to provide more debug data.

Some minor comments below from quick look:

> diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
> new file mode 100644
> index 000000000000..7282a1fda80f
> --- /dev/null
> +++ b/drivers/clocksource/timer-davinci.c
> @@ -0,0 +1,415 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * TI DaVinci clocksource driver
> + *
> + * Copyright (C) 2019 Texas Instruments
> + * Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> + * (with some parts adopted from code by Kevin Hilman <khilman@baylibre.com>)

Did you really intend GPL v2 or later? The original code referred to
above is marked 2.0 only.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/regmap.h>
> +#include <linux/sched_clock.h>
> +
> +#include <clocksource/timer-davinci.h>
> +
> +#define DAVINCI_TIMER_REG_TIM12			0x10
> +#define DAVINCI_TIMER_REG_TIM34			0x14
> +#define DAVINCI_TIMER_REG_PRD12			0x18
> +#define DAVINCI_TIMER_REG_PRD34			0x1c
> +#define DAVINCI_TIMER_REG_TCR			0x20
> +#define DAVINCI_TIMER_REG_TGCR			0x24
> +
> +#define DAVINCI_TIMER_TIMMODE_MASK		0x0000000c
> +#define DAVINCI_TIMER_RESET_MASK		0x00000003
> +#define DAVINCI_TIMER_TIMMODE_32BIT_UNCHAINED	0x00000004
> +#define DAVINCI_TIMER_UNRESET			0x00000003

I think these are more readable if using BIT() and GENMASK()

Thanks,
Sekhar
