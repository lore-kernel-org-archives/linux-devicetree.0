From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of/irq: improve error message on irq discovery process
 failure
Date: Wed, 9 Nov 2016 19:04:57 +0000
Message-ID: <20161109190457.GC837@leverpostej>
References: <1478700308-25481-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478700308-25481-1-git-send-email-gpiccoli-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Guilherme G. Piccoli" <gpiccoli-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 09, 2016 at 12:05:08PM -0200, Guilherme G. Piccoli wrote:
> On PowerPC machines some PCI slots might not have Level-triggered
> interrupts capability (also know as Level Signaled Interrupts - LSI),
> leading of_irq_parse_pci() to complain by presenting error messages
> on the kernel log - in this case, the properties "interrupt-map" and
> "interrupt-map-mask" are not present on the device's node on device
> tree.

If we don't have an interrupt-map on a PCI controller, why don't we
instead log a message regarding that being missing, and give up early?

That sounds like a more generically useful error message; it's also
possible that a DT author simply forgot to add the map, and the platform
has suitable interrupts wired up.

> This patch introduces a different message for this specific case,
> and it also reduces the level of the message from error to warning.
> Before this patch, when an adapter was plugged in a slot without Level
> interrupts capabilities, we saw generic error messages like this:
> 
>     [54.239] pci 002d:70:00.0: of_irq_parse_pci() failed with rc=-22
> 
> Now, with this applied, we see the following specific message:
> 
>     [19.947] pci 0014:60:00.0: of_irq_parse_pci() gave up. The slot of this
>     device has no Level-triggered Interrupts capability.

Following my above example, this has gone from opaque to potentially
misleading.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
