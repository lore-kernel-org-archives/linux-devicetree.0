From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/4] irq: Add a new IRQCHIP_EOI_THREADED flag
Date: Thu, 13 Mar 2014 19:17:43 +0100
Message-ID: <5321F647.1060506@redhat.com>
References: <1394733834-26839-1-git-send-email-hdegoede@redhat.com> <1394733834-26839-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBTPMQ6MQKGQEEDUYTOI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394733834-26839-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/13/2014 07:03 PM, Hans de Goede wrote:
> From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> This flag must be used in combination with handle_fasteoi_irq, when set
> handle_fasteoi_irq will delay the calling of chip->irq_eoi until the threaded
> handler has run.
> 
> Reviewed-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Tested-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Note: I just noticed that we should also update the comment above
kernel/irq/chip.c: cond_unmask_irq() to no longer mention its gets called
from handle_fasteoi_irq() as that is no longer true.

Regards,

Hans

> ---
>  include/linux/irq.h    |  3 +++
>  kernel/irq/chip.c      | 48 ++++++++++++++++++++++++++++++++++++++++--------
>  kernel/irq/internals.h |  1 +
>  kernel/irq/manage.c    |  2 +-
>  4 files changed, 45 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index 7dc1003..0f036fb 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -349,6 +349,8 @@ struct irq_chip {
>   * IRQCHIP_ONOFFLINE_ENABLED:	Only call irq_on/off_line callbacks
>   *				when irq enabled
>   * IRQCHIP_SKIP_SET_WAKE:	Skip chip.irq_set_wake(), for this irq chip
> + * IRQCHIP_ONESHOT_SAFE:	One shot does not require mask/unmask
> + * IRQCHIP_EOI_THREADED:	Chip requires eoi() on unmask in threaded mode
>   */
>  enum {
>  	IRQCHIP_SET_TYPE_MASKED		= (1 <<  0),
> @@ -357,6 +359,7 @@ enum {
>  	IRQCHIP_ONOFFLINE_ENABLED	= (1 <<  3),
>  	IRQCHIP_SKIP_SET_WAKE		= (1 <<  4),
>  	IRQCHIP_ONESHOT_SAFE		= (1 <<  5),
> +	IRQCHIP_EOI_THREADED		= (1 <<  6),
>  };
>  
>  /* This include will go away once we isolated irq_desc usage to core code */
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index dc04c16..6397df2 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -281,6 +281,19 @@ void unmask_irq(struct irq_desc *desc)
>  	}
>  }
>  
> +void unmask_threaded_irq(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = desc->irq_data.chip;
> +
> +	if (chip->flags & IRQCHIP_EOI_THREADED)
> +		chip->irq_eoi(&desc->irq_data);
> +
> +	if (chip->irq_unmask) {
> +		chip->irq_unmask(&desc->irq_data);
> +		irq_state_clr_masked(desc);
> +	}
> +}
> +
>  /*
>   *	handle_nested_irq - Handle a nested irq from a irq thread
>   *	@irq:	the interrupt number
> @@ -435,6 +448,27 @@ static inline void preflow_handler(struct irq_desc *desc)
>  static inline void preflow_handler(struct irq_desc *desc) { }
>  #endif
>  
> +static void cond_unmask_eoi_irq(struct irq_desc *desc, struct irq_chip *chip)
> +{
> +	if (!(desc->istate & IRQS_ONESHOT)) {
> +		chip->irq_eoi(&desc->irq_data);
> +		return;
> +	}
> +	/*
> +	 * We need to unmask in the following cases:
> +	 * - Oneshot irq which did not wake the thread (caused by a
> +	 *   spurious interrupt or a primary handler handling it
> +	 *   completely).
> +	 */
> +	if (!irqd_irq_disabled(&desc->irq_data) &&
> +	    irqd_irq_masked(&desc->irq_data) && !desc->threads_oneshot) {
> +		chip->irq_eoi(&desc->irq_data);
> +		unmask_irq(desc);
> +	} else if (!(chip->flags & IRQCHIP_EOI_THREADED)) {
> +		chip->irq_eoi(&desc->irq_data);
> +	}
> +}
> +
>  /**
>   *	handle_fasteoi_irq - irq handler for transparent controllers
>   *	@irq:	the interrupt number
> @@ -448,6 +482,8 @@ static inline void preflow_handler(struct irq_desc *desc) { }
>  void
>  handle_fasteoi_irq(unsigned int irq, struct irq_desc *desc)
>  {
> +	struct irq_chip *chip = desc->irq_data.chip;
> +
>  	raw_spin_lock(&desc->lock);
>  
>  	if (unlikely(irqd_irq_inprogress(&desc->irq_data)))
> @@ -473,18 +509,14 @@ handle_fasteoi_irq(unsigned int irq, struct irq_desc *desc)
>  	preflow_handler(desc);
>  	handle_irq_event(desc);
>  
> -	if (desc->istate & IRQS_ONESHOT)
> -		cond_unmask_irq(desc);
> +	cond_unmask_eoi_irq(desc, chip);
>  
> -out_eoi:
> -	desc->irq_data.chip->irq_eoi(&desc->irq_data);
> -out_unlock:
>  	raw_spin_unlock(&desc->lock);
>  	return;
>  out:
> -	if (!(desc->irq_data.chip->flags & IRQCHIP_EOI_IF_HANDLED))
> -		goto out_eoi;
> -	goto out_unlock;
> +	if (!(chip->flags & IRQCHIP_EOI_IF_HANDLED))
> +		chip->irq_eoi(&desc->irq_data);
> +	raw_spin_unlock(&desc->lock);
>  }
>  
>  /**
> diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
> index 001fa5b..e98bb56 100644
> --- a/kernel/irq/internals.h
> +++ b/kernel/irq/internals.h
> @@ -73,6 +73,7 @@ extern void irq_percpu_enable(struct irq_desc *desc, unsigned int cpu);
>  extern void irq_percpu_disable(struct irq_desc *desc, unsigned int cpu);
>  extern void mask_irq(struct irq_desc *desc);
>  extern void unmask_irq(struct irq_desc *desc);
> +extern void unmask_threaded_irq(struct irq_desc *desc);
>  
>  extern void init_kstat_irqs(struct irq_desc *desc, int node, int nr);
>  
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 481a13c..9147fef 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -718,7 +718,7 @@ again:
>  
>  	if (!desc->threads_oneshot && !irqd_irq_disabled(&desc->irq_data) &&
>  	    irqd_irq_masked(&desc->irq_data))
> -		unmask_irq(desc);
> +		unmask_threaded_irq(desc);
>  
>  out_unlock:
>  	raw_spin_unlock_irq(&desc->lock);
> 
