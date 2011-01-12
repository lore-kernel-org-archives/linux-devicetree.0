From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 10/15] x86/ioapic: Add OF bindings for IO-APIC
Date: Wed, 12 Jan 2011 18:07:07 +0100
Message-ID: <20110112170707.GA6907@www.tglx.de>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-11-git-send-email-bigeasy@linutronix.de>
	<20110111235353.GG2131@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110111235353.GG2131-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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

* Grant Likely | 2011-01-11 16:53:53 [-0700]:

>> +void __init ioapic_add_ofnode(struct device_node *np)
>> +{
>> +	int i;
>> +	int ret;
>> +	struct resource r;
>> +
>> +	ret = of_address_to_resource(np, 0, &r);
>> +	if (ret) {
>> +		printk(KERN_ERR "Failed to obtain address for %s\n",
>> +				np->full_name);
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i < nr_ioapics; i++) {
>> +		if (r.start == mp_ioapics[i].apicaddr) {
>> +			struct irq_domain *id;
>> +
>> +			mp_of_ioapic[i].node = np;
>> +			id = kzalloc(sizeof(*id), GFP_KERNEL);
>> +			BUG_ON(!id);
>> +			id->controller = np;
>> +			id->xlate = ioapic_xlate;
>> +			id->priv = (void *)i;
>> +			add_interrupt_host(id);
>> +			return;
>> +		}
>
>I'm confused here.  Are there multiple ioapic's described by a single
>device tree node?

Yes, the CE4100 has two IO-APICs. It looks like the first one is
responsible for the "legacy devices" (like RTC) and the second one is
used for the "extra devices" like SPI controller, USB, ... The UART
however is not on the first IO-APIC but on the second.

Those two IO-APICs are not cascaded. The device tree contains the line
number of device to the io apic. The kernel computes then interrupt
number based on gsi_base + line_number where gsi_base is incremented by
the number of entries[0]. This interrupt number (gsi_base + line) is then
sent via apic bus to lapic which reports it as the active interrupt
source.

Sebastian
