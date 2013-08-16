From: Loh Tien Hock <thloh@altera.com>
Subject: Re: FW: [PATCH 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Fri, 16 Aug 2013 23:06:37 +0800
Message-ID: <CAJKo0K5qnYpO5D-qOd6ygHDqvfCJB+3GmC+AwhytmQ2bMPyN1g@mail.gmail.com>
References: <1373267079-15843-1-git-send-email-thloh@altera.com>
 <CACRpkdYf_EHwcysQadtOBt2_OXmZbW9CuwOGDBF-JhnNzAd=Bg@mail.gmail.com>
 <CAJKo0K5mycRyd4i9FBa+kg2s7byF4rNgRrjE1Tuv-sTHUpTFiQ@mail.gmail.com>
 <CACRpkdY-er9k6kZh436vmR9V-yivSZ8yu+PuP-jEq3kz__1a0g@mail.gmail.com>
 <CAJKo0K5kBPtLpODjoOgf=JXzVDf9pkpB4QTZ-h8shhHXyx6oZg@mail.gmail.com>
 <CACRpkdbthw=-bdP=QugKhgyuQUV5_uV==AeBneZSqyk7Hs6muQ@mail.gmail.com> <0BB3B561D7068A4E89FD8E9ABFB538BEB3B6A29252@PG-ITMSG03.altera.priv.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <0BB3B561D7068A4E89FD8E9ABFB538BEB3B6A29252@PG-ITMSG03.altera.priv.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Loh Tien Hock <thloh85@gmail.com>
List-Id: devicetree@vger.kernel.org

> On Mon, Jul 29, 2013 at 6:24 PM, Loh Tien Hock <thloh@altera.com> wrote:
>> On Tue, Jul 30, 2013 at 12:11 AM, Linus Walleij
>
>>>>>> +static int altera_gpio_irq_set_type(struct irq_data *d,
>>>>>> +                               unsigned int type) {
>>>>>> +       struct altera_gpio_chip *altera_gc =
>>>>>> +irq_data_get_irq_chip_data(d);
>>>>>> +
>>>>>> +       if (type == IRQ_TYPE_NONE)
>>>>>> +               return 0;
>>>>>> +
>>>>>> +       if (altera_gc->level_trigger) {
>>>>>> +               if (type == IRQ_TYPE_LEVEL_HIGH)
>>>>>> +                       return 0;
>>>>>> +       } else {
>>>>>> +               if (type == IRQ_TYPE_EDGE_RISING &&
>>>>>> +                       altera_gc->edge_type == ALTERA_IRQ_RISING)
>>>>>> +                       return 0;
>>>>>> +               else if (type == IRQ_TYPE_EDGE_FALLING &&
>>>>>> +                       altera_gc->edge_type == ALTERA_IRQ_FALLING)
>>>>>> +                       return 0;
>>>>>> +               else if (type == IRQ_TYPE_EDGE_BOTH &&
>>>>>> +                       altera_gc->edge_type == ALTERA_IRQ_BOTH)
>>>>>> +                       return 0;
>>>>>
>>>>> I don't quite realize why you need the local version of the IRQflag
>>>>> at all. Just store the standard edge indicator in an unsigned long?
>>>>
>>>> I don't understand the comment. Can you elaborate further?
>>>
>>> I misunderstood it for the above reason. But get rid of the custom
>>> ALTERA_IRQ_* defines and just use the standard definitions for
>>> IRQ_TYPE_*, the local defines does not add anything useful.
>>
>> We still need to compare the altera_gc->edge_type to the expected ones
>> (so that we don't allow incorrect configuration, eg. the GPIO is
>> configured as rising, but set_type tries to set falling).
>> So we should compare it with magic numbers, instead of custom defines
>> like the example below?
>>                if (type == IRQ_TYPE_EDGE_RISING &&
>>                        altera_gc->edge_type == 0)
>>                        return 0;
>
> And why can't altera_gc->edge_type use exactly the same enumerators so it becomes:
>
> (type == IRQ_TYPE_EDGE_RISING &&
> altera_gc->edge_type == IRQ_TYPE_EDGE_RISING)
>
> ?
>

We're unable to do that because the tool that generates the dts file
had the number that way, and if we were to change to code to your
suggestion, the tool needs to be changed and it will break backward
compatibility.

>
>
> Yours,
> Linus Walleij
