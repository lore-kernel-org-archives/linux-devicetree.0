From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 15/16] MIPS: GIC: Use local interrupts for timer
Date: Fri, 5 Sep 2014 21:08:57 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1409052108090.5472@nanos>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org> <1409938218-9026-16-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409938218-9026-16-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 5 Sep 2014, Andrew Bresticker wrote:

> Instead of using GIC interrupt 0 for the timer (which was not even
> handled correctly by the GIC irqchip code and could conflict with an
> actual external interrupt), use the designated local interrupt for
> the GIC timer.
> 
> Also, since the timer is a per-CPU interrupt, initialize it with
> setup_percpu_irq() and enable it with enable_percpu_irq() instead
> of using direct register writes.
> 
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> No changes from v1.
> ---
>  arch/mips/kernel/cevt-gic.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/mips/kernel/cevt-gic.c b/arch/mips/kernel/cevt-gic.c
> index 6093716..cae72a4 100644
> --- a/arch/mips/kernel/cevt-gic.c
> +++ b/arch/mips/kernel/cevt-gic.c
> @@ -68,7 +68,7 @@ int gic_clockevent_init(void)
>  	if (!cpu_has_counter || !gic_frequency)
>  		return -ENXIO;
>  
> -	irq = MIPS_GIC_IRQ_BASE;
> +	irq = MIPS_GIC_LOCAL_IRQ_BASE + GIC_LOCAL_INTR_COMPARE;
>  
>  	cd = &per_cpu(gic_clockevent_device, cpu);
>  
> @@ -91,15 +91,13 @@ int gic_clockevent_init(void)
>  
>  	clockevents_register_device(cd);
>  
> -	GICWRITE(GIC_REG(VPE_LOCAL, GIC_VPE_COMPARE_MAP), 0x80000002);
> -	GICWRITE(GIC_REG(VPE_LOCAL, GIC_VPE_SMASK), GIC_VPE_SMASK_CMP_MSK);
> +	if (!gic_timer_irq_installed) {
> +		setup_percpu_irq(irq, &gic_compare_irqaction);
> +		irq_set_handler(irq, handle_percpu_irq);
> +		gic_timer_irq_installed = 1;
> +	}
>  
> -	if (gic_timer_irq_installed)
> -		return 0;
> +	enable_percpu_irq(irq, 0);

Please use a proper IRQ_TYPE constant instead of 0

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
