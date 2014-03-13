From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 4/4] irqchip: sun4i: Use
 handle_fasteoi_late_irq for the ENMI (irq 0)
Date: Thu, 13 Mar 2014 15:46:26 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1403131542060.18573@ionos.tec.linutronix.de>
References: <1394644627-12315-1-git-send-email-hdegoede@redhat.com> <1394644627-12315-5-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDAMN6NI5EERBPMJQ6MQKGQEYGRMXNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1394644627-12315-5-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 12 Mar 2014, Hans de Goede wrote:

> The ENMI needs to have the ack done *after* clearing the interrupt source,
> otherwise we will get a spurious interrupt for each real interrupt. Switch
> to the new handle_fasteoi_late_irq handler which gives us the desired behavior.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/irqchip/irq-sun4i.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
> index 8a2fbee..4b1c874 100644
> --- a/drivers/irqchip/irq-sun4i.c
> +++ b/drivers/irqchip/irq-sun4i.c
> @@ -77,15 +77,22 @@ static void sun4i_irq_unmask(struct irq_data *irqd)
>  static struct irq_chip sun4i_irq_chip = {
>  	.name		= "sun4i_irq",
>  	.irq_ack	= sun4i_irq_ack,
> +	.irq_eoi	= sun4i_irq_ack, /* For the ENMI */
>  	.irq_mask	= sun4i_irq_mask,
>  	.irq_unmask	= sun4i_irq_unmask,
> +	.flags		= IRQCHIP_EOI_THREADED, /* Only affects the ENMI */

That's not really true. The flags affect all interrupts which share
that chip.

>  };
>  
>  static int sun4i_irq_map(struct irq_domain *d, unsigned int virq,
>  			 irq_hw_number_t hw)
>  {
> -	irq_set_chip_and_handler(virq, &sun4i_irq_chip,
> -				 handle_level_irq);
> +	if (hw == 0) /* IRQ 0, the ENMI needs special handling */
> +		irq_set_chip_and_handler(virq, &sun4i_irq_chip,
> +					 handle_fasteoi_late_irq);
> +	else
> +		irq_set_chip_and_handler(virq, &sun4i_irq_chip,
> +					 handle_level_irq);

I wonder what happens when you use the fasteoi handler for all of
them.

Thanks,

	tglx
