From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 01/11] clocksource: davinci-timer: new driver
Date: Tue, 12 Mar 2019 13:18:26 -0500
Message-ID: <1808a9f5-7e0c-3d1b-20a7-25792f9df8b5@lechnology.com>
References: <20190226120633.18200-1-brgl@bgdev.pl>
 <20190226120633.18200-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226120633.18200-2-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/26/19 6:06 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently the clocksource and clockevent support for davinci platforms
> lives in mach-davinci. It hard-codes many things, uses global variables,
> implements functionalities unused by any platform and has code fragments
> scattered across many (often unrelated) files.
> 
> Implement a new, modern and simplified timer driver and put it into
> drivers/clocksource. We still need to support legacy board files so
> export a config structure and a function that allows machine code to
> register the timer.
> 
> We don't bother freeing resources on errors in davinci_timer_register()
> as the system won't boot without a timer anyway.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>

with a few minor formatting issues


...

> diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
> new file mode 100644
> index 000000000000..ba2b21c94c2f
> --- /dev/null
> +++ b/drivers/clocksource/timer-davinci.c

...

> +/**
> + * struct davinci_timer_regs - timer-specific register offsets
> + *
> + * tim_off - timer counter register
> + * prd_off - timer period register
> + * enamode_shift - left bit-shift of the enable register associated
> + *                 with this timer in the TCR register

fields should be:

	@field: description

...

> diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/timer-davinci.c
> new file mode 100644
> index 000000000000..ba2b21c94c2f
> --- /dev/null
> +++ b/drivers/clocksource/timer-davinci.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// TI DaVinci clocksource driver
> +//
> +// Copyright (C) 2019 Texas Instruments
> +// Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> +// (with some parts adopted from code by Kevin Hilman <khilman@baylibre.com>)
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/sched_clock.h>
> +
> +#include <clocksource/timer-davinci.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "%s: " fmt "\n", __func__

...


> +	rv = clk_prepare_enable(clk);
> +	if (rv) {
> +		pr_err("Unable to prepare and enable the timer clock\n");

Won't this cause double newline in error message since pr_fmt also
includes "\n"?

Same with additional pr_err messages elsewhere in this patch.
