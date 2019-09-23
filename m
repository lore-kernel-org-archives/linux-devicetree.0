From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 5/5] irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
Date: Mon, 23 Sep 2019 08:08:16 -0700
Message-ID: <59d705bc-0fda-e6e3-9234-fba7158853a7@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-6-f.fainelli@gmail.com> <20190922133805.2cdf2d99@why>
 <260e61b8-a083-743e-43fc-70b9ea644e0e@gmail.com>
 <fbc07e1e-8c72-8728-2acb-647db533e31b@kernel.org>
 <8b0f18ef-7b72-e6fd-9930-0f698ced270b@gmail.com>
 <7610ea17-de8a-d475-7a9e-8f314f5f34a3@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7610ea17-de8a-d475-7a9e-8f314f5f34a3@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 9/23/2019 7:57 AM, Marc Zyngier wrote:
> On 23/09/2019 15:39, Florian Fainelli wrote:
>>
>>
>> On 9/23/2019 1:52 AM, Marc Zyngier wrote:
>>> On 22/09/2019 20:08, Florian Fainelli wrote:
>>>>
>>>>
>>>> On 9/22/2019 5:38 AM, Marc Zyngier wrote:
>>>>> On Fri, 13 Sep 2019 12:15:42 -0700
>>>>> Florian Fainelli <f.fainelli@gmail.com> wrote:
>>>>>
>>>>>> On some specific chips like 7211 we need to leave some interrupts
>>>>>> untouched/forwarded to the VPU which is another agent in the system
>>>>>> making use of that interrupt controller hardware (goes to both ARM GIC
>>>>>> and VPU L1 interrupt controller). Make that possible by using the
>>>>>> existing brcm,int-fwd-mask property.
>>>>>>
>>>>>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>>> ---
>>>>>>  drivers/irqchip/irq-bcm7038-l1.c | 15 +++++++++++++--
>>>>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
>>>>>> index 0673a44bbdc2..811a34201dd4 100644
>>>>>> --- a/drivers/irqchip/irq-bcm7038-l1.c
>>>>>> +++ b/drivers/irqchip/irq-bcm7038-l1.c
>>>>>> @@ -44,6 +44,7 @@ struct bcm7038_l1_chip {
>>>>>>  	struct list_head	list;
>>>>>>  	u32			wake_mask[MAX_WORDS];
>>>>>>  #endif
>>>>>> +	u32			irq_fwd_mask[MAX_WORDS];
>>>>>>  	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
>>>>>>  };
>>>>>>  
>>>>>> @@ -265,6 +266,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>>>>  	resource_size_t sz;
>>>>>>  	struct bcm7038_l1_cpu *cpu;
>>>>>>  	unsigned int i, n_words, parent_irq;
>>>>>> +	int ret;
>>>>>>  
>>>>>>  	if (of_address_to_resource(dn, idx, &res))
>>>>>>  		return -EINVAL;
>>>>>> @@ -278,6 +280,14 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>>>>  	else if (intc->n_words != n_words)
>>>>>>  		return -EINVAL;
>>>>>>  
>>>>>> +	ret = of_property_read_u32_array(dn , "brcm,int-fwd-mask",
>>>>>
>>>>> What is the exact meaning of "fwd"? Forward? FirmWare Dementia?
>>>>
>>>> Here it is meant to be "forward", we have defined this property name
>>>> before for irq-bcm7120-l2.c and felt like reusing the same name to avoid
>>>> multiplying properties would be appropriate, see patch #4. If you prefer
>>>> something named brcm,firmware-configured-mask, let me know.
>>>
>>> It's just a name, but I found it a bit confusing. Bah, never mind.
>>>
>>>>>
>>>>>> +					 intc->irq_fwd_mask, n_words);
>>>>>> +	if (ret != 0 && ret != -EINVAL) {
>>>>>> +		/* property exists but has the wrong number of words */
>>>>>> +		pr_err("invalid brcm,int-fwd-mask property\n");
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>>  	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
>>>>>>  					GFP_KERNEL);
>>>>>>  	if (!cpu)
>>>>>> @@ -288,8 +298,9 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
>>>>>>  		return -ENOMEM;
>>>>>>  
>>>>>>  	for (i = 0; i < n_words; i++) {
>>>>>> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
>>>>>> -		cpu->mask_cache[i] = 0xffffffff;
>>>>>> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
>>>>>> +			  cpu->map_base + reg_mask_set(intc, i));
>>>>>> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
>>>>>
>>>>> I seem to remember that (0xffffffff & whatever) == whatever, as long as
>>>>> 'whatever' is a 32bit quantity. So what it this for?
>>>>
>>>> It is 0xffff_ffff & ~whatever here.
>>>
>>> Which doesn't change anything.
>>>
>>>> In the absence of this property
>>>> being specified, the data is all zeroed out, so we would have
>>>> 0xffff_ffff & 0xffff_ffff which is 0xffff_ffff. If this property is
>>>> specified, we would have one more or bits set, and it would be e.g.:
>>>> 0x100 so we would have 0xffff_ffff & ~(0x100) = 0xffff_feff which is
>>>> what we would want here to preserve whatever the firmware has already
>>>> configured.
>>>
>>> OK, I must be stupid:
>>>
>>> #include <stdio.h>
>>>
>>> int main(int argc, char *argv[])
>>> {
>>> 	unsigned int v = 0x100;
>>> 	printf ("%x\n", ~v);
>>> }
>>> maz@filthy-habit$ ./x
>>> fffffeff
>>>
>>> You might as well OR it with zeroes, if you want.
>>
>> Not sure I understand your point here.
>>
>> We used to write 0xffff_ffff to both the hardware and the mask cache to
>> have all interrupts masked by default. Now we want to have some bits
>> optionally set to 0 (unmasked), based on the brcm,int-fwd-mask property,
>> which is what this patch achieves (or tries to). If we write, say
>> 0xffff_feff to the hardware, which has a Write Only register behavior,
>> then we also want to have the mask cache be set to the same value for
>> consistency if nothing else. Am I failing at doing what I just described
>> and also failing at see it?
> 
> You write this:
> 
>>  	for (i = 0; i < n_words; i++) {
>> -		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
>> -		cpu->mask_cache[i] = 0xffffffff;
>> +		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
>> +			  cpu->map_base + reg_mask_set(intc, i));
>> +		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
>>  	}
> 
> And I'm saying that this is strictly equivalent to:
> 
>  	for (i = 0; i < n_words; i++) {
> 		l1_writel(~intc->irq_fwd_mask[i],
> 			  cpu->map_base + reg_mask_set(intc, i));
> 		cpu->mask_cache[i] = ~intc->irq_fwd_mask[i];
>  	}
> 
> without this 0xffffffff that does exactly nothing (I'm pretty sure the
> compiler drops it anyway).

I understand quickly, you just need to repeat many times, thanks for
bearing with me, this is indeed simpler and clearer.
-- 
Florian
