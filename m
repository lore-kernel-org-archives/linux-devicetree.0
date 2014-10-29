From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 09/11] irqchip: bcm7120-l2: Use gc->mask_cache to simplify
 suspend/resume functions
Date: Wed, 29 Oct 2014 09:55:18 -0700
Message-ID: <54511BF6.9060908@gmail.com>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <1414555138-6500-9-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414555138-6500-9-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/28/2014 08:58 PM, Kevin Cernekee wrote:
> The cached value already incorporates irq_fwd_mask, and was saved the
> last time an IRQ was enabled/disabled.
> 
> Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
>  drivers/irqchip/irq-bcm7120-l2.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
> index e9331f8..c76c9ad 100644
> --- a/drivers/irqchip/irq-bcm7120-l2.c
> +++ b/drivers/irqchip/irq-bcm7120-l2.c
> @@ -37,7 +37,6 @@ struct bcm7120_l2_intc_data {
>  	bool can_wake;
>  	u32 irq_fwd_mask;
>  	u32 irq_map_mask;
> -	u32 saved_mask;
>  };
>  
>  static void bcm7120_l2_intc_irq_handle(unsigned int irq, struct irq_desc *desc)
> @@ -62,14 +61,11 @@ static void bcm7120_l2_intc_suspend(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>  	struct bcm7120_l2_intc_data *b = gc->private;
> -	u32 reg;
>  
>  	irq_gc_lock(gc);
> -	/* Save the current mask and the interrupt forward mask */
> -	b->saved_mask = irq_reg_readl(b->base + IRQEN) | b->irq_fwd_mask;
>  	if (b->can_wake) {
> -		reg = b->saved_mask | gc->wake_active;
> -		irq_reg_writel(reg, b->base + IRQEN);
> +		irq_reg_writel(gc->mask_cache | gc->wake_active,
> +			       b->base + IRQEN);
>  	}
>  	irq_gc_unlock(gc);
>  }
> @@ -77,11 +73,10 @@ static void bcm7120_l2_intc_suspend(struct irq_data *d)
>  static void bcm7120_l2_intc_resume(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
> -	struct bcm7120_l2_intc_data *b = gc->private;
>  
>  	/* Restore the saved mask */
>  	irq_gc_lock(gc);
> -	irq_reg_writel(b->saved_mask, b->base + IRQEN);
> +	irq_reg_writel(gc->mask_cache, b->base + IRQEN);
>  	irq_gc_unlock(gc);
>  }
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
