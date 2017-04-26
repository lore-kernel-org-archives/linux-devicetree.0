From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v4 5/7] pinctrl: aramda-37xx: Add irqchip support
Date: Wed, 26 Apr 2017 11:23:49 +0200
Message-ID: <87zif38qu2.fsf@free-electrons.com>
References: <cover.65d0e6796fecf1fe6c5d07b981160b54dc9b4acd.1491405475.git-series.gregory.clement@free-electrons.com>
 <70ffe3343c13d01737bf74e5de4898d0c0be07a0.1491405475.git-series.gregory.clement@free-electrons.com>
 <CACRpkdZ=mVXBbVf1iHg8nQ6pYUkvpB+egH+stoMrkD8V_vaYpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZ=mVXBbVf1iHg8nQ6pYUkvpB+egH+stoMrkD8V_vaYpg@mail.gmail.com>
 (Linus Walleij's message of "Mon, 24 Apr 2017 14:14:36 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Victor Gu <xigu@marvell.com>, Hua Jing <jinghua@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,
 
 On lun., avril 24 2017, Linus Walleij <linus.walleij@linaro.org> wrote:

> On Wed, Apr 5, 2017 at 5:18 PM, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
>
>> The Armada 37xx SoCs can handle interrupt through GPIO. However it can
>> only manage the edge ones.
>>
>> The way the interrupt are managed are classical so we can use the generic
>> interrupt chip model.
>>
>> The only unusual "feature" is that many interrupts are connected to the
>> parent interrupt controller. But we do not take advantage of this and use
>> the chained irq with all of them.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
>
> There are some issues with this patch.
>
> First:
> You need to add
> select GPIOLIB_IRQCHIP
> to the Kconfig entry. It's only working in your setup
> because something else is selecting this for you, probably.

It is done in patch 2 "arm64: marvell: enable the Armada 37xx pinctrl
driver".

>
> At all places like this:
>
>> +       u32 mask = d->mask;
> (...)
>> +       if (on)
>> +               val |= mask;
>> +       else
>> +               val &= ~mask;
>
> Isn't it simpler to just use d->mask directly in the code and skip the local
> variable?
>
> if (on)
>   val |= d->mask;
> (...)

Yes sure I cand do it.

>
>> +static void armada_37xx_irq_handler(struct irq_desc *desc)
>> +{
>> +       struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>> +       struct irq_chip *chip = irq_desc_get_chip(desc);
>> +       struct armada_37xx_pinctrl *info = gpiochip_get_data(gc);
>> +       struct irq_domain *d = gc->irqdomain;
>> +       int i;
>> +
>> +       chained_irq_enter(chip, desc);
>> +       for (i = 0; i <= d->revmap_size / GPIO_PER_REG; i++) {
>> +               u32 status;
>> +               unsigned long flags;
>> +
>> +               spin_lock_irqsave(&info->irq_lock, flags);
>> +               status = readl_relaxed(info->base + IRQ_STATUS + 4 * i);
>> +               /* Manage only the interrupt that was enabled */
>> +               status &= readl_relaxed(info->base + IRQ_EN + 4 * i);
>> +               spin_unlock_irqrestore(&info->irq_lock, flags);
>> +               while (status) {
>> +                       u32 hwirq = ffs(status) - 1;
>> +                       u32 virq = irq_find_mapping(d, hwirq +
>> +                                                    i * GPIO_PER_REG);
>> +
>> +                       generic_handle_irq(virq);
>> +                       status &= ~BIT(hwirq);
>> +               }
>
> You hae a problem here is a new IRQ appears while you are inside
> of this loop. You need to re-read the status register for each iteration
> (and &= with the IRQ_EN I guess).

If a new IRQ appears during the loop, then the irq handler will be
called again because the cause of this new IRQ won't have been acked
yet. So I think we're fine here.

>
>> +static int armada_37xx_irqchip_register(struct platform_device *pdev,
>> +                                       struct armada_37xx_pinctrl *info)
>> +{
>> +       struct device_node *np = info->dev->of_node;
>> +       int nrirqs = info->data->nr_pins;
>> +       struct gpio_chip *gc = &info->gpio_chip;
>> +       struct irq_chip *irqchip = &info->irq_chip;
>> +       struct resource res;
>> +       int ret = -ENODEV, i, nr_irq_parent;
>> +
>
> This warrants a comment:
> /* Check if we have at least one gpio-controller child node */
>

OK

>> +       for_each_child_of_node(info->dev->of_node, np) {
>> +               if (of_find_property(np, "gpio-controller", NULL)) {
>> +                       ret = 0;
>> +                       break;
>> +               }
>
> Rewrite:
>
> if (of_property_read_bool(np, "gpio-controller"))
>

OK


Gregory
-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
