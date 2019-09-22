From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 5/5] irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
Date: Sun, 22 Sep 2019 12:08:10 -0700
Message-ID: <260e61b8-a083-743e-43fc-70b9ea644e0e@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-6-f.fainelli@gmail.com> <20190922133805.2cdf2d99@why>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190922133805.2cdf2d99@why>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 9/22/2019 5:38 AM, Marc Zyngier wrote:
> On Fri, 13 Sep 2019 12:15:42 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> On some specific chips like 7211 we need to leave some interrupts
>> untouched/forwarded to the VPU which is another agent in the system
>> making use of that interrupt controller hardware (goes to both ARM GIC
>> and VPU L1 interrupt controller). Make that possible by using the
>> existing brcm,int-fwd-mask property.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/irqchip/irq-bcm7038-l1.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
>> index 0673a44bbdc2..811a34201dd4 100644
>> --- a/drivers/irqchip/irq-bcm7038-l1.c
>> +++ b/drivers/irqchip/irq-bcm7038-l1.c
>> @@ -44,6 +44,7 @@ struct bcm7038_l1_chip {
>>  	struct list_head	list;
>>  	u32			wake_mask[MAX_WORDS];
>>  #endif
>> +	u32			irq_fwd_mask[MAX_WORDS];
>>  	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
>>  };
>>  
>> @@ -265,6 +266,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>  	resource_size_t sz;
>>  	struct bcm7038_l1_cpu *cpu;
>>  	unsigned int i, n_words, parent_irq;
>> +	int ret;
>>  
>>  	if (of_address_to_resource(dn, idx, &res))
>>  		return -EINVAL;
>> @@ -278,6 +280,14 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>  	else if (intc->n_words != n_words)
>>  		return -EINVAL;
>>  
>> +	ret = of_property_read_u32_array(dn , "brcm,int-fwd-mask",
> 
> What is the exact meaning of "fwd"? Forward? FirmWare Dementia?

Here it is meant to be "forward", we have defined this property name
before for irq-bcm7120-l2.c and felt like reusing the same name to avoid
multiplying properties would be appropriate, see patch #4. If you prefer
something named brcm,firmware-configured-mask, let me know.

> 
>> +					 intc->irq_fwd_mask, n_words);
>> +	if (ret != 0 && ret != -EINVAL) {
>> +		/* property exists but has the wrong number of words */
>> +		pr_err("invalid brcm,int-fwd-mask property\n");
>> +		return -EINVAL;
>> +	}
>> +
>>  	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
>>  					GFP_KERNEL);
>>  	if (!cpu)
>> @@ -288,8 +298,9 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>  		return -ENOMEM;
>>  
>>  	for (i = 0; i < n_words; i++) {
>> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
>> -		cpu->mask_cache[i] = 0xffffffff;
>> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
>> +			  cpu->map_base + reg_mask_set(intc, i));
>> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
> 
> I seem to remember that (0xffffffff & whatever) == whatever, as long as
> 'whatever' is a 32bit quantity. So what it this for?

It is 0xffff_ffff & ~whatever here. In the absence of this property
being specified, the data is all zeroed out, so we would have
0xffff_ffff & 0xffff_ffff which is 0xffff_ffff. If this property is
specified, we would have one more or bits set, and it would be e.g.:
0x100 so we would have 0xffff_ffff & ~(0x100) = 0xffff_feff which is
what we would want here to preserve whatever the firmware has already
configured. In hindsight, it may be safer to make sure no one in Linux
can actually map that interrupt, so we would need something like this in
addition to what we already have in this patch:

diff --git a/drivers/irqchip/irq-bcm7038-l1.c
b/drivers/irqchip/irq-bcm7038-l1.c
index fc75c61233aa..558e74be0d60 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -300,6 +300,14 @@ static struct irq_chip bcm7038_l1_irq_chip = {
 static int bcm7038_l1_map(struct irq_domain *d, unsigned int virq,
                          irq_hw_number_t hw_irq)
 {
+       struct bcm7038_l1_chip *intc = d->host_data;
+       int i;
+
+       for (i = 0; i < intc->n_words; i++) {
+               if (intc->irq_fwd_mask[i] & BIT(hw_irq))
+                       return -EINVAL;
+       }
+
        irq_set_chip_and_handler(virq, &bcm7038_l1_irq_chip,
handle_level_irq);
        irq_set_chip_data(virq, d->host_data);
        irqd_set_single_target(irq_desc_get_irq_data(irq_to_desc(virq)));
-- 
Florian
