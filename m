From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 4/4] irqchip: sun4i: Use
 handle_fasteoi_late_irq for the ENMI (irq 0)
Date: Thu, 13 Mar 2014 17:27:21 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1403131725230.18573@ionos.tec.linutronix.de>
References: <1394644627-12315-1-git-send-email-hdegoede@redhat.com> <1394644627-12315-5-git-send-email-hdegoede@redhat.com> <alpine.DEB.2.02.1403131542060.18573@ionos.tec.linutronix.de> <5321CB12.3090704@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDAMN6NI5EERBZFYQ6MQKGQEV6BKGAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5321CB12.3090704-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 13 Mar 2014, Hans de Goede wrote:
> On 03/13/2014 03:46 PM, Thomas Gleixner wrote:
> >>  static int sun4i_irq_map(struct irq_domain *d, unsigned int virq,
> >>  			 irq_hw_number_t hw)
> >>  {
> >> -	irq_set_chip_and_handler(virq, &sun4i_irq_chip,
> >> -				 handle_level_irq);
> >> +	if (hw == 0) /* IRQ 0, the ENMI needs special handling */
> >> +		irq_set_chip_and_handler(virq, &sun4i_irq_chip,
> >> +					 handle_fasteoi_late_irq);
> >> +	else
> >> +		irq_set_chip_and_handler(virq, &sun4i_irq_chip,
> >> +					 handle_level_irq);
> > 
> > I wonder what happens when you use the fasteoi handler for all of
> > them.
> 
> As mentioned in my previous mail doing an ack (or an eio) seems to
> be unnecessary for all but IRQ 0.
> 
> I do wonder if handle_level_irq is the right handle*irq function
> to use in this case, since this is strictly used in the non smp
> case I think that the mask / unmask done by handle_level_irq is
> not necessary for non threaded handlers. So what would be the
> correct handle*irq function to use in this case ?
> 
> Note the irqs are level irqs. IOW they may stay asserted while
> the handler runs because of the handler and a new irq raising.

Right. You could be creative and use fasteoi plus an empty eoi
callback in the chip for irq 1-N. That way you only mask and unmask in
the threaded case.

Thanks,

	tglx
