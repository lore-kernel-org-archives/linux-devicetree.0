From: Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 1/7] irqdomain: Fix irq_domain_alloc_irqs return check.
Date: Mon, 13 Oct 2014 22:13:17 +0800
Message-ID: <543BDDFD.1030300@linux.intel.com>
References: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com> <1412864980-20273-2-git-send-email-yingjoe.chen@mediatek.com> <543BC186.2050701@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <543BC186.2050701-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 2014/10/13 20:11, Marc Zyngier wrote:
> On 09/10/14 15:29, Joe.C wrote:
>> From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>
>> Change virq type from unsigned int to int. Otherwise the return value
>> check for irq_domain_alloc_irqs will always pass.
>>
>> Signed-off-by: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> ---
>>  kernel/irq/irqdomain.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>> index 584be46..dd8d3ab 100644
>> --- a/kernel/irq/irqdomain.c
>> +++ b/kernel/irq/irqdomain.c
>> @@ -469,7 +469,7 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
>>  	struct irq_domain *domain;
>>  	irq_hw_number_t hwirq;
>>  	unsigned int type = IRQ_TYPE_NONE;
>> -	unsigned int virq;
>> +	int virq;
>>  
>>  	domain = irq_data->np ? irq_find_host(irq_data->np) : irq_default_domain;
>>  	if (!domain) {
>>
> 
> I'd expect this patch to get folded into Jiang's series.
Hi Mark and Joe,
	Yes, my next version includes this fixup.
Regards!
Gerry
> 
> Thanks,
> 
> 	M.
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
