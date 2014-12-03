From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 05/12] irqchip: nvic: increase number of external
 interrupts to 112
Date: Wed, 03 Dec 2014 18:40:21 +0100
Message-ID: <fb02acab3300a988ae6bb349506adb80@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
 <1417565531-4507-6-git-send-email-stefan@agner.ch>
 <20141203081245.GH2129@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141203081245.GH2129-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-03 09:12, Uwe Kleine-K=C3=B6nig wrote:
> Hallo Stefan,
>=20
> On Wed, Dec 03, 2014 at 01:12:04AM +0100, Stefan Agner wrote:
>> So far only vectors for up to 48 external interrupts have been
>> registred in the vector table. Increase the amount of registred
> s/registred/registered/
>=20
>> external vectors to 112. Also, add a warning in case NVIC reports
>> support for more interrupts than 128.
> s/interrupts than 128/than 128 interrupts/ (not sure about this one)
>=20
>> Note: the vector table must align to the number of entires in the
> s/entires/entries/
>=20
> Maybe point out that "X external interrupts" corresponds to "X + 16
> vectors".
>=20
>> vector table, hence increase the alignment to 0x200.
>>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>> ---
>>  arch/arm/kernel/entry-v7m.S | 6 +++---
>>  drivers/irqchip/irq-nvic.c  | 2 ++
>>  2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m=
=2ES
>> index 2260f18..754a1fa 100644
>> --- a/arch/arm/kernel/entry-v7m.S
>> +++ b/arch/arm/kernel/entry-v7m.S
>> @@ -115,7 +115,7 @@ ENTRY(__switch_to)
>>  ENDPROC(__switch_to)
>>
>>  	.data
>> -	.align	8
>> +	.align	9
>>  /*
>>   * Vector table (64 words =3D> 256 bytes natural alignment)
> This comment needs fixing
>=20
>>   */
>> @@ -136,6 +136,6 @@ ENTRY(vector_table)
>>  	.long	__invalid_entry		@ 13 - Reserved
>>  	.long	__pendsv_entry		@ 14 - PendSV
>>  	.long	__invalid_entry		@ 15 - SysTick
>> -	.rept	64 - 16
>> -	.long	__irq_entry		@ 16..64 - External Interrupts
>> +	.rept	128 - 16
>> +	.long	__irq_entry		@ 16..128 - External Interrupts
>>  	.endr
>> diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
>> index dbfb5be..40f62a9 100644
>> --- a/drivers/irqchip/irq-nvic.c
>> +++ b/drivers/irqchip/irq-nvic.c
>> @@ -137,6 +137,8 @@ static int __init nvic_of_init(struct device_nod=
e *node,
>>  	if (irqs > NVIC_MAX_IRQ)
>>  		irqs =3D NVIC_MAX_IRQ;
>>
>> +	WARN(irqs > 128, "vector table in entry-v7m.S configured for 128 i=
rqs");
>> +
> That's pointless. Better do:
>=20
> 	if (WARN(irqs > 128, "vector table in entry-v7m.S configured for 128=
 irqs"))
> 		irqs =3D 128;
>=20
> Hmm, I wonder if that is correct. The first 16 exceptions are the sys=
tem
> exception that will not be registered be drivers and so exception 16
> (i.e. the first regular irq) is reported as hwirq 0. So I think we ca=
n
> (in a separate patch) pass irqs - 16 to irq_domain_add_linear. Didn't
> test that though.

Hm, I think you are correct yes. NVIC interrupt ID's are shifted by 16
compared to the Cortex-M4 vector table. Also the irq check above would
need to take care of that.

I anyway need to have a look into that, since I need to make sure that =
I
work with the right interrupt ID's for both cores M4 (NVIC) and A5
(GIC)... The assignment is quite nicely listed in chapter 3.2.4
(Interrupt Assignments) in the Vybrid RM. The table also supports your
statement above.

Agreed on all the rest.

--
Stefan

>=20
>>  	nvic_irq_domain =3D
>>  		irq_domain_add_linear(node, irqs, &nvic_irq_domain_ops, NULL);
>>  	if (!nvic_irq_domain) {

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
