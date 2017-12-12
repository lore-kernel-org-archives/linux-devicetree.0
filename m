From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v3 2/2] clocksource: sprd: Add timer driver for Spreadtrum
 SC9860 platform
Date: Tue, 12 Dec 2017 17:26:49 +0800
Message-ID: <CAMz4kuLQyD5=X7PEOX98_drt66yc=Fq+KxMFHDW6tp_yZsxtsQ@mail.gmail.com>
References: <1b80566bd849d68b0fc8de54ecbbc7b4efbb1077.1512708743.git.baolin.wang@spreadtrum.com>
 <c85f55a434efada592c50f46c0d0532fdb5340b0.1512708743.git.baolin.wang@spreadtrum.com>
 <05f19500-f8a3-7afc-a8d9-bcf0aff3e6bc@linaro.org> <CAMz4ku+10jTXe4bykByO_iLM33ACTu9jSnrX=i66MD3F79w9dQ@mail.gmail.com>
 <3c1da7bb-a380-072f-957d-221a6f177217@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3c1da7bb-a380-072f-957d-221a6f177217@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On 12 December 2017 at 17:16, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> Hi Baolin,
>
>
> On 08/12/2017 09:20, Baolin Wang wrote:
>
> [ ... ]
>
>>>> +static irqreturn_t sprd_timer_interrupt(int irq, void *dev_id)
>>>> +{
>>>> +     struct clock_event_device *ce = (struct clock_event_device *)dev_id;
>>>> +     struct timer_of *to = to_timer_of(ce);
>>>> +
>>>> +     sprd_timer_clear_interrupt(timer_of_base(to));
>>>> +
>>>> +     if (clockevent_state_oneshot(ce))
>>>> +             sprd_timer_disable(timer_of_base(to));
>>>> +
>>>> +     ce->event_handler(ce);
>>>> +     return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static struct timer_of to = {
>>>> +     .flags = TIMER_OF_IRQ | TIMER_OF_BASE,
>>>
>>> Why not the TIMER_OF_CLOCK ?
>>
>> The timer's clock is fixed to 32.768K and no need to divide the
>> frequency, so our clock tree does not supply the timer's clock now.
>
> The driver is fine. However, I would like to unify the clk usage in the
> timer driver, so if you refer to a clock so the TIMER_OF_CLOCK can be
> used, that will nice.

I understand your concern, but I've asked our clock driver owner in
Spreadtrum, we have no related registers to describe the topology of
the RTC fixed 32.768K, so the clock driver can not add timer's clock
node.

-- 
Baolin.wang
Best Regards
