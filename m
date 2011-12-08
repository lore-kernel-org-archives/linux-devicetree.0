From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] irqdomain: protect macro variable in domain iterators
Date: Thu, 08 Dec 2011 10:37:45 +0100
Message-ID: <4EE08569.3070009@atmel.com>
References: <1322833997-32083-1-git-send-email-nicolas.ferre@atmel.com>
 <1322832609-24956-1-git-send-email-nicolas.ferre@atmel.com>
 <20111202134458.GD2892@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111202134458.GD2892-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/02/2011 02:44 PM, Dave Martin :
> On Fri, Dec 02, 2011 at 02:30:09PM +0100, Nicolas Ferre wrote:
>> Signed-off-by: Nicolas Ferre<nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>
> Looks OK to me:
>
> Acked-by: Dave Martin<dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Rob,

Do you want a different implementation for this. I think it is the 
simplest way to write this macro...

If it is ok for you, it will be interesting to include this patch 
quickly so that I will be able to queue my own patches on top of it.
(Cc: stable can be a good idea also).

Best regards,

>> ---
>> v2: add brackets to each macro variable.
>>
>>   include/linux/irqdomain.h |   10 ++++++----
>>   1 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
>> index bd4272b..e535063 100644
>> --- a/include/linux/irqdomain.h
>> +++ b/include/linux/irqdomain.h
>> @@ -82,12 +82,14 @@ static inline unsigned int irq_domain_to_irq(struct irq_domain *d,
>>   }
>>
>>   #define irq_domain_for_each_hwirq(d, hw) \
>> -	for (hw = d->hwirq_base; hw<  d->hwirq_base + d->nr_irq; hw++)
>> +	for ((hw) = (d)->hwirq_base; \
>> +	     (hw)<  (d)->hwirq_base + (d)->nr_irq; \
>> +	     (hw)++)
>>
>>   #define irq_domain_for_each_irq(d, hw, irq) \
>> -	for (hw = d->hwirq_base, irq = irq_domain_to_irq(d, hw); \
>> -	     hw<  d->hwirq_base + d->nr_irq; \
>> -	     hw++, irq = irq_domain_to_irq(d, hw))
>> +	for ((hw) = (d)->hwirq_base, (irq) = irq_domain_to_irq((d), (hw)); \
>> +	     (hw)<  (d)->hwirq_base + (d)->nr_irq; \
>> +	     (hw)++, (irq) = irq_domain_to_irq((d), (hw)))
>>
>>   extern void irq_domain_add(struct irq_domain *domain);
>>   extern void irq_domain_del(struct irq_domain *domain);
>> --
>> 1.7.5.4
>>
>


-- 
Nicolas Ferre
