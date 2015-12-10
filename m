From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/6] pinctrl: meson: enable support for external GPIO interrupts
Date: Thu, 10 Dec 2015 18:31:25 +0100
Message-ID: <CACRpkdZ+kmyRKR9RwcLzAXWsUDGVniAhoidEp-kbwhoVEDhPvQ@mail.gmail.com>
References: <1448987062-31225-1-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448987062-31225-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Daniel Drake <drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 1, 2015 at 5:24 PM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:

> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> In Meson SoCs we have 8 independent GPIO interrupts that can be programmed to
> use any of the GPIOs in the chip as interrupt source.
>
> These GPIOs are managed by GIC but they can be conditioned (and enabled) by
> some registers external to the GIC.
>
> GPIOs |--[mux1 or mux2]--[polarity]--[filter]--[edge_select]--> GIC
>
> Changelog:
>
> * V2:
>     - Introduced .irq_request_resources() and .irq_release_resources()
>     - s/virq/irq/ and s/pin/hwirq/
>     - Moved to the new irq_fwspec
>
> * V3:
>     - EXPORT_SYMBOL_GPL for of_irq_find_parent()
>     - split GPIO management and irqchip side
>     - the GIC IRQs list is not kept as set of fwspecs. it's now a regular
>       integer array.
>     - irq_of_phandle_args_to_fwspec discarded

I don't know where this patch set is standing but I get the impression that it
still needs revising so waiting for a v4.

Given the complex nature of the IRQs I will probably want Marc to provide
his Review/ACK before applying.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
