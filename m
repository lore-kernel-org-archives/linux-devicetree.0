From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: [PATCH 1/4 v4] irqchip: Ingenic: Change interrupt handling form
 cascade to chained_irq.
Date: Tue, 30 Jul 2019 14:41:56 +0800
Message-ID: <5D3FE6B4.6040602@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-2-git-send-email-zhouyanjie@zoho.com>
 <1564420754.6633.0@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564420754.6633.0@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

Hi Paul,
Thanks for your suggestion, and after receiving Marc's comments,
if this patch can be continued, I'll use for_each_set_bit() to simplify
code in v5.

On 2019=E5=B9=B407=E6=9C=8830=E6=97=A5 01:19, Paul Cercueil wrote:
> Hi Zhou,
>
>
>
> Le dim. 28 juil. 2019 =C3=A0 13:34, Zhou Yanjie <zhouyanjie@zoho.com> a=
=20
> =C3=A9crit :
>> The interrupt handling method is changed from old-style cascade to
>> chained_irq which is more appropriate. Also, it can process the
>> corner situation that more than one irq is coming to a single
>> chip at the same time.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>  drivers/irqchip/irq-ingenic.c | 37=20
>> +++++++++++++++++++++++--------------
>>  1 file changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-ingenic.c=20
>> b/drivers/irqchip/irq-ingenic.c
>> index f126255..49f7685 100644
>> --- a/drivers/irqchip/irq-ingenic.c
>> +++ b/drivers/irqchip/irq-ingenic.c
>> @@ -1,7 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0-or-later
>>  /*
>>   *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
>> - *  JZ4740 platform IRQ support
>> + *  Ingenic XBurst platform IRQ support
>>   */
>>
>>  #include <linux/errno.h>
>> @@ -10,6 +10,7 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/ioport.h>
>>  #include <linux/irqchip.h>
>> +#include <linux/irqchip/chained_irq.h>
>>  #include <linux/irqchip/ingenic.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_irq.h>
>> @@ -32,22 +33,34 @@ struct ingenic_intc_data {
>>  #define JZ_REG_INTC_PENDING    0x10
>>  #define CHIP_SIZE        0x20
>>
>> -static irqreturn_t intc_cascade(int irq, void *data)
>> +static void ingenic_chained_handle_irq(struct irq_desc *desc)
>>  {
>> -    struct ingenic_intc_data *intc =3D irq_get_handler_data(irq);
>> -    uint32_t irq_reg;
>> +    struct ingenic_intc_data *intc =3D irq_desc_get_handler_data(desc);
>> +    struct irq_chip *chip =3D irq_desc_get_chip(desc);
>> +    bool have_irq =3D false;
>> +    uint32_t pending;
>>      unsigned i;
>>
>> +    chained_irq_enter(chip, desc);
>>      for (i =3D 0; i < intc->num_chips; i++) {
>> -        irq_reg =3D readl(intc->base + (i * CHIP_SIZE) +
>> +        pending =3D readl(intc->base + (i * CHIP_SIZE) +
>>                  JZ_REG_INTC_PENDING);
>> -        if (!irq_reg)
>> +        if (!pending)
>>              continue;
>>
>> -        generic_handle_irq(__fls(irq_reg) + (i * 32) +=20
>> JZ4740_IRQ_BASE);
>> +        have_irq =3D true;
>> +        while (pending) {
>> +            int bit =3D __fls(pending);
>
> Use the for_each_set_bit() macro here, that will be simpler.
>
>
>> +
>> +            generic_handle_irq(bit + (i * 32) + JZ4740_IRQ_BASE);
>> +            pending &=3D ~BIT(bit);
>> +        }
>>      }
>>
>> -    return IRQ_HANDLED;
>> +    if (!have_irq)
>> +        spurious_interrupt();
>> +
>> +    chained_irq_exit(chip, desc);
>>  }
>>
>>  static void intc_irq_set_mask(struct irq_chip_generic *gc, uint32_t=20
>> mask)
>> @@ -70,11 +83,6 @@ void ingenic_intc_irq_resume(struct irq_data *data)
>>      intc_irq_set_mask(gc, gc->mask_cache);
>>  }
>>
>> -static struct irqaction intc_cascade_action =3D {
>> -    .handler =3D intc_cascade,
>> -    .name =3D "SoC intc cascade interrupt",
>> -};
>> -
>>  static int __init ingenic_intc_of_init(struct device_node *node,
>>                         unsigned num_chips)
>>  {
>> @@ -139,7 +147,8 @@ static int __init ingenic_intc_of_init(struct=20
>> device_node *node,
>>      if (!domain)
>>          pr_warn("unable to register IRQ domain\n");
>>
>> -    setup_irq(parent_irq, &intc_cascade_action);
>> +    irq_set_chained_handler_and_data(parent_irq,
>> +                    ingenic_chained_handle_irq, intc);
>>      return 0;
>>
>>  out_unmap_irq:
>> --=20
>> 2.7.4
>
>
