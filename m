From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH (v4) 2/11] MIPS: bmips: Add bcm6345-l2-timer interrupt
 controller
Date: Fri, 27 Nov 2015 09:37:54 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1511270926580.3572@nanos>
References: <5650BFD6.5030700@simon.arlott.org.uk> <CAOiHx=k0Aa+qrBT1J7_cQaQRxndBmwsgSgi3x0eJOYTAy6Zq7Q@mail.gmail.com> <5653612A.4050309@simon.arlott.org.uk> <565361AF.20400@simon.arlott.org.uk> <70d031ae4c3aa29888d77b64686c39e7e7eaae92@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5654E67A.9060800@gmail.com> <5657886F.3090908@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5657886F.3090908-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Simon,

On Thu, 26 Nov 2015, Simon Arlott wrote:
> +static inline u32 bcm6345_timer_read_int_status(struct bcm6345_timer *timer)
> +{
> +	if (timer->interrupt_bits == 32)
> +		return __raw_readl(timer->base + timer->regs[TIMER_INT_STATUS]);
> +	else
> +		return __raw_readb(timer->base + timer->regs[TIMER_INT_STATUS]);
> +}

Instead of having that pile of conditionals you could just define two
functions and have a function pointer in struct bcm6345_timer which
you initialize at init time.

> +static inline void bcm6345_timer_write_control(struct bcm6345_timer *timer,
> +	unsigned int id, u32 val)
> +{
> +	if (id >= timer->nr_timers) {
> +		WARN(1, "%s: %d >= %d", __func__, id, timer->nr_timers);

This is more than silly. You call that form the init function via:

	for (i = 0; i < timer->nr_timers; i++)

Hmm?

> +static void bcm6345_timer_unmask(struct irq_data *d)
> +{
> +	struct bcm6345_timer *timer = irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +	u8 val;
> +
> +	if (d->hwirq < timer->nr_timers) {

Again. You can have two different interrupt chips without that
completely undocumented and non obvious conditional.

BTW, how are those simple interrupts masked at all?

> +		raw_spin_lock_irqsave(&timer->lock, flags);
> +		val = bcm6345_timer_read_int_enable(timer);
> +		val |= BIT(d->hwirq);
> +		bcm6345_timer_write_int_enable(timer, val);
> +		raw_spin_unlock_irqrestore(&timer->lock, flags);
> +	}
> +}

> +	raw_spin_lock_init(&timer->lock);
> +	timer->regs = regs;
> +	timer->interrupt_bits = interrupt_bits;
> +	timer->nr_timers = nr_timers;
> +	timer->nr_interrupts = nr_timers + 1;

What is that extra interrupt about? For the casual reader this looks
like a bug ... Comments exist for a reason.

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
