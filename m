From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 04/15] x86/dtb: add irq domain abstraction
Date: Sun, 23 Jan 2011 18:36:36 +0530
Message-ID: <20110123130636.GA23058@www.tglx.de>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-5-git-send-email-bigeasy@linutronix.de>
	<20110111220317.GA2131@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110111220317.GA2131-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely | 2011-01-11 15:03:17 [-0700]:

>>  unsigned int irq_create_of_mapping(struct device_node *controller,
>>  		const u32 *intspec, unsigned int intsize)
>>  {
>> -	return intspec[0];
>> +	struct irq_domain *ih;
>> +	u32 virq;
>> +	u32 type;
>> +	int ret;
>>  
>> +	ih = get_ih_from_node(controller);
>> +	if (!ih)
>> +		return -ENODEV;
>
>Return value is an unsigned int.  0 or NO_IRQ is the correct thing to
>return if an IRQ cannot be mapped.
fixed.

>> +	ret = ih->xlate(ih, intspec, intsize, &virq, &type);
>> +	if (ret)
>> +		return ret;
>
>Ditto here.  xlate is also supposed to return a virq number, not an
>error code, so the failure condition must be "if (!ret)" or
are you sure on that? The relevant part of powerpc's
irq_create_of_mapping() looks like:

| if (host->ops->xlate(host, controller, intspec, intsize,
|                           &hwirq, &type))
|       return NO_IRQ;

so xlate here returns 0 on success and hwirq via a pointer. I do the
same thing here except I return directly virq instead of
irq_hw_number_t. I add powerpc's irq_create_mapping() including virq <->
hwirq mapping once it is generic. I shouldn't need unless we use
non-ioapics are irq controllers.

>"if (reg == NO_IRQ)".  The former is preferred since we're trying to
>eliminate references to NO_IRQ, not add more of them.
Okay. So try to get rid of NO_IRQ in my series.

Sebastian
