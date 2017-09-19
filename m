From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] clocksource: stm32: rework driver to use only one timer
Date: Tue, 19 Sep 2017 09:59:03 +0200
Message-ID: <CA+M3ks45pUwv=dL6Gd6=Nvm1y5zRvtsFEU1bFoHht0xUDc3UVw@mail.gmail.com>
References: <1505375812-19037-1-git-send-email-benjamin.gaignard@linaro.org>
 <1505375812-19037-2-git-send-email-benjamin.gaignard@linaro.org> <9e5cae53-0a57-f2e9-cbb1-dde484619fca@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9e5cae53-0a57-f2e9-cbb1-dde484619fca-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-09-18 23:30 GMT+02:00 Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On 14/09/2017 09:56, Benjamin Gaignard wrote:
>> Rework driver code to use only one timer for both clocksource
>> and clockevent.
>> This patch also forbids to use 16 bits timers because they are
>> not enough accurate.
>> Do some clean up in structures and functions names too.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Hi Benjamin,
>
> I have a few comments below. Can you when reposting split this patch
> into smaller changes ?

Not so easy because I change the way of how the hardware is used to be able
to provide clocksource and clockevent on the same hardware block.

>
> Also, can you consider using the timer-of API ?

Is it just about using TIMER_OF_DECLARE ? or do you have something
else in mind ?

