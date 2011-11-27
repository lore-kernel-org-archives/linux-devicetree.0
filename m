From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] irq: fix possible null-pointer deref irq_domain_to_irq
Date: Sun, 27 Nov 2011 09:11:01 -0600
Message-ID: <4ED25305.8080605@gmail.com>
References: <1320922383-15312-1-git-send-email-jamie@jamieiles.com>
 <20111110111446.GB16018@totoro> <4EBBD39C.9000400@gmail.com>
 <20111123122308.GA7382@totoro> <20111125153553.GB8866@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111125153553.GB8866@totoro>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jamie,

On 11/25/2011 09:35 AM, Jamie Iles wrote:
> Hi Rob,
> 
> On Wed, Nov 23, 2011 at 12:23:08PM +0000, Jamie Iles wrote:
>> On Thu, Nov 10, 2011 at 07:37:32AM -0600, Rob Herring wrote:
>>> On 11/10/2011 05:14 AM, Jamie Iles wrote:
>>>> On Thu, Nov 10, 2011 at 10:53:03AM +0000, Jamie Iles wrote:
>>>>> It is optional for an irqdomain to have a to_irq() method, and for
>>>>> simple domains they often don't require any operations at all - just
>>>>> hwirq to Linux irq translation.  Check we have valid ops before
>>>>> dereferencing them.
>>>>>
>>>>> Patch originally by Rob Herring.
>>>>>
>>>>> Suggested-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> Naturally git send-email doesn't know how to convert this into a CC, so 
>>>> Rob is now CC'd!
>>>>
>>>> Jamie
>>>>
>>>>> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>>>>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>>>> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
>>>>> ---
>>>>>
>>>>> Rob, I can't see that you've already posted this but I didn't want to
>>>>> hold Marc's GIC patches up.
>>>
>>> Thanks. I didn't get around to it yesterday.
>>>
>>> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> I've just noticed in kernel/irq/irqdomain.c, that the kerneldoc for 
>> irq_domain_add() says that a valid ops structure is required, so perhaps 
>> this fix isn't right and we should just have an empty ops structure for 
>> simple controllers...
> 
> I wonder if this might make more sense instead.  I'll post a proper 
> patch if you think so.
> 
> Regards,
> 
> Jamie
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 200ce83..92c3484 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -143,11 +143,6 @@ int irq_domain_simple_dt_translate(struct irq_domain *d,
>  	return 0;
>  }
>  
> -struct irq_domain_ops irq_domain_simple_ops = {
> -	.dt_translate = irq_domain_simple_dt_translate,
> -};
> -EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
> -
>  /**
>   * irq_domain_create_simple() - Set up a 'simple' translation range
>   */
> @@ -181,4 +176,11 @@ void irq_domain_generate_simple(const struct of_device_id *match,
>  		pr_info("no node found\n");
>  }
>  EXPORT_SYMBOL_GPL(irq_domain_generate_simple);
> +#else /* CONFIG_OF_IRQ */
> +#define irq_domain_simple_dt_translate NULL
>  #endif /* CONFIG_OF_IRQ */
> +
> +struct irq_domain_ops irq_domain_simple_ops = {
> +	.dt_translate = irq_domain_simple_dt_translate,

.dt_translate is surrounded by CONFIG_OF, so it will break on !CONFIG_OF.

> +};
> +EXPORT_SYMBOL_GPL(irq_domain_simple_ops);

The extern declaration in irqdomain.h is surrounded by CONFIG_OF_IRQ, so
it needs to be moved out of that as well.

On Sparc, CONFIG_OF is true, but CONFIG_OF_IRQ is false. So that
combination needs to be handled as well.

Rob
