From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 6/7] clocksource: Add Pistachio clocksource-only driver
Date: Fri, 22 May 2015 09:48:17 -0700
Message-ID: <CAL1qeaEL7D6=WpyigbHWv8DEhp0XhC4acCYRkQ6Fm0Wr4HW11A@mail.gmail.com>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com>
	<1432244506-15388-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432244506-15388-1-git-send-email-ezequiel.garcia@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Damien Horsley <Damien.Horsley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 2:41 PM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
> The Pistachio SoC provides four general purpose timers, and allow
> to implement a clocksource driver.
>
> This driver can be used as a replacement for the MIPS GIC and MIPS R4K
> clocksources and sched clocks, which are clocked from the CPU clock.
>
> Given the general purpose timers are clocked from an independent clock,
> this new clocksource driver will be useful to introduce CPUFreq support
> for Pistachio machines.
>
> Signed-off-by: Govindraj Raja <Govindraj.Raja@imgtec.com>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>

> --- /dev/null
> +++ b/drivers/clocksource/time-pistachio.c

> @@ -0,0 +1,202 @@
> +/*
> + * Pistachio clocksource based on general-purpose timers
> + *
> + * Copyright (C) 2015 Imagination Technologies
> + *
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License. See the file "COPYING" in the main directory of this archive
> + * for more details.
> + */
> +
> +#define pr_fmt(fmt) "%s: " fmt, __func__
> +
> +#include <linux/clk.h>
> +#include <linux/clocksource.h>
> +#include <linux/clockchips.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/sched_clock.h>
> +#include <linux/time.h>
> +
> +/* Top level reg */
> +#define        CR_TIMER_CTRL_CFG               0x00
> +  #define TIMER_ME_GLOBAL              BIT(0)
> +#define        CR_TIMER_REV                    0x10
> +
> +/* Timer specific registers */
> +#define TIMER_CFG                      0x20
> +  #define TIMER_ME_LOCAL               BIT(0)
> +#define TIMER_RELOAD_VALUE             0x24
> +#define TIMER_CURRENT_VALUE            0x28
> +#define TIMER_CURRENT_OVERFLOW_VALUE   0x2C
> +#define TIMER_IRQ_STATUS               0x30
> +#define TIMER_IRQ_CLEAR                        0x34
> +#define TIMER_IRQ_MASK                 0x38

nit: the spacing in these two sets of #defines is inconsistent and the
space at the beginning of the line looks a little weird to me, maybe
just do something like this:

#define REGISTER ...
#define  REGISTER_FIELD ...

> +
> +#define PERIP_TIMER_CONTROL            0x90
> +
> +/* Timer specific configuration Values */
> +#define RELOAD_VALUE   0xffffffff
> +
> +static void __iomem *timer_base;
> +static DEFINE_RAW_SPINLOCK(lock);
> +
> +static inline u32 gpt_readl(u32 offset, u32 gpt_id)
> +{
> +       return __raw_readl(timer_base + 0x20 * gpt_id + offset);
> +}
> +
> +static inline void gpt_writel(u32 value, u32 offset, u32 gpt_id)
> +{
> +       __raw_writel(value, timer_base + 0x20 * gpt_id + offset);
> +}

Why raw iomem accessors?