>
> Thanks.
>
>   -- Daniel
>
>> ---
>>  drivers/clocksource/timer-stm32.c | 259 +++++++++++++++++++++++--------=
-------
>>  1 file changed, 155 insertions(+), 104 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/tim=
er-stm32.c
>> index 8f24237..648c10a 100644
>> --- a/drivers/clocksource/timer-stm32.c
>> +++ b/drivers/clocksource/timer-stm32.c
>> @@ -16,175 +16,226 @@
>>  #include <linux/of_irq.h>
>>  #include <linux/clk.h>
>>  #include <linux/reset.h>
>> +#include <linux/sched_clock.h>
>> +#include <linux/slab.h>
>>
>>  #define TIM_CR1              0x00
>>  #define TIM_DIER     0x0c
>>  #define TIM_SR               0x10
>>  #define TIM_EGR              0x14
>> +#define TIM_CNT              0x24
>>  #define TIM_PSC              0x28
>>  #define TIM_ARR              0x2c
>> +#define TIM_CCR1     0x34
>>
>>  #define TIM_CR1_CEN  BIT(0)
>> -#define TIM_CR1_OPM  BIT(3)
>> +#define TIM_CR1_UDIS BIT(1)
>>  #define TIM_CR1_ARPE BIT(7)
>>
>> -#define TIM_DIER_UIE BIT(0)
>> -
>> -#define TIM_SR_UIF   BIT(0)
>> +#define TIM_DIER_CC1IE       BIT(1)
>>
>>  #define TIM_EGR_UG   BIT(0)
>>
>> -struct stm32_clock_event_ddata {
>> +struct stm32_clock_event {
>>       struct clock_event_device evtdev;
>>       unsigned periodic_top;
>> -     void __iomem *base;
>> +     void __iomem *regs;
>>  };
>>
>>  static int stm32_clock_event_shutdown(struct clock_event_device *evtdev=
)
>>  {
>> -     struct stm32_clock_event_ddata *data =3D
>> -             container_of(evtdev, struct stm32_clock_event_ddata, evtde=
v);
>> -     void *base =3D data->base;
>> +     struct stm32_clock_event *ce =3D
>> +             container_of(evtdev, struct stm32_clock_event, evtdev);
>> +
>> +     writel_relaxed(0, ce->regs + TIM_DIER);
>>
>> -     writel_relaxed(0, base + TIM_CR1);
>
> Why this change? TIM_CR1 -> TIM_DIER? A 16b to 32b change?

No it is because I use the interrupt from the comparator instead of the cou=
nter.
With this patch clocksource will use the 32 bits counter of the hardware bl=
ock
to provide the clock and comparator is generate interrupt for the event.
That change quite a lot the code, sorry.


>
>>       return 0;
>>  }
>>
>> -static int stm32_clock_event_set_periodic(struct clock_event_device *ev=
tdev)
>> +static int stm32_clock_event_set_next_event(unsigned long evt,
>> +                                         struct clock_event_device *evt=
dev)
>>  {
>> -     struct stm32_clock_event_ddata *data =3D
>> -             container_of(evtdev, struct stm32_clock_event_ddata, evtde=
v);
>> -     void *base =3D data->base;
>> +     struct stm32_clock_event *ce =3D
>> +             container_of(evtdev, struct stm32_clock_event, evtdev);
>> +     unsigned long cnt;
>> +
>> +     cnt =3D readl_relaxed(ce->regs + TIM_CNT);
>> +     writel_relaxed(cnt + evt, ce->regs + TIM_CCR1);
>> +     writel_relaxed(TIM_DIER_CC1IE, ce->regs + TIM_DIER);
>>
>> -     writel_relaxed(data->periodic_top, base + TIM_ARR);
>> -     writel_relaxed(TIM_CR1_ARPE | TIM_CR1_CEN, base + TIM_CR1);
>>       return 0;
>>  }
>>
>> -static int stm32_clock_event_set_next_event(unsigned long evt,
>> -                                         struct clock_event_device *evt=
dev)
>> +static int stm32_clock_event_set_periodic(struct clock_event_device *ev=
tdev)
>>  {
>> -     struct stm32_clock_event_ddata *data =3D
>> -             container_of(evtdev, struct stm32_clock_event_ddata, evtde=
v);
>> +     struct stm32_clock_event *ce =3D
>> +             container_of(evtdev, struct stm32_clock_event, evtdev);
>>
>> -     writel_relaxed(evt, data->base + TIM_ARR);
>> -     writel_relaxed(TIM_CR1_ARPE | TIM_CR1_OPM | TIM_CR1_CEN,
>> -                    data->base + TIM_CR1);
>> +     return stm32_clock_event_set_next_event(ce->periodic_top, evtdev);
>> +}
>>
>> -     return 0;
>> +static int stm32_clock_event_set_oneshot(struct clock_event_device *evt=
dev)
>> +{
>> +     return stm32_clock_event_set_next_event(0, evtdev);
>>  }
>>
>>  static irqreturn_t stm32_clock_event_handler(int irq, void *dev_id)
>>  {
>> -     struct stm32_clock_event_ddata *data =3D dev_id;
>> +     struct stm32_clock_event *ce =3D dev_id;
>> +
>> +     writel_relaxed(0, ce->regs + TIM_SR);
>>
>> -     writel_relaxed(0, data->base + TIM_SR);
>> +     if (clockevent_state_periodic(&ce->evtdev))
>> +             stm32_clock_event_set_periodic(&ce->evtdev);
>
> nit: else condition to prevent an extra check

OK

>
>> -     data->evtdev.event_handler(&data->evtdev);
>> +     if (clockevent_state_oneshot(&ce->evtdev))
>> +             stm32_clock_event_shutdown(&ce->evtdev);
>> +
>> +     ce->evtdev.event_handler(&ce->evtdev);
>>
>>       return IRQ_HANDLED;
>>  }
>>
>> -static struct stm32_clock_event_ddata clock_event_ddata =3D {
>> -     .evtdev =3D {
>> -             .name =3D "stm32 clockevent",
>> -             .features =3D CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PERI=
ODIC,
>> -             .set_state_shutdown =3D stm32_clock_event_shutdown,
>> -             .set_state_periodic =3D stm32_clock_event_set_periodic,
>> -             .set_state_oneshot =3D stm32_clock_event_shutdown,
>> -             .tick_resume =3D stm32_clock_event_shutdown,
>> -             .set_next_event =3D stm32_clock_event_set_next_event,
>> -             .rating =3D 200,
>> -     },
>> -};
>> +static int __init stm32_clockevent_init(struct device_node *np,
>> +                                     void __iomem *base,
>> +                                     struct clk *clk, int irq)
>> +{
>> +     struct stm32_clock_event *ce;
>> +     unsigned long rate;
>> +     int err;
>> +
>> +     ce =3D kzalloc(sizeof(*ce), GFP_KERNEL);
>> +     if (!ce)
>> +             return -ENOMEM;
>> +
>> +     ce->regs =3D base;
>> +     ce->evtdev.name =3D "stm32_clockevent";
>> +     ce->evtdev.features =3D CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_PE=
RIODIC;
>> +     ce->evtdev.set_state_shutdown =3D stm32_clock_event_shutdown;
>> +     ce->evtdev.set_state_periodic =3D stm32_clock_event_set_periodic;
>> +     ce->evtdev.set_state_oneshot =3D stm32_clock_event_set_oneshot;
>> +     ce->evtdev.tick_resume =3D stm32_clock_event_shutdown;
>> +     ce->evtdev.set_next_event =3D stm32_clock_event_set_next_event;
>> +     ce->evtdev.rating =3D 200;
>>
>> -static int __init stm32_clockevent_init(struct device_node *np)
>> +     rate =3D clk_get_rate(clk);
>> +     ce->periodic_top =3D DIV_ROUND_CLOSEST(rate, HZ);
>> +
>> +     writel_relaxed(0, ce->regs + TIM_DIER);
>> +     writel_relaxed(0, ce->regs + TIM_SR);
>> +
>> +     err =3D request_irq(irq, stm32_clock_event_handler, IRQF_TIMER,
>> +                       "stm32 clockevent", ce);
>> +     if (err) {
>> +             kfree(ce);
>> +             return err;
>> +     }
>> +
>> +     clockevents_config_and_register(&ce->evtdev, rate, 0x60, ~0U);
>> +
>> +     return 0;
>> +}
>> +
>> +static void __iomem *stm32_timer_cnt __read_mostly;
>> +static u64 notrace stm32_read_sched_clock(void)
>> +{
>> +     return readl_relaxed(stm32_timer_cnt);
>> +}
>> +
>> +static int __init stm32_clocksource_init(struct device_node *node,
>> +                                      void __iomem *regs,
>> +                                      struct clk *clk)
>> +{
>> +     unsigned long rate;
>> +
>> +     rate =3D clk_get_rate(clk);
>> +
>> +     writel_relaxed(~0U, regs + TIM_ARR);
>> +     writel_relaxed(0, regs + TIM_PSC);
>> +     writel_relaxed(0, regs + TIM_SR);
>> +     writel_relaxed(0, regs + TIM_DIER);
>> +     writel_relaxed(0, regs + TIM_SR);
>> +     writel_relaxed(TIM_CR1_ARPE | TIM_CR1_UDIS, regs + TIM_CR1);
>> +
>> +     /* Make sure that registers are updated */
>> +     writel_relaxed(TIM_EGR_UG, regs + TIM_EGR);
>> +
>> +     /* Enable controller */
>> +     writel_relaxed(TIM_CR1_ARPE | TIM_CR1_UDIS | TIM_CR1_CEN,
>> +                    regs + TIM_CR1);
>> +
>> +     stm32_timer_cnt =3D regs + TIM_CNT;
>> +     sched_clock_register(stm32_read_sched_clock, 32, rate);
>> +
>> +     return clocksource_mmio_init(stm32_timer_cnt, "stm32_timer",
>> +                                  rate, 250, 32, clocksource_mmio_readl=
_up);
>> +}
>> +
>> +static int __init stm32_timer_init(struct device_node *node)
>>  {
>> -     struct stm32_clock_event_ddata *data =3D &clock_event_ddata;
>> -     struct clk *clk;
>>       struct reset_control *rstc;
>> -     unsigned long rate, max_delta;
>> -     int irq, ret, bits, prescaler =3D 1;
>> +     void __iomem *timer_base;
>> +     unsigned long max_arr;
>> +     struct clk *clk;
>> +     int irq, err;
>>
>> -     clk =3D of_clk_get(np, 0);
>> -     if (IS_ERR(clk)) {
>> -             ret =3D PTR_ERR(clk);
>> -             pr_err("failed to get clock for clockevent (%d)\n", ret);
>> -             goto err_clk_get;
>> +     timer_base =3D of_io_request_and_map(node, 0, of_node_full_name(no=
de));
>> +     if (IS_ERR(timer_base)) {
>> +             pr_err("Can't map registers\n");
>> +             goto out;
>>       }
>>
>> -     ret =3D clk_prepare_enable(clk);
>> -     if (ret) {
>> -             pr_err("failed to enable timer clock for clockevent (%d)\n=
",
>> -                    ret);
>> -             goto err_clk_enable;
>> +     irq =3D irq_of_parse_and_map(node, 0);
>> +     if (irq <=3D 0) {
>> +             pr_err("Can't parse IRQ\n");
>> +             goto out_unmap;
>>       }
>>
>> -     rate =3D clk_get_rate(clk);
>
> Why not pass the rate to clkevt_init and clksrc_init instead of clk? So
> clk_get_rate() is not called twice.

I will change that in v3

>
>> +     clk =3D of_clk_get(node, 0);
>> +     if (IS_ERR(clk)) {
>> +             pr_err("Can't get timer clock\n");
>> +             goto out_unmap;
>> +     }
>>
>> -     rstc =3D of_reset_control_get(np, NULL);
>> +     rstc =3D of_reset_control_get(node, NULL);
>>       if (!IS_ERR(rstc)) {
>>               reset_control_assert(rstc);
>>               reset_control_deassert(rstc);
>>       }
>>
>> -     data->base =3D of_iomap(np, 0);
>> -     if (!data->base) {
>> -             ret =3D -ENXIO;
>> -             pr_err("failed to map registers for clockevent\n");
>> -             goto err_iomap;
>> -     }
>> -
>> -     irq =3D irq_of_parse_and_map(np, 0);
>> -     if (!irq) {
>> -             ret =3D -EINVAL;
>> -             pr_err("%pOF: failed to get irq.\n", np);
>> -             goto err_get_irq;
>> +     err =3D clk_prepare_enable(clk);
>> +     if (err) {
>> +             pr_err("Couldn't enable parent clock\n");
>> +             goto out_clk;
>>       }
>>
>>       /* Detect whether the timer is 16 or 32 bits */
>> -     writel_relaxed(~0U, data->base + TIM_ARR);
>> -     max_delta =3D readl_relaxed(data->base + TIM_ARR);
>> -     if (max_delta =3D=3D ~0U) {
>> -             prescaler =3D 1;
>> -             bits =3D 32;
>> -     } else {
>> -             prescaler =3D 1024;
>> -             bits =3D 16;
>> +     writel_relaxed(~0U, timer_base + TIM_ARR);
>> +     max_arr =3D readl_relaxed(timer_base + TIM_ARR);
>> +     if (max_arr !=3D ~0U) {
>> +             err =3D -EINVAL;
>> +             pr_err("32 bits timer is needed\n");
>> +             goto out_unprepare;
>>       }
>> -     writel_relaxed(0, data->base + TIM_ARR);
>> -
>> -     writel_relaxed(prescaler - 1, data->base + TIM_PSC);
>> -     writel_relaxed(TIM_EGR_UG, data->base + TIM_EGR);
>> -     writel_relaxed(TIM_DIER_UIE, data->base + TIM_DIER);
>> -     writel_relaxed(0, data->base + TIM_SR);
>> -
>> -     data->periodic_top =3D DIV_ROUND_CLOSEST(rate, prescaler * HZ);
>>
>> -     clockevents_config_and_register(&data->evtdev,
>> -                                     DIV_ROUND_CLOSEST(rate, prescaler)=
,
>> -                                     0x1, max_delta);
>> +     err =3D stm32_clocksource_init(node, timer_base, clk);
>> +     if (err)
>> +             goto out_unprepare;
>>
>> -     ret =3D request_irq(irq, stm32_clock_event_handler, IRQF_TIMER,
>> -                     "stm32 clockevent", data);
>> -     if (ret) {
>> -             pr_err("%pOF: failed to request irq.\n", np);
>> -             goto err_get_irq;
>> -     }
>> -
>> -     pr_info("%pOF: STM32 clockevent driver initialized (%d bits)\n",
>> -                     np, bits);
>> +     err =3D stm32_clockevent_init(node, timer_base, clk, irq);
>> +     if (err)
>> +             goto out_unprepare;
>>
>> -     return ret;
>> +     return 0;
>>
>> -err_get_irq:
>> -     iounmap(data->base);
>> -err_iomap:
>> +out_unprepare:
>>       clk_disable_unprepare(clk);
>> -err_clk_enable:
>> +out_clk:
>>       clk_put(clk);
>> -err_clk_get:
>> -     return ret;
>> +out_unmap:
>> +     iounmap(timer_base);
>> +out:
>> +     return err;
>>  }
>>
>> -TIMER_OF_DECLARE(stm32, "st,stm32-timer", stm32_clockevent_init);
>> +CLOCKSOURCE_OF_DECLARE(stm32, "st,stm32-timer", stm32_timer_init);
>
> CLOCKSOURCE_OF_DECLARE is deprecated, keep using TIMER_OF_DECLARE.

OK
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
