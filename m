From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] irq/irq_domain: Quit ignoring error returns from
 irq_alloc_desc_from().
Date: Fri, 06 Apr 2012 09:37:49 -0700
Message-ID: <4F7F1BDD.4070205@gmail.com>
References: <1333669933-25267-1-git-send-email-ddaney.cavm@gmail.com>
 <4F7E64E4.3080509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F7E64E4.3080509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob,

What the he*%? ...


On 04/05/2012 08:37 PM, Rob Herring wrote:
> On 04/05/2012 06:52 PM, David Daney wrote:
>> From: David Daney<david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
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

That would be commits:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commitdiff;h=4bbdd45afdae208a7c4ade89cf602f89a6397cff
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commitdiff;h=cc79ca691c292e9fd44f589c7940b9654e22f2f6
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commitdiff;h=1bc04f2cf8c2a1feadbd994f50c40bb145bf2989

>> irqdomain.c
>>
>> The result of all of this is a null pointer dereference OOPS if one of
>> the error cases is hit.
>>
>> The fix: Don't cast away the negativeness of the return value and then
>> check for errors.
>>
>> Signed-off-by: David Daney<david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
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
>>
>>   	pr_debug("irq: irq_create_mapping(0x%p, 0x%lx)\n", domain, hwirq);
>>
>> @@ -380,14 +381,14 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
>>   	hint = hwirq % irq_virq_count;
>>   	if (hint == 0)
>>   		hint++;
>> -	virq = irq_alloc_desc_from(hint, 0);
>
> You are not looking at mainline. hint was removed in later versions, and
> the referenced commit ids don't exist.

Please look at Linus' tree before making incorrect statements about 
whether or not code exists on the 'mainline'

The current kernel.org tree contains the bug and will cause anything 
using irq_create_mapping() to crash in a semi-random manner.

David Daney

>
> Rob
>
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
>
>
