From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: Re: [PATCH 1/4] Irqchip: Ingenic: Change interrupt handling form
 cascade to chained_irq.
Date: Sun, 27 Jan 2019 22:49:51 +0800
Message-ID: <5C4DC50F.1000202@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1548517123-60058-2-git-send-email-zhouyanjie@zoho.com>
 <86o982wgcr.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86o982wgcr.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, mark.rutland@arm.com, jason@lakedaemon.net, tglx@linutronix.de, syq@debian.org, jiaxun.yang@flygoat.com, 772753199@qq.com
List-Id: devicetree@vger.kernel.org

My fault, in the function "generic_handle_irq" should use "bit" instead=20
of "__fls(irq_reg)".
It will be fixed in the v2.

On 2019=E5=B9=B401=E6=9C=8827=E6=97=A5 18:21, Marc Zyngier wrote:
> On Sat, 26 Jan 2019 15:38:40 +0000,
> Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>> The interrupt handling method is changed from old-style cascade to
>> chained_irq which is more appropriate. Also, it can process the
>> corner situation that more than one irq is coming to a single
>> chip at the same time.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   drivers/irqchip/irq-ingenic.c | 49 ++++++++++++++++++++++-------------=
--------
>>   1 file changed, 25 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic=
.c
>> index 2ff0898..2713ec4 100644
>> --- a/drivers/irqchip/irq-ingenic.c
>> +++ b/drivers/irqchip/irq-ingenic.c
>> @@ -1,16 +1,7 @@
>> +// SPDX-License-Identifier: GPL-2.0
>>   /*
>>    *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
>> - *  JZ4740 platform IRQ support
>> - *
>> - *  This program is free software; you can redistribute it and/or modif=
y it
>> - *  under  the terms of the GNU General=09 Public License as published =
by the
>> - *  Free Software Foundation;  either version 2 of the License, or (at =
your
>> - *  option) any later version.
>> - *
>> - *  You should have received a copy of the GNU General Public License a=
long
>> - *  with this program; if not, write to the Free Software Foundation, I=
nc.,
>> - *  675 Mass Ave, Cambridge, MA 02139, USA.
>> - *
>> + *  Ingenic XBurst platform IRQ support
>>    */
>>  =20
>>   #include <linux/errno.h>
>> @@ -19,6 +10,7 @@
>>   #include <linux/interrupt.h>
>>   #include <linux/ioport.h>
>>   #include <linux/irqchip.h>
>> +#include <linux/irqchip/chained_irq.h>
>>   #include <linux/irqchip/ingenic.h>
>>   #include <linux/of_address.h>
>>   #include <linux/of_irq.h>
>> @@ -41,22 +33,35 @@ struct ingenic_intc_data {
>>   #define JZ_REG_INTC_PENDING=090x10
>>   #define CHIP_SIZE=09=090x20
>>  =20
>> -static irqreturn_t intc_cascade(int irq, void *data)
>> +static void ingenic_chained_handle_irq(struct irq_desc *desc)
>>   {
>> -=09struct ingenic_intc_data *intc =3D irq_get_handler_data(irq);
>> -=09uint32_t irq_reg;
>> +=09struct ingenic_intc_data *intc =3D irq_desc_get_handler_data(desc);
>> +=09struct irq_chip *chip =3D irq_desc_get_chip(desc);
>> +=09bool have_irq =3D false;
>> +=09u32 pending;
>>   =09unsigned i;
>>  =20
>> +=09chained_irq_enter(chip, desc);
>>   =09for (i =3D 0; i < intc->num_chips; i++) {
>> -=09=09irq_reg =3D readl(intc->base + (i * CHIP_SIZE) +
>> +=09=09pending =3D readl(intc->base + (i * CHIP_SIZE) +
>>   =09=09=09=09JZ_REG_INTC_PENDING);
>> -=09=09if (!irq_reg)
>> +=09=09if (!pending)
>>   =09=09=09continue;
>>  =20
>> -=09=09generic_handle_irq(__fls(irq_reg) + (i * 32) + JZ4740_IRQ_BASE);
>> +=09=09have_irq =3D true;
>> +=09=09while (pending) {
>> +=09=09=09int bit =3D __ffs(pending);
> So 'bit' is the least significant bit in the pending word,
>
>> +
>> +=09=09=09generic_handle_irq(__fls(pending) + (i * 32) +
> and here you handle the *most significant* bit,
>
>> +=09=09=09=09=09JZ4740_IRQ_BASE);
>> +=09=09=09pending &=3D ~BIT(bit);
> yet it is the least significant bit that you clear. I am tempted to
> say that you have never tested this code with more than a single
> interrupt.
>
> Thanks,
>
> =09M.
>
