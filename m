From: Loh Tien Hock <thloh@altera.com>
Subject: Re: [PATCH 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Tue, 30 Jul 2013 00:24:03 +0800
Message-ID: <CAJKo0K5kBPtLpODjoOgf=JXzVDf9pkpB4QTZ-h8shhHXyx6oZg@mail.gmail.com>
References: <1373267079-15843-1-git-send-email-thloh@altera.com>
 <CACRpkdYf_EHwcysQadtOBt2_OXmZbW9CuwOGDBF-JhnNzAd=Bg@mail.gmail.com>
 <CAJKo0K5mycRyd4i9FBa+kg2s7byF4rNgRrjE1Tuv-sTHUpTFiQ@mail.gmail.com> <CACRpkdY-er9k6kZh436vmR9V-yivSZ8yu+PuP-jEq3kz__1a0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY-er9k6kZh436vmR9V-yivSZ8yu+PuP-jEq3kz__1a0g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tien Hock Loh <thloh.linux@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 30, 2013 at 12:11 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Tue, Jul 23, 2013 at 4:51 AM, Loh Tien Hock <thloh85@gmail.com> wrote:
>> On Tue, Jul 23, 2013 at 3:07 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>>> On Mon, Jul 8, 2013 at 9:04 AM,  <thloh.linux@gmail.com> wrote:
>>>> +- level_trigger: Specifies whether the GPIO interrupt is level trigger (high).
>>>> +  This field is required if the Altera GPIO controller used has IRQ enabled.
>>>> +- edge_type: Specifies edge type if the GPIO interrupt is edge trigger:
>>>> +       0 = Rising edge
>>>> +       1 = Falling edge
>>>> +       2 = Both edge
>>>
>>> No thanks.
>>
>> I don't understand the comment here. Could you elaborate further?
>> The edge_type is required as the soft IP's interrupt type isn't
>> software configurable, and thus is a hardware parameter passed in from
>> device tree blob.
>
> Aha I see. Explain this in the binding document, i.e. state that
> this is a synthesis parameter in the hardware block and not
> software controlled.
>
>>>> +static int altera_gpio_irq_set_type(struct irq_data *d,
>>>> +                               unsigned int type)
>>>> +{
>>>> +       struct altera_gpio_chip *altera_gc = irq_data_get_irq_chip_data(d);
>>>> +
>>>> +       if (type == IRQ_TYPE_NONE)
>>>> +               return 0;
>>>> +
>>>> +       if (altera_gc->level_trigger) {
>>>> +               if (type == IRQ_TYPE_LEVEL_HIGH)
>>>> +                       return 0;
>>>> +       } else {
>>>> +               if (type == IRQ_TYPE_EDGE_RISING &&
>>>> +                       altera_gc->edge_type == ALTERA_IRQ_RISING)
>>>> +                       return 0;
>>>> +               else if (type == IRQ_TYPE_EDGE_FALLING &&
>>>> +                       altera_gc->edge_type == ALTERA_IRQ_FALLING)
>>>> +                       return 0;
>>>> +               else if (type == IRQ_TYPE_EDGE_BOTH &&
>>>> +                       altera_gc->edge_type == ALTERA_IRQ_BOTH)
>>>> +                       return 0;
>>>
>>> I don't quite realize why you need the local version of
>>> the IRQflag at all. Just store the standard edge indicator
>>> in an unsigned long?
>>
>> I don't understand the comment. Can you elaborate further?
>
> I misunderstood it for the above reason. But get rid of the
> custom ALTERA_IRQ_* defines and just use the standard
> definitions for IRQ_TYPE_*, the local defines does not add
> anything useful.
>

We still need to compare the altera_gc->edge_type to the expected ones
(so that we don't allow incorrect configuration, eg. the GPIO is
configured as rising, but set_type tries to set falling).
So we should compare it with magic numbers, instead of custom defines
like the example below?
               if (type == IRQ_TYPE_EDGE_RISING &&
                       altera_gc->edge_type == 0)
                       return 0;


>>>> +       chip->irq_mask(&desc->irq_data);
>>>> +
>>>> +       if (altera_gc->level_trigger) {
>>>> +               status = readl_relaxed(mm_gc->regs + ALTERA_GPIO_DATA);
>>>> +               status &= readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
>>>> +
>>>> +               for (base = 0; base < mm_gc->gc.ngpio; base++) {
>>>> +                       if (BIT(base) & status) {
>>>> +                               generic_handle_irq(irq_linear_revmap(
>>>> +                                       altera_gc->irq, base));
>>>> +                       }
>>>> +               }
>>>> +       } else {
>>>> +               while ((status =
>>>> +                       (readl_relaxed(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
>>>> +                       readl_relaxed(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
>>>> +                       writel_relaxed(status,
>>>> +                               mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
>>>
>>> Nice use if relaxed accessors in the irq handler!
>>
>> I don't understand the comment. Could you elaborate further?
>
> I am just saying that you are doing the right thing, it is a positive
> comment :-)

Oh. Thanks.

>
> Yours,
> Linus Walleij
