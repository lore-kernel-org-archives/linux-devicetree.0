From: David Daney <david.s.daney@gmail.com>
Subject: Re: [PATCH v6 4/5] MIPS: Octeon: Setup irq_domains for interrupts.
Date: Sat, 03 Mar 2012 21:41:16 -0800
Message-ID: <4F53007C.2030106@gmail.com>
References: <1330563422-14078-1-git-send-email-ddaney.cavm@gmail.com> <1330563422-14078-5-git-send-email-ddaney.cavm@gmail.com> <4F50D7C2.7080204@gmail.com> <4F510B8E.3070201@cavium.com> <4F52733F.4030807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F52733F.4030807@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: David Daney <david.daney@cavium.com>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/03/2012 11:38 AM, Rob Herring wrote:
> On 03/02/2012 12:03 PM, David Daney wrote:
>> +
>> +    irqd = irq_get_irq_data(irq);
>> +    irqd->hwirq = line<<   6 | bit;
>> +    irqd->domain = domain;
>>> I think the domain code will set these.
>> It is my understanding that the domain code only does this for:
>>
>> o irq_domain_add_legacy()
>>
>> o irq_create_direct_mapping()
>>
>> o irq_create_mapping()
>>
>> We use none of those.  So I do it here.
>>
>> If there is a better way, I am open to suggestions.
> How do you convert local h/w irq controller numbers in the dts to linux
> irq #'s?

With the calls to octeon_irq_set_ciu_mapping() ...

  [...]
>>>> +    octeon_irq_set_ciu_mapping(OCTEON_IRQ_PEM0, 1, 48,
>>>> +                   ciu_domain, chip, handle_level_irq);
>>>> +    octeon_irq_set_ciu_mapping(OCTEON_IRQ_PEM1, 1, 49,
>>>> +                   ciu_domain, chip, handle_level_irq);
>>>> +    octeon_irq_set_ciu_mapping(OCTEON_IRQ_SRIO0, 1, 50,
>>>> +                   ciu_domain, chip, handle_level_irq);
>>>> +    octeon_irq_set_ciu_mapping(OCTEON_IRQ_SRIO1, 1, 51,
>>>> +                   ciu_domain, chip, handle_level_irq);
>>>> +    octeon_irq_set_ciu_mapping(OCTEON_IRQ_LMC0, 1, 52,
>>>> +                   ciu_domain, chip, handle_level_irq);
>>>> +    octeon_irq_set_ciu_mapping(OCTEON_IRQ_DFM, 1, 56,
>>>> +                   ciu_domain, chip, handle_level_irq);
>>>> +    octeon_irq_set_ciu_mapping(OCTEON_IRQ_RST, 1, 63,
>>>> +                   ciu_domain, chip, handle_level_irq);
>>>>

>>>> [...]
>>> edge vs. level should be driven by dts.
>>>
>> We may have to disagree on this point.  Because:
>>
>> 1) edge vs. level can be accurately probed, as we do here.
> Looks like you are just hard coding it here. Where do you read something
> that tells you the interrupt is level or edge?

We probe for the type of interrupt controller by reading the SOC 
identifier number, although we can get the same information from the dts.

Once we know the type of interrupt controller, the level vs. edge is 
known a priori, and that knowlege is encoded in all these 
octeon_irq_set_ciu_mapping() calls.

And on top of this...

>> 2) The dts doesn't contain the information.
>>

So it is kind of a moot point.

It is not some sort of generic interrupt controller that can be 
configured in different ways, each line has certain properties endowed 
upon it by the chip designers, and once a line is assigned a particular 
configuration, it is never changed in future generations.

For external devices attached to the GPIO interrupt lines, things are 
different, we can only know the triggering via the dts, and lo and 
behold... it is there and we use it.


David Daney
