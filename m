From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] clocksource: sprd: Add timer driver for Spreadtrum
 SC9860 platform
Date: Tue, 12 Dec 2017 10:43:40 +0100
Message-ID: <f1deccee-66d6-632f-9153-fb4b3c6bf60f@linaro.org>
References: <1b80566bd849d68b0fc8de54ecbbc7b4efbb1077.1512708743.git.baolin.wang@spreadtrum.com>
 <c85f55a434efada592c50f46c0d0532fdb5340b0.1512708743.git.baolin.wang@spreadtrum.com>
 <05f19500-f8a3-7afc-a8d9-bcf0aff3e6bc@linaro.org>
 <CAMz4ku+10jTXe4bykByO_iLM33ACTu9jSnrX=i66MD3F79w9dQ@mail.gmail.com>
 <3c1da7bb-a380-072f-957d-221a6f177217@linaro.org>
 <CAMz4kuLQyD5=X7PEOX98_drt66yc=Fq+KxMFHDW6tp_yZsxtsQ@mail.gmail.com>
 <CAMz4ku+4F6dLSrt=D9mt7=aaQu1G=deiK50YhBDnTN2jKtFGrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMz4ku+4F6dLSrt=D9mt7=aaQu1G=deiK50YhBDnTN2jKtFGrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/12/2017 10:41, Baolin Wang wrote:
> Hi Daniel,
> 
> On 12 December 2017 at 17:26, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> Hi Daniel,
>>
>> On 12 December 2017 at 17:16, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>
>>> Hi Baolin,
>>>
>>>
>>> On 08/12/2017 09:20, Baolin Wang wrote:
>>>
>>> [ ... ]
>>>
>>>>>> +static irqreturn_t sprd_timer_interrupt(int irq, void *dev_id)
>>>>>> +{
>>>>>> +     struct clock_event_device *ce = (struct clock_event_device *)dev_id;
>>>>>> +     struct timer_of *to = to_timer_of(ce);
>>>>>> +
>>>>>> +     sprd_timer_clear_interrupt(timer_of_base(to));
>>>>>> +
>>>>>> +     if (clockevent_state_oneshot(ce))
>>>>>> +             sprd_timer_disable(timer_of_base(to));
>>>>>> +
>>>>>> +     ce->event_handler(ce);
>>>>>> +     return IRQ_HANDLED;
>>>>>> +}
>>>>>> +
>>>>>> +static struct timer_of to = {
>>>>>> +     .flags = TIMER_OF_IRQ | TIMER_OF_BASE,
>>>>>
>>>>> Why not the TIMER_OF_CLOCK ?
>>>>
>>>> The timer's clock is fixed to 32.768K and no need to divide the
>>>> frequency, so our clock tree does not supply the timer's clock now.
>>>
>>> The driver is fine. However, I would like to unify the clk usage in the
>>> timer driver, so if you refer to a clock so the TIMER_OF_CLOCK can be
>>> used, that will nice.
>>
>> I understand your concern, but I've asked our clock driver owner in
>> Spreadtrum, we have no related registers to describe the topology of
>> the RTC fixed 32.768K, so the clock driver can not add timer's clock
>> node.
> 
> Sorry for my misunderstanding, I confirmed with Chunyan (who
> upstreamed our clock driver), she told me that we can get the clock
> rate from clock node. I will fix this issue in next version. Thanks
> for your comments.

Great, thanks Baolin.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
