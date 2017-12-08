From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v3 2/2] clocksource: sprd: Add timer driver for Spreadtrum
 SC9860 platform
Date: Fri, 8 Dec 2017 16:20:51 +0800
Message-ID: <CAMz4ku+10jTXe4bykByO_iLM33ACTu9jSnrX=i66MD3F79w9dQ@mail.gmail.com>
References: <1b80566bd849d68b0fc8de54ecbbc7b4efbb1077.1512708743.git.baolin.wang@spreadtrum.com>
 <c85f55a434efada592c50f46c0d0532fdb5340b0.1512708743.git.baolin.wang@spreadtrum.com>
 <05f19500-f8a3-7afc-a8d9-bcf0aff3e6bc@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <05f19500-f8a3-7afc-a8d9-bcf0aff3e6bc@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On 8 December 2017 at 14:58, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> On 08/12/2017 06:03, Baolin Wang wrote:
>> The Spreadtrum SC9860 platform will use the architected timers as local
>> clock events, but we also need a broadcast timer device to wakeup the
>> cpus when the cpus are in sleep mode.
>>
>> The Spreadtrum timer can support 32bit or 64bit counter, as well as
>> supporting period mode or one-shot mode.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
>> ---
>> Changes since v2:
>>  - Add more timer description in changelog.
>>  - Rename the driver file.
>>  - Remove GENERIC_CLOCKEVENTS and ARCH_SPRD dependency.
>>  - Remove some redundant headfiles.
>>  - Use timer-of APIs.
>>  - Change the license format according to Linus[1][2][3],
>>  Thomas[4] and Greg[5] comments on the topic.
>>  [1] https://lkml.org/lkml/2017/11/2/715
>>  [2] https://lkml.org/lkml/2017/11/25/125
>>  [3] https://lkml.org/lkml/2017/11/25/133
>>  [4] https://lkml.org/lkml/2017/11/2/805
>>  [5] https://lkml.org/lkml/2017/10/19/165
>>
>> Changes since v1:
>>  - Change to 32bit counter to avoid build warning.
>> ---
>>  drivers/clocksource/Kconfig      |    7 ++
>>  drivers/clocksource/Makefile     |    1 +
>>  drivers/clocksource/timer-sprd.c |  168 ++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 176 insertions(+)
>>  create mode 100644 drivers/clocksource/timer-sprd.c
>>
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>> index c729a88..9a6b087 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -441,6 +441,13 @@ config MTK_TIMER
>>       help
>>         Support for Mediatek timer driver.
>>
>> +config SPRD_TIMER
>> +     bool "Spreadtrum timer driver" if COMPILE_TEST
>> +     depends on HAS_IOMEM
>> +     select TIMER_OF
>> +     help
>> +       Enables the support for the Spreadtrum timer driver.
>> +
>>  config SYS_SUPPORTS_SH_MTU2
>>          bool
>>
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>> index 72711f1..d6dec44 100644
>> --- a/drivers/clocksource/Makefile
>> +++ b/drivers/clocksource/Makefile
>> @@ -54,6 +54,7 @@ obj-$(CONFIG_CLKSRC_TI_32K) += timer-ti-32k.o
>>  obj-$(CONFIG_CLKSRC_NPS)     += timer-nps.o
>>  obj-$(CONFIG_OXNAS_RPS_TIMER)        += timer-oxnas-rps.o
>>  obj-$(CONFIG_OWL_TIMER)              += owl-timer.o
>> +obj-$(CONFIG_SPRD_TIMER)     += timer-sprd.o
>>
>>  obj-$(CONFIG_ARC_TIMERS)             += arc_timer.o
>>  obj-$(CONFIG_ARM_ARCH_TIMER)         += arm_arch_timer.o
>> diff --git a/drivers/clocksource/timer-sprd.c b/drivers/clocksource/timer-sprd.c
>> new file mode 100644
>> index 0000000..81a5f0c
>> --- /dev/null
>> +++ b/drivers/clocksource/timer-sprd.c
>> @@ -0,0 +1,168 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2017 Spreadtrum Communications Inc.
>> + */
>> +
>> +#include <linux/init.h>
>> +#include <linux/interrupt.h>
>> +
>> +#include "timer-of.h"
>> +
>> +#define TIMER_NAME           "sprd_timer"
>> +
>> +#define TIMER_LOAD_LO                0x0
>> +#define TIMER_LOAD_HI                0x4
>> +#define TIMER_VALUE_LO               0x8
>> +#define TIMER_VALUE_HI               0xc
>> +
>> +#define TIMER_CTL            0x10
>> +#define TIMER_CTL_PERIOD_MODE        BIT(0)
>> +#define TIMER_CTL_ENABLE     BIT(1)
>> +#define TIMER_CTL_64BIT_WIDTH        BIT(16)
>> +
>> +#define TIMER_INT            0x14
>> +#define TIMER_INT_EN         BIT(0)
>> +#define TIMER_INT_RAW_STS    BIT(1)
>> +#define TIMER_INT_MASK_STS   BIT(2)
>> +#define TIMER_INT_CLR                BIT(3)
>> +
>> +#define TIMER_VALUE_SHDW_LO  0x18
>> +#define TIMER_VALUE_SHDW_HI  0x1c
>> +
>> +#define TIMER_VALUE_LO_MASK  GENMASK(31, 0)
>> +
>> +static void sprd_timer_enable(void __iomem *base, u32 flag)
>> +{
>> +     u32 val = readl_relaxed(base + TIMER_CTL);
>> +
>> +     val |= TIMER_CTL_ENABLE;
>> +     if (flag & TIMER_CTL_64BIT_WIDTH)
>> +             val |= TIMER_CTL_64BIT_WIDTH;
>> +     else
>> +             val &= ~TIMER_CTL_64BIT_WIDTH;
>> +
>> +     if (flag & TIMER_CTL_PERIOD_MODE)
>> +             val |= TIMER_CTL_PERIOD_MODE;
>> +     else
>> +             val &= ~TIMER_CTL_PERIOD_MODE;
>> +
>> +     writel_relaxed(val, base + TIMER_CTL);
>> +}
>> +
>> +static void sprd_timer_disable(void __iomem *base)
>> +{
>> +     u32 val = readl_relaxed(base + TIMER_CTL);
>> +
>> +     val &= ~TIMER_CTL_ENABLE;
>> +     writel_relaxed(val, base + TIMER_CTL);
>> +}
>> +
>> +static void sprd_timer_update_counter(void __iomem *base, unsigned long cycles)
>> +{
>> +     writel_relaxed(cycles & TIMER_VALUE_LO_MASK, base + TIMER_LOAD_LO);
>> +     writel_relaxed(0, base + TIMER_LOAD_HI);
>> +}
>> +
>> +static void sprd_timer_enable_interrupt(void __iomem *base)
>> +{
>> +     writel_relaxed(TIMER_INT_EN, base + TIMER_INT);
>> +}
>> +
>> +static void sprd_timer_clear_interrupt(void __iomem *base)
>> +{
>> +     u32 val = readl_relaxed(base + TIMER_INT);
>> +
>> +     val |= TIMER_INT_CLR;
>> +     writel_relaxed(val, base + TIMER_INT);
>> +}
>> +
>> +static int sprd_timer_set_next_event(unsigned long cycles,
>> +                                  struct clock_event_device *ce)
>> +{
>> +     struct timer_of *to = to_timer_of(ce);
>> +
>> +     sprd_timer_disable(timer_of_base(to));
>> +     sprd_timer_update_counter(timer_of_base(to), cycles);
>> +     sprd_timer_enable(timer_of_base(to), 0);
>> +
>> +     return 0;
>> +}
>> +
>> +static int sprd_timer_set_periodic(struct clock_event_device *ce)
>> +{
>> +     struct timer_of *to = to_timer_of(ce);
>> +
>> +     sprd_timer_disable(timer_of_base(to));
>> +     sprd_timer_update_counter(timer_of_base(to), timer_of_period(to));
>> +     sprd_timer_enable(timer_of_base(to), TIMER_CTL_PERIOD_MODE);
>> +
>> +     return 0;
>> +}
>> +
>> +static int sprd_timer_shutdown(struct clock_event_device *ce)
>> +{
>> +     struct timer_of *to = to_timer_of(ce);
>> +
>> +     sprd_timer_disable(timer_of_base(to));
>> +     return 0;
>> +}
>> +
>> +static irqreturn_t sprd_timer_interrupt(int irq, void *dev_id)
>> +{
>> +     struct clock_event_device *ce = (struct clock_event_device *)dev_id;
>> +     struct timer_of *to = to_timer_of(ce);
>> +
>> +     sprd_timer_clear_interrupt(timer_of_base(to));
>> +
>> +     if (clockevent_state_oneshot(ce))
>> +             sprd_timer_disable(timer_of_base(to));
>> +
>> +     ce->event_handler(ce);
>> +     return IRQ_HANDLED;
>> +}
>> +
>> +static struct timer_of to = {
>> +     .flags = TIMER_OF_IRQ | TIMER_OF_BASE,
>
> Why not the TIMER_OF_CLOCK ?

The timer's clock is fixed to 32.768K and no need to divide the
frequency, so our clock tree does not supply the timer's clock now.

>> +
>> +     .clkevt = {
>> +             .name = TIMER_NAME,
>> +             .rating = 300,
>> +             .features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_PERIODIC |
>> +                     CLOCK_EVT_FEAT_ONESHOT,
>> +             .set_state_shutdown = sprd_timer_shutdown,
>> +             .set_state_periodic = sprd_timer_set_periodic,
>> +             .set_next_event = sprd_timer_set_next_event,
>> +             .cpumask = cpu_possible_mask,
>> +     },
>> +
>> +     .of_irq = {
>> +             .handler = sprd_timer_interrupt,
>> +             .flags = IRQF_TIMER | IRQF_IRQPOLL,
>> +     },
>> +};
>> +
>> +static int __init sprd_timer_init(struct device_node *np)
>> +{
>> +     int ret;
>> +     u32 freq;
>> +
>> +     ret = timer_of_init(np, &to);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = of_property_read_u32(np, "clock-frequency", &freq);
>> +     if (ret) {
>> +             pr_err("failed to get clock frequency\n");
>> +             timer_of_cleanup(&to);
>> +             return ret;
>> +     }
>> +
>> +     to.of_clk.period = DIV_ROUND_UP(freq, HZ);
>> +
>> +     sprd_timer_enable_interrupt(timer_of_base(&to));
>> +     clockevents_config_and_register(&to.clkevt, freq, 1, UINT_MAX);
>> +
>> +     return 0;
>> +}
>> +
>> +TIMER_OF_DECLARE(sc9860_timer, "sprd,sc9860-timer", sprd_timer_init);
>>

-- 
Baolin.wang
Best Regards
