From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 6/7] clocksource: Add Pistachio clocksource-only driver
Date: Tue, 04 Aug 2015 16:23:48 +0200
Message-ID: <55C0CAF4.8060104@linaro.org>
References: <1438005755-27051-1-git-send-email-govindraj.raja@imgtec.com>	<1438005755-27051-2-git-send-email-govindraj.raja@imgtec.com>	<55C08425.503@linaro.org> <CAAEAJfD1ZKCVJUv9w5Yq+hpY62pEHTbZ57t2XyUGBOgj6H8zqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAEAJfD1ZKCVJUv9w5Yq+hpY62pEHTbZ57t2XyUGBOgj6H8zqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: Govindraj Raja <govindraj.raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/04/2015 01:37 PM, Ezequiel Garcia wrote:
> Hi Daniel,
>
> Thanks for the review!
>
> On 4 August 2015 at 06:21, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=
 wrote:
>> On 07/27/2015 04:02 PM, Govindraj Raja wrote:
>>>
>>> From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>>
>>> The Pistachio SoC provides four general purpose timers, and allow
>>> to implement a clocksource driver.
>>>
>>> This driver can be used as a replacement for the MIPS GIC and MIPS =
R4K
>>> clocksources and sched clocks, which are clocked from the CPU clock=
=2E
>>>
>>> Given the general purpose timers are clocked from an independent cl=
ock,
>>> this new clocksource driver will be useful to introduce CPUFreq sup=
port
>>> for Pistachio machines.
>>>
>>> Signed-off-by: Govindraj Raja <Govindraj.Raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>    drivers/clocksource/Kconfig          |   4 +
>>>    drivers/clocksource/Makefile         |   1 +
>>>    drivers/clocksource/time-pistachio.c | 194
>>> +++++++++++++++++++++++++++++++++++
>>>    3 files changed, 199 insertions(+)
>>>    create mode 100644 drivers/clocksource/time-pistachio.c
>>>
>>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kcon=
fig
>>> index 4e57730..74e002e 100644
>>> --- a/drivers/clocksource/Kconfig
>>> +++ b/drivers/clocksource/Kconfig
>>> @@ -111,6 +111,10 @@ config CLKSRC_LPC32XX
>>>          select CLKSRC_MMIO
>>>          select CLKSRC_OF
>>>
>>> +config CLKSRC_PISTACHIO
>>> +       bool
>>> +       select CLKSRC_OF
>>> +
>>>    config CLKSRC_STM32
>>>          bool "Clocksource for STM32 SoCs" if !ARCH_STM32
>>>          depends on OF && ARM && (ARCH_STM32 || COMPILE_TEST)
>>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Mak=
efile
>>> index f228354..066337e 100644
>>> --- a/drivers/clocksource/Makefile
>>> +++ b/drivers/clocksource/Makefile
>>> @@ -44,6 +44,7 @@ obj-$(CONFIG_FSL_FTM_TIMER)   +=3D fsl_ftm_timer.=
o
>>>    obj-$(CONFIG_VF_PIT_TIMER)    +=3D vf_pit_timer.o
>>>    obj-$(CONFIG_CLKSRC_QCOM)     +=3D qcom-timer.o
>>>    obj-$(CONFIG_MTK_TIMER)               +=3D mtk_timer.o
>>> +obj-$(CONFIG_CLKSRC_PISTACHIO) +=3D time-pistachio.o
>>>
>>>    obj-$(CONFIG_ARM_ARCH_TIMER)          +=3D arm_arch_timer.o
>>>    obj-$(CONFIG_ARM_GLOBAL_TIMER)                +=3D arm_global_ti=
mer.o
>>> diff --git a/drivers/clocksource/time-pistachio.c
>>> b/drivers/clocksource/time-pistachio.c
>>> new file mode 100644
>>> index 0000000..d461bd1
>>> --- /dev/null
>>> +++ b/drivers/clocksource/time-pistachio.c
>>> @@ -0,0 +1,194 @@
>>> +/*
>>> + * Pistachio clocksource based on general-purpose timers
>>> + *
>>> + * Copyright (C) 2015 Imagination Technologies
>>> + *
>>> + * This file is subject to the terms and conditions of the GNU Gen=
eral
>>> Public
>>> + * License. See the file "COPYING" in the main directory of this a=
rchive
>>> + * for more details.
>>> + */
>>> +
>>> +#define pr_fmt(fmt) "%s: " fmt, __func__
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/clocksource.h>
>>> +#include <linux/clockchips.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/err.h>
>>> +#include <linux/init.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/sched_clock.h>
>>> +#include <linux/time.h>
>>> +
>>> +/* Top level reg */
>>> +#define CR_TIMER_CTRL_CFG              0x00
>>> +#define  TIMER_ME_GLOBAL               BIT(0)
>>
>>
>> extra space.
>>
>>> +#define CR_TIMER_REV                   0x10
>>> +
>>> +/* Timer specific registers */
>>> +#define TIMER_CFG                      0x20
>>> +#define  TIMER_ME_LOCAL                        BIT(0)
>>
>>
>> extra space.
>>
>
> These are not extra spaces, but they are there
> to separate register definitions from bit definitions.
> Same thing is done on time-armada-370-xp.c.
>
>>
>>> +#define TIMER_RELOAD_VALUE             0x24
>>> +#define TIMER_CURRENT_VALUE            0x28
>>> +#define TIMER_CURRENT_OVERFLOW_VALUE   0x2C
>>> +#define TIMER_IRQ_STATUS               0x30
>>> +#define TIMER_IRQ_CLEAR                        0x34
>>> +#define TIMER_IRQ_MASK                 0x38
>>> +
>>> +#define PERIP_TIMER_CONTROL            0x90
>>> +
>>> +/* Timer specific configuration Values */
>>> +#define RELOAD_VALUE   0xffffffff
>>> +
>>> +static void __iomem *timer_base;
>>> +static DEFINE_RAW_SPINLOCK(lock);
>>> +
>>> +static inline u32 gpt_readl(u32 offset, u32 gpt_id)
>>> +{
>>> +       return readl(timer_base + 0x20 * gpt_id + offset);
>>> +}
>>> +
>>> +static inline void gpt_writel(u32 value, u32 offset, u32 gpt_id)
>>> +{
>>> +       writel(value, timer_base + 0x20 * gpt_id + offset);
>>> +}
>>> +
>>> +static cycle_t pistachio_clocksource_read_cycles(struct clocksourc=
e *cs)
>>> +{
>>> +       u32 counter, overflw;
>>> +       unsigned long flags;
>>> +
>>> +       raw_spin_lock_irqsave(&lock, flags);
>>> +       overflw =3D gpt_readl(TIMER_CURRENT_OVERFLOW_VALUE, 0);
>>
>>
>> Why do you need to read 'overflw' here ? It is not used.
>>
>
> The counter value is only refreshed after the overflow value is read.
> And they must be read in strict order, hence the ugly raw spin lock.
> Without both of these, the CPU locks up completely when reading
> the counter.
>
> Maybe a comment explaining this would help.
>
>>
>>> +       counter =3D gpt_readl(TIMER_CURRENT_VALUE, 0);
>>> +       raw_spin_unlock_irqrestore(&lock, flags);
>>> +
>>> +       return ~(cycle_t)counter;
>>> +}
>>> +
>>> +static u64 notrace pistachio_read_sched_clock(void)
>>> +{
>>> +       return pistachio_clocksource_read_cycles(NULL);
>>> +}
>>> +
>>> +static void pistachio_clksrc_enable(int timeridx)
>>> +{
>>> +       u32 val;
>>> +
>>> +       /* Disable GPT local before loading reload value */
>>> +       val =3D gpt_readl(TIMER_CFG, timeridx);
>>> +       val &=3D ~TIMER_ME_LOCAL;
>>> +       gpt_writel(val, TIMER_CFG, timeridx);
>>> +
>>> +       gpt_writel(RELOAD_VALUE, TIMER_RELOAD_VALUE, timeridx);
>>> +
>>> +       val =3D gpt_readl(TIMER_CFG, timeridx);
>>> +       val |=3D TIMER_ME_LOCAL;
>>> +       gpt_writel(val, TIMER_CFG, timeridx);
>>> +}
>>> +
>>> +static void pistachio_clksrc_disable(int timeridx)
>>> +{
>>> +       u32 val;
>>> +
>>> +       /* Disable GPT local */
>>> +       val =3D gpt_readl(TIMER_CFG, timeridx);
>>> +       val &=3D ~TIMER_ME_LOCAL;
>>> +       gpt_writel(val, TIMER_CFG, timeridx);
>>> +}
>>
>>
>> Duplicate code with 'pistachio_clksrc_enable', please reuse this fun=
ction in
>> the enable one.
>>
>
> OK.
>
>>> +
>>> +static int pistachio_clocksource_enable(struct clocksource *cs)
>>> +{
>>> +       pistachio_clksrc_enable(0);
>>> +       return 0;
>>> +}
>>> +
>>> +static void pistachio_clocksource_disable(struct clocksource *cs)
>>> +{
>>> +       pistachio_clksrc_disable(0);
>>> +}
>>
>>
>> It will be better if you don't wrap these function but use container=
_of to
>> retrieve the timer_base from the clocksource structure.
>>
>
> I'm not sure I understand what you mean.
> We are not using clocksource_mmio and there's no driver-specific
> structure.

