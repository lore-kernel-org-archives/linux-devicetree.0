From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/5] genirq: Allow the affinity of a percpu interrupt to
 be set/retrieved
Date: Thu, 19 May 2016 13:08:58 +0200
Message-ID: <CAMuHMdW_QNM0c+u-pj3w8TOhr4s40B+OwxUAoQwqPxKeRrU4ZQ@mail.gmail.com>
References: <1460365075-7316-1-git-send-email-marc.zyngier@arm.com>
	<1460365075-7316-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460365075-7316-3-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Mon, Apr 11, 2016 at 10:57 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> In order to prepare the genirq layer for the concept of partitionned
> percpu interrupts, let's allow an affinity to be associated with
> such an interrupt. We introduce:
>
> - irq_set_percpu_devid_partition: flag an interrupt as a percpu-devid
>   interrupt, and associate it with an affinity
> - irq_get_percpu_devid_partition: allow the affinity of that interrupt
>   to be retrieved.
>
> This will allow a driver to discover which CPUs the per-cpu interrupt
> can actually fire on.
>
> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>

> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -66,6 +66,7 @@ struct irq_desc {
>         int                     threads_handled_last;
>         raw_spinlock_t          lock;
>         struct cpumask          *percpu_enabled;
> +       const struct cpumask    *percpu_affinity;

Adding this field showed up on my bloat-o-meter radar...

Does it make sense to move it (and percpu_enabled) inside the "#ifdef
CONFIG_SMP" below, and rework the code to not need it on UP?

>  #ifdef CONFIG_SMP
>         const struct cpumask    *affinity_hint;
>         struct irq_affinity_notify *affinity_notify;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
