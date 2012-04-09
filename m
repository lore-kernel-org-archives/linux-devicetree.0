From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: [PATCH] irq/irq_domain: Quit ignoring error returns from irq_alloc_desc_from().
Date: Mon, 09 Apr 2012 09:56:30 -0700
Message-ID: <4F8314BE.9090708@gmail.com>
References: <1333669933-25267-1-git-send-email-ddaney.cavm@gmail.com> <20120407012616.62D133E17B2@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120407012616.62D133E17B2@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Daney <ddaney.cavm@gmail.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/06/2012 06:26 PM, Grant Likely wrote:
> On Thu,  5 Apr 2012 16:52:13 -0700, David Daney<ddaney.cavm@gmail.com>  wrote:
>> From: David Daney<david.daney@cavium.com>
>>
>> In commit 4bbdd45a (irq_domain/powerpc: eliminate irq_map; use
>> irq_alloc_desc() instead) code was added that ignores error returns
>> from irq_alloc_desc_from() by (silently) casting the return value to
>> unsigned.  The negitive value error return now suddenly looks like a
>> valid irq number.
>>
>> Commits cc79ca69 (irq_domain: Move irq_domain code from powerpc to
>> kernel/irq) and 1bc04f2c (irq_domain: Add support for base irq and
>> hwirq in legacy mappings) move this code to its current location in
>> irqdomain.c
>>
>> The result of all of this is a null pointer dereference OOPS if one of
>> the error cases is hit.
>>
>> The fix: Don't cast away the negativeness of the return value and then
>> check for errors.
>>
>> Signed-off-by: David Daney<david.daney@cavium.com>
>> ---
>>   kernel/irq/irqdomain.c |   11 ++++++-----
>>   1 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>> index af48e59..9d3e3ae 100644
>> --- a/kernel/irq/irqdomain.c
>> +++ b/kernel/irq/irqdomain.c
>> @@ -351,6 +351,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>>   				irq_hw_number_t hwirq)
>>   {
>>   	unsigned int virq, hint;
>> +	int irq;
>
> Merged, but I've dropped the new variable in favour of making virq an
> int.  Makes for a smaller diffstat.
>

Thanks Grant,

I had thought about that too, but since virq throughout all the rest of 
the code is unsigned, I didn't want to introduce an inconsistency.

After a little more thought, I think that the domain of virq and the irq 
used by the rest of the kernel are the same, so it might make sense to 
change virq to be int universally, and use the kernel convention that 
negative numbers indicate error conditions.  But that would be a much 
larger patch.

David Daney



> g.
>
>>
>>   	pr_debug("irq: irq_create_mapping(0x%p, 0x%lx)\n", domain, hwirq);
>>
>> @@ -380,14 +381,14 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>>   	hint = hwirq % irq_virq_count;
>>   	if (hint == 0)
>>   		hint++;
>> -	virq = irq_alloc_desc_from(hint, 0);
>> -	if (!virq)
>> -		virq = irq_alloc_desc_from(1, 0);
>> -	if (!virq) {
>> +	irq = irq_alloc_desc_from(hint, 0);
>> +	if (irq<= 0)
>> +		irq = irq_alloc_desc_from(1, 0);
>> +	if (irq<= 0) {
>>   		pr_debug("irq: ->  virq allocation failed\n");
>>   		return 0;
>>   	}
>> -
>> +	virq = irq;
>>   	if (irq_setup_virq(domain, virq, hwirq)) {
>>   		if (domain->revmap_type != IRQ_DOMAIN_MAP_LEGACY)
>>   			irq_free_desc(virq);
>> --
>> 1.7.2.3
>>
>