> +static cycle_t clocksource_read_cycles(struct clocksource *cs)
> +{
> +       u32 counter, overflw;
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&lock, flags);
> +       overflw = gpt_readl(TIMER_CURRENT_OVERFLOW_VALUE, 0);
> +       counter = gpt_readl(TIMER_CURRENT_VALUE, 0);
> +       raw_spin_unlock_irqrestore(&lock, flags);
> +
> +       return ~(cycle_t)counter;
> +}
> +
> +static u64 notrace pistachio_read_sched_clock(void)
> +{
> +       return clocksource_read_cycles(NULL);
> +}
> +
> +static void pistachio_clksrc_enable(int timeridx)
> +{
> +       u32 val;
> +
> +       /* Disable GPT local before loading reload value */
> +       val = gpt_readl(TIMER_CFG, timeridx);
> +       val &= ~TIMER_ME_LOCAL;
> +       gpt_writel(val, TIMER_CFG, timeridx);
> +
> +       gpt_writel(RELOAD_VALUE, TIMER_RELOAD_VALUE, timeridx);
> +
> +       val = gpt_readl(TIMER_CFG, timeridx);
> +       val |= TIMER_ME_LOCAL;
> +       gpt_writel(val, TIMER_CFG, timeridx);
> +}
> +
> +static void pistachio_clksrc_disable(int timeridx)
> +{
> +       u32 val;
> +
> +       /* Disable GPT local */
> +       val = gpt_readl(TIMER_CFG, timeridx);
> +       val &= ~TIMER_ME_LOCAL;
> +       gpt_writel(val, TIMER_CFG, timeridx);
> +}
> +
> +static int clocksource_enable(struct clocksource *cs)
> +{
> +       pistachio_clksrc_enable(0);
> +       return 0;
> +}
> +
> +static void clocksource_disable(struct clocksource *cs)
> +{
> +       pistachio_clksrc_disable(0);
> +}
> +
> +/* Desirable clock source for pistachio platform */
> +static struct clocksource clocksource_gpt = {
> +       .name           = "gptimer",
> +       .rating         = 300,
> +       .enable         = clocksource_enable,
> +       .disable        = clocksource_disable,
> +       .read           = clocksource_read_cycles,

nit: these names are rather generic sounding, maybe add a "pistachio" prefix?

> +       .mask           = CLOCKSOURCE_MASK(32),
> +       .flags          = CLOCK_SOURCE_IS_CONTINUOUS |
> +                         CLOCK_SOURCE_SUSPEND_NONSTOP,
> +};
> +
> +static void __init pistachio_clksrc_of_init(struct device_node *node)
> +{
> +       struct clk *sys_clk, *fast_clk;
> +       struct regmap *periph_regs;
> +       unsigned long rate;
> +       int ret;
> +
> +       timer_base = of_iomap(node, 0);
> +       if (!timer_base) {
> +               pr_err("cannot iomap\n");
> +               return;
> +       }
> +
> +       /*
> +        * We need early syscon or late clocksource probe for this to work.
> +        */

I don't think this is true... if the syscon hasn't probed yet, then
syscon_regmap_lookup_by_phandle will probe it for us.

> +       periph_regs = syscon_regmap_lookup_by_phandle(node, "img,cr-periph");
> +       if (IS_ERR(periph_regs)) {
> +               pr_err("cannot get peripheral regmap (%lu)\n",
> +                      PTR_ERR(periph_regs));
> +               return;
> +       }
> +
> +       /* Switch to using the fast counter clock */
> +       ret = regmap_update_bits(periph_regs, PERIP_TIMER_CONTROL,
> +                                0xf, 0x0);
> +       if (ret)
> +               return;
> +
> +       sys_clk = of_clk_get_by_name(node, "sys");
> +       if (IS_ERR(sys_clk)) {
> +               pr_err("clock get failed (%lu)\n", PTR_ERR(sys_clk));
> +               return;
> +       }
> +
> +       fast_clk = of_clk_get_by_name(node, "fast");
> +       if (IS_ERR(fast_clk)) {
> +               pr_err("clock get failed (%lu)\n", PTR_ERR(fast_clk));
> +               return;
> +       }
> +
> +       ret = clk_prepare_enable(sys_clk);
> +       if (ret < 0) {
> +               pr_err("failed to enable clock (%d)\n", ret);
> +               return;
> +       }
> +
> +       ret = clk_prepare_enable(fast_clk);
> +       if (ret < 0) {
> +               pr_err("failed to enable clock (%d)\n", ret);
> +               clk_disable_unprepare(sys_clk);
> +               return;
> +       }
> +
> +       rate = clk_get_rate(fast_clk);
> +
> +       /* Disable irq's for clocksource usage */
> +       gpt_writel(0, TIMER_IRQ_MASK, 0);
> +       gpt_writel(0, TIMER_IRQ_MASK, 1);
> +       gpt_writel(0, TIMER_IRQ_MASK, 2);
> +       gpt_writel(0, TIMER_IRQ_MASK, 3);
> +
> +       /* Enable timer block */
> +       __raw_writel(TIMER_ME_GLOBAL, timer_base);
> +
> +       sched_clock_register(pistachio_read_sched_clock, 32, rate);
> +       clocksource_register_hz(&clocksource_gpt, rate);
> +}
> +
> +static const struct of_device_id pistachio_clksrc_of_match[] __initconst = {
> +       { .compatible = "img,pistachio-gptimer" },
> +       { },
> +};

This table doesn't appear to be used anywhere.

> +CLOCKSOURCE_OF_DECLARE(pistachio_gptimer, "img,pistachio-gptimer",
> +                      pistachio_clksrc_of_init);
> --
> 2.3.3
>