struct pistachio_clocksource {
	void __iomem *base;
	raw_spin_lock lock;
	struct clocksource cs;
};

struct pistachio_clocksource to_pistachio_clocksource(
				struct clocksource *cs)
{
	return container_of(cs, struct pistachio_clocksource, cs);
}

static void pistachio_clocksource_disable(struct clocksource *cs)
{
	struct pistachio_clocksource *pcs =3D
			to_pistachio_clocksource(cs);
	u32 val;

	/* Disable GPT local before loading reload value */
	val =3D gpt_readl(pcs->base, TIMER_CFG, timeridx);
	...
	...

	etc ...
}

>>
>>> +/* Desirable clock source for pistachio platform */
>>> +static struct clocksource pistachio_clocksource_gpt =3D {
>>> +       .name           =3D "gptimer",
>>> +       .rating         =3D 300,
>>> +       .enable         =3D pistachio_clocksource_enable,
>>> +       .disable        =3D pistachio_clocksource_disable,
>>> +       .read           =3D pistachio_clocksource_read_cycles,
>>> +       .mask           =3D CLOCKSOURCE_MASK(32),
>>> +       .flags          =3D CLOCK_SOURCE_IS_CONTINUOUS |
>>> +                         CLOCK_SOURCE_SUSPEND_NONSTOP,
>>> +};
>>> +
>>> +static void __init pistachio_clksrc_of_init(struct device_node *no=
de)
>>> +{
>>> +       struct clk *sys_clk, *fast_clk;
>>> +       struct regmap *periph_regs;
>>> +       unsigned long rate;
>>> +       int ret;
>>> +
>>> +       timer_base =3D of_iomap(node, 0);
>>> +       if (!timer_base) {
>>> +               pr_err("cannot iomap\n");
>>> +               return;
>>> +       }
>>> +
>>> +       periph_regs =3D syscon_regmap_lookup_by_phandle(node,
>>> "img,cr-periph");
>>> +       if (IS_ERR(periph_regs)) {
>>> +               pr_err("cannot get peripheral regmap (%lu)\n",
>>> +                      PTR_ERR(periph_regs));
>>> +               return;
>>> +       }
>>> +
>>> +       /* Switch to using the fast counter clock */
>>> +       ret =3D regmap_update_bits(periph_regs, PERIP_TIMER_CONTROL=
,
>>> +                                0xf, 0x0);
>>> +       if (ret)
>>> +               return;
>>> +
>>> +       sys_clk =3D of_clk_get_by_name(node, "sys");
>>> +       if (IS_ERR(sys_clk)) {
>>> +               pr_err("clock get failed (%lu)\n", PTR_ERR(sys_clk)=
);
>>> +               return;
>>> +       }
>>> +
>>> +       fast_clk =3D of_clk_get_by_name(node, "fast");
>>> +       if (IS_ERR(fast_clk)) {
>>> +               pr_err("clock get failed (%lu)\n", PTR_ERR(fast_clk=
));
>>> +               return;
>>> +       }
>>> +
>>> +       ret =3D clk_prepare_enable(sys_clk);
>>> +       if (ret < 0) {
>>> +               pr_err("failed to enable clock (%d)\n", ret);
>>> +               return;
>>> +       }
>>> +
>>> +       ret =3D clk_prepare_enable(fast_clk);
>>> +       if (ret < 0) {
>>> +               pr_err("failed to enable clock (%d)\n", ret);
>>> +               clk_disable_unprepare(sys_clk);
>>> +               return;
>>> +       }
>>> +
>>> +       rate =3D clk_get_rate(fast_clk);
>>> +
>>> +       /* Disable irq's for clocksource usage */
>>> +       gpt_writel(0, TIMER_IRQ_MASK, 0);
>>> +       gpt_writel(0, TIMER_IRQ_MASK, 1);
>>> +       gpt_writel(0, TIMER_IRQ_MASK, 2);
>>> +       gpt_writel(0, TIMER_IRQ_MASK, 3);
>>> +
>>> +       /* Enable timer block */
>>> +       writel(TIMER_ME_GLOBAL, timer_base);
>>> +
>>> +       sched_clock_register(pistachio_read_sched_clock, 32, rate);
>>> +       clocksource_register_hz(&pistachio_clocksource_gpt, rate);
>>> +}
>>> +CLOCKSOURCE_OF_DECLARE(pistachio_gptimer, "img,pistachio-gptimer",
>>> +                      pistachio_clksrc_of_init);



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
