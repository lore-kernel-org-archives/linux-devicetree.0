From: David Daney <david.s.daney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 4/5] MIPS: Octeon: Setup irq_domains for interrupts.
Date: Sat, 03 Mar 2012 21:09:32 -0800
Message-ID: <4F52F90C.5060306@gmail.com>
References: <1330563422-14078-1-git-send-email-ddaney.cavm@gmail.com>
 <1330563422-14078-5-git-send-email-ddaney.cavm@gmail.com>
 <4F50D7C2.7080204@gmail.com> <4F510B8E.3070201@cavium.com>
 <20120302190744.571E03E1C63@localhost> <4F511FB0.5070901@cavium.com>
 <4F527285.1020500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F527285.1020500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/03/2012 11:35 AM, Rob Herring wrote:
> On 03/02/2012 01:29 PM, David Daney wrote:
>> On 03/02/2012 11:07 AM, Grant Likely wrote:
>>> +static void __init octeon_irq_set_ciu_mapping(unsigned int irq,
>>> +                          unsigned int line,
>>> +                          unsigned int bit,
>>> +                          struct irq_domain *domain,
>>>                               struct irq_chip *chip,
>>>                               irq_flow_handler_t handler)
>>>     {
>>> +    struct irq_data *irqd;
>>>         union octeon_ciu_chip_data cd;
>>>
>>>         irq_set_chip_and_handler(irq, chip, handler);
>>> -
>>>         cd.l = 0;
>>>         cd.s.line = line;
>>>         cd.s.bit = bit;
>>>
>>>         irq_set_chip_data(irq, cd.p);
>>>         octeon_irq_ciu_to_irq[line][bit] = irq;
>>> +
>>> +    irqd = irq_get_irq_data(irq);
>>> +    irqd->hwirq = line<<    6 | bit;
>>> +    irqd->domain = domain;
>>>>> I think the domain code will set these.
>>>> It is my understanding that the domain code only does this for:
>>>>
>>>> o irq_domain_add_legacy()
>>>>
>>>> o irq_create_direct_mapping()
>>>>
>>>> o irq_create_mapping()
>>>>
>>>> We use none of those.  So I do it here.
>>>>
>>>> If there is a better way, I am open to suggestions.
>>> irq_create_mapping is called by irq_create_of_mapping() which is
>>> in turn called by irq_of_parse_and-map().  irq_domain always
>>> manages the hwirq and domain values.  Driver code cannot manipulate
>>> them manually.
>>>
>> I really must be missing something.
>>
>> Given:
>>
>> 1) I must have a mapping between hwirq and irq that I control so that
>> non-OF code using the OCTEON_IRQ_* constants continues to work.
> Those defines are what you need to work to get rid of.

We are not starting from a blank slate here.  There is a lot of in-tree 
code using these symbols.  We cannot make them disappear with wishful 
thinking.

The first step is a switch to irq_domains using the existing mappings.

After we do that, I have patches to transition some drivers to use the 
OF mapping via irq_domains.  After those are merged, we can work toward 
getting rid of OCTEON_IRQ_*.  But I think it must be the last step in 
the process, not the first.
>
>> 2) irq_create_mapping() will allocate a random irq value if none is
>> already assigned to the hwirq.
>>
>> Therefore: To avoid having random irq values assigned, I must manually
>> assign them.
>>
> So you should be using legacy domain if you need to maintain fixed hwirq
> to linux irq numbers. "linear" is a bit confusing as it doesn't mean
> linear 1:1 irq number assignment, but linear search.

My reading of Grant's code in linux-next directly contradicts this 
statement.  There is no code in irqdomain.c, that I can see, that allows 
me to have an arbitrary mapping of irq <--> hwirq values.


>
> Ultimately, for DT boot you should use of_irq_init to scan the dts, and
> then create a linear domain for each interrupt controller node. You may
> need to decide on linear vs. legacy at runtime based on having a DT node
> pointer or not.

Perhaps, but we need to take the first step before gradually arriving at 
some Ultimate Solution.

We will also need to handle irq controllers with 2^20 sparsely populated 
hwirq values, so linear domains will probably be out of the question there.

David Daney
