From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/6] irqchip: irq-mvebu-gicp: new driver for Marvell GICP
Date: Tue, 30 May 2017 16:17:41 +0100
Message-ID: <5b882159-4de1-5a8e-5737-56542f2aee3a@arm.com>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496135772-20694-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <2ea42715-700b-c363-eeba-db83b0f63a70@arm.com>
 <20170530165454.6ca24dbc@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530165454.6ca24dbc-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/05/17 15:54, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 30 May 2017 14:55:57 +0100, Marc Zyngier wrote:
> 
>>> +	for (i = 0; i < GICP_INT_COUNT; i++)
>>> +		writel(i, regs + GICP_CLRSPI_NSR_OFFSET);  
>>
>> What does this do on an edge interrupt?
> 
> I guess nothing. What the ICU does is:
> 
>  * For level interrupts: when the interrupt wire is asserted, write to
>    SETNSR, when the interrupt wire is deasserted, write to CLRNSR
> 
>  * For edge interrupts: only the interrupt assertion causes a write to
>    SETNSR.
> 
>> I bet this doesn't have any effect
> 
> Indeed. But do we care? Can an edge interrupt be left pending from the
> firmware?

I cannot see why not. It is just as likely as a level interrupt.

> 
>> , so you may want to use the irq_set_irqchip_state() API to clear a
>> potential pending state instead (and you may want to wire it in the
>> ICU driver itself as well).
> 
> I'm not sure how to use this irq_set_irqchip_state() API. I guess it
> needs a virq that corresponds to the GIC SPI interrupt, and I'm not
> sure how to get that.

You do have the virtual interrupt when doing the allocation (it is
passed as a parameter). So you could perform the mapping (call into the
lower layers), and clear the pending bit using the above API.

But maybe you don't have any edge interrupt on this SoC, and it doesn't
matter.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
