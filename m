From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 05/15] x86/dtb: add early parsing of APIC and IO APIC
Date: Tue, 18 Jan 2011 15:56:47 +0100
Message-ID: <4D35AA2F.3000503@linutronix.de>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-6-git-send-email-bigeasy@linutronix.de>
	<20101230085451.GF11721@angua.secretlab.ca>
	<20110104132302.GB21359@www.tglx.de>
	<20110111221401.GB2131@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110111221401.GB2131-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> Hi Sebastian,
Hi Grant,

>> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.h
>> index 9076ae4..3bc8ed5 100644
>> --- a/arch/x86/include/asm/prom.h
>> +++ b/arch/x86/include/asm/prom.h
>> @@ -22,10 +22,17 @@
>>  #include <asm/irq_controller.h>
>>  
>>  #ifdef CONFIG_OF
>> +extern int of_ioapic;
>> +extern u64 initial_dtb;
>>  extern void add_dtb(u64 data);
>> +void x86_dtb_find_config(void);
>> +void x86_dtb_get_config(unsigned int unused);
>>  void add_interrupt_host(struct irq_domain *ih);
>>  #else
>>  static inline void add_dtb(u64 data) { }
>> +#define x86_dtb_find_config x86_init_noop
>> +#define x86_dtb_get_config x86_init_uint_noop
>> +#define of_ioapic 0
> 
> Nit: Personally, I prefer static inlines over preprocessor macros, but
> that isn't anything that will block this patch.

Right. x86 does similar for ioapic function callbacks for CONFIG_IOAPIC
case. So I keep this unless x86 folks want it different.

>> +#ifdef CONFIG_X86_IO_APIC
>> +static void __init dtb_add_ioapic(struct device_node *dn)
>> +{
>> +	unsigned int ioapic_id;
>> +	const __be32 *cell;
>> +	int len;
>> +	struct resource r;
>> +	int ret;
>> +
>> +	cell = of_get_property(dn, "id", &len);
>> +	if (!cell) {
>> +		printk(KERN_ERR "Node %s is missing id property.\n",
>> +				dn->full_name);
>> +		return;
>> +	}
>> +	ioapic_id = of_read_ulong(cell, len / 4);
> 
> This looks like poor usage practise for the device tree.  'id' or any
> kind of enumeration property in a device tree node is strongly
> discouraged.  As much as possible, let Linux dynamically enumerate
> devices rather than trying to explicitly specify the numbering.  Since
> you can explicitly describe the relationship between device nodes in
> the tree, you should find that explicitly specifying numbers is almost
> never required.

Good point. I removed the id property and let linux statically enumerate
it. I don't see any relationship and spec. says only to keep it unique.

Sebastian
