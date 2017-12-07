From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v8 4/6] clocksource: stm32: only use 32 bits timers
Date: Thu, 7 Dec 2017 21:36:09 +0100
Message-ID: <CA+M3ks4KLy0VkJOSGR7tmefOT1rw9nrMsRQvwwK-YZQ7Gm7hQA@mail.gmail.com>
References: <1510649563-22975-1-git-send-email-benjamin.gaignard@linaro.org>
 <1510649563-22975-5-git-send-email-benjamin.gaignard@linaro.org>
 <44bb54e6-c9e8-4b54-d490-a1800bf6d74c@linaro.org> <CA+M3ks5Q_ZUHODV=eA4caT9NdrxKw1qiaWwc87w9FiC_uqwfBQ@mail.gmail.com>
 <2afa343b-3a23-3352-33b3-2133678a4122@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2afa343b-3a23-3352-33b3-2133678a4122@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Thomas Gleixner <tglx@linutronix.de>, Ludovic Barre <ludovic.barre@st.com>, Julien Thierry <julien.thierry@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2017-12-07 17:49 GMT+01:00 Daniel Lezcano <daniel.lezcano@linaro.org>:
> On 07/12/2017 17:33, Benjamin Gaignard wrote:
>> 2017-12-07 16:27 GMT+01:00 Daniel Lezcano <daniel.lezcano@linaro.org>:
>>> On 14/11/2017 09:52, Benjamin Gaignard wrote:
>>>> The clock driving counters is at 90MHz so the maximum period
>>>> for 16 bis counters is around 750 ms which is a short period
>>>> for a clocksource.
>>>
>>> Isn't it 728us ?
>>
>> yes it is: 2^16 / 90.000.000 =3D> 728us
>
> Ok, now I can do the connection with the previous patch.
>
> So, the real issue of all this is the 16bits clocksource is wrapping up
> every 728us, hence the clockevent periodically expires every ~728us to
> keep the timekeeping consistent. Unfortunately, the kernel has a too
> high overhead for this as the system is consistently processing this
> timer leading to a CPU time resource starvation.
>
> Is that correct ?

Yes that is correct

>
>
>>>> For 32 bits counters this period is close
>>>> 47 secondes which is more acceptable.
>>>>
>>>> This patch remove 16 bits counters support and makes sure that
>>>> they won't be probed anymore.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>>> ---
>>>>  drivers/clocksource/timer-stm32.c | 26 ++++++++++++--------------
>>>>  1 file changed, 12 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/clocksource/timer-stm32.c b/drivers/clocksource/t=
imer-stm32.c
>>>> index ae41a19..8173bcf 100644
>>>> --- a/drivers/clocksource/timer-stm32.c
>>>> +++ b/drivers/clocksource/timer-stm32.c
>>>> @@ -83,9 +83,9 @@ static irqreturn_t stm32_clock_event_handler(int irq=
, void *dev_id)
>>>>  static int __init stm32_clockevent_init(struct device_node *node)
>>>>  {
>>>>       struct reset_control *rstc;
>>>> -     unsigned long max_delta;
>>>> -     int ret, bits, prescaler =3D 1;
>>>> +     unsigned long max_arr;
>>>>       struct timer_of *to;
>>>> +     int ret;
>>>>
>>>>       to =3D kzalloc(sizeof(*to), GFP_KERNEL);
>>>>       if (!to)
>>>> @@ -115,29 +115,27 @@ static int __init stm32_clockevent_init(struct d=
evice_node *node)
>>>>
>>>>       /* Detect whether the timer is 16 or 32 bits */
>>>>       writel_relaxed(~0U, timer_of_base(to) + TIM_ARR);
>>>> -     max_delta =3D readl_relaxed(timer_of_base(to) + TIM_ARR);
>>>> -     if (max_delta =3D=3D ~0U) {
>>>> -             prescaler =3D 1;
>>>> -             bits =3D 32;
>>>> -     } else {
>>>> -             prescaler =3D 1024;
>>>> -             bits =3D 16;
>>>> +     max_arr =3D readl_relaxed(timer_of_base(to) + TIM_ARR);
>>>> +     if (max_arr !=3D ~0U) {
>>>> +             pr_err("32 bits timer is needed\n");
>>>> +             ret =3D -EINVAL;
>>>> +             goto deinit;
>>>>       }
>>>> +
>>>>       writel_relaxed(0, timer_of_base(to) + TIM_ARR);
>>>>
>>>> -     writel_relaxed(prescaler - 1, timer_of_base(to) + TIM_PSC);
>>>> +     writel_relaxed(0, timer_of_base(to) + TIM_PSC);
>>>>       writel_relaxed(TIM_EGR_UG, timer_of_base(to) + TIM_EGR);
>>>>       writel_relaxed(TIM_DIER_UIE, timer_of_base(to) + TIM_DIER);
>>>>       writel_relaxed(0, timer_of_base(to) + TIM_SR);
>>>>
>>>>       clockevents_config_and_register(&to->clkevt,
>>>> -                                     timer_of_period(to), MIN_DELTA, =
max_delta);
>>>> -
>>>> -     pr_info("%pOF: STM32 clockevent driver initialized (%d bits)\n",
>>>> -                     node, bits);
>>>> +                                     timer_of_period(to), MIN_DELTA, =
~0U);
>>>>
>>>>       return 0;
>>>>
>>>> +deinit:
>>>> +     timer_of_exit(to);
>>>>  err:
>>>>       kfree(to);
>>>>       return ret;
>>>>
>>>
>>>
>>> --
>>>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs
>>>
>>> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
>>> <http://twitter.com/#!/linaroorg> Twitter |
>>> <http://www.linaro.org/linaro-blog/> Blog
>>>
>>
>>
>>
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



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog
