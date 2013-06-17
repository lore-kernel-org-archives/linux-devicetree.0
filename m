From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] drivers/gpio: Altera soft IP GPIO driver
Date: Mon, 17 Jun 2013 11:12:06 +0200
Message-ID: <CACRpkdZ0ENRhc8bMeHDzv7snF_JP97sYFJTViXfY1M0MB0cRPw@mail.gmail.com>
References: <1370505910-2102-1-git-send-email-thloh@altera.com>
	<CACRpkdZZyTDT6mo-3iqRnSSbeJtt4HnVnmkeqoir-UV_8nG0rQ@mail.gmail.com>
	<CAJKo0K4mRA-w43CsGGr_u0_51g5sh3kM6VUXMu56LXTaw1p4WA@mail.gmail.com>
	<CAJKo0K4eic5LsMJ-bs0Jdge-Qm2ACjLKqpFYALvh305j4mZ4Ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAJKo0K4eic5LsMJ-bs0Jdge-Qm2ACjLKqpFYALvh305j4mZ4Ag@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Loh Tien Hock <thloh@altera.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2013 at 9:29 AM, Loh Tien Hock <thloh@altera.com> wrote:
> On Mon, Jun 17, 2013 at 2:38 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Jun 6, 2013 at 10:05 AM,  <thloh@altera.com> wrote:
>>> +static void altera_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
>>> +{
>>> +       struct altera_gpio_chip *altera_gc = irq_desc_get_handler_data(desc);
>>> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>>> +       struct of_mm_gpio_chip *mm_gc = &altera_gc->mmchip;
>>> +       unsigned long status;
>>> +
>>> +       int base;
>>> +       chip->irq_mask(&desc->irq_data);
>>> +
>>> +       if (altera_gc->level_trigger) {
>>> +               status = __raw_readl(mm_gc->regs + ALTERA_GPIO_DATA);
>>> +               status &= __raw_readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK);
>>> +
>>> +               for (base = 0; base < mm_gc->gc.ngpio; base++) {
>>> +                       if ((1 << base) & status) {
>>> +                               generic_handle_irq(irq_linear_revmap(
>>> +                                       altera_gc->irq, base));
>>> +                       }
>>> +               }
>>> +       } else {
>>> +               while ((status =
>>> +                       (__raw_readl(mm_gc->regs + ALTERA_GPIO_EDGE_CAP) &
>>> +                       __raw_readl(mm_gc->regs + ALTERA_GPIO_IRQ_MASK)))) {
>>> +                       __raw_writel(status,
>>> +                               mm_gc->regs + ALTERA_GPIO_EDGE_CAP);
>>> +                       for (base = 0; base < mm_gc->gc.ngpio; base++) {
>>> +                               if ((1 << base) & status) {
>>> +                                       generic_handle_irq(irq_linear_revmap(
>>> +                                               altera_gc->irq, base));
>>> +                               }
>>> +                       }
>>> +               }
>>> +       }
>>> +
>>> +       chip->irq_eoi(irq_desc_get_irq_data(desc));
>>> +       chip->irq_unmask(&desc->irq_data);
>>> +}
>>
>> Why is the above code using __raw_* accessors?
>>
>> Atleast use readl_relaxed() instead of __raw.
>
> Noted.
>
> A question regarding readl_relaxed(), is that because the endianess
> swapping? If that's the case, should codes in other functions use
> readl_relaxed()/writel_relaxed() as well?

Basically I think of it like this:

__raw_* = will just poke the registers without really taking anything
   into account, in native endianness.

readl/writel_relaxed() = same thing but always little-endian.

readl()/write() = always little-endian, and will go to lengths to also
drain buffers etc so the write hits the target registers after the PC
passed this instruction. To the extent possible, and may cause a
performance problem due to all buffer draining.

Yours,
Linus Walleij
