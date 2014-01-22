From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Wed, 22 Jan 2014 13:49:05 -0300
Message-ID: <20140122164904.GB27273@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140121233537.GS18269@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140121233537.GS18269-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 04:35:37PM -0700, Jason Gunthorpe wrote:
> On Tue, Jan 21, 2014 at 06:12:32AM -0300, Ezequiel Garcia wrote:
> > After adding the IRQ request, the BRIDGE_CAUSE bit should be cleare=
d by the
> > bridge interrupt controller. There's no longer a need to do it in t=
he watchdog
> > driver, so we can simply remove it.
>=20
> When we talked about this before I pointed out that sequence here is
> important:
>=20
> - Disable WDT
> - Clear bridge
> - Enable WDT
>=20

Sure, I wrote this series with that in mind and made some tests to
ensure that no spurious trigger was possible.

> Looking at this patch in isolation it looks to me like the clear
> bridge lines should be replaced with a request_irq (as that does the
> clear) - is the request_irq in the wrong spot?
>=20

=46irst of all, it seems to me that the first item "Disable WDT" is not
currently true on this driver. orion_wdt_start() seem to reset the
counter, but doesn't clear the WDT_EN bit. Do you think we should
enforce a "true" disable?

As an example, s3c2410wdt calls stop() from start(). Maybe we should
do something like it?

Regarding the sequence. Let me see if I got this problem right. The
concern here is about the bootloader leaving the registers in a
weird-state, right?

In that case, I thought that requesting the IRQ at probe time was enoug=
h
to ensure the BRIDGE_CAUSE would be cleared by the time the watchdog is
started. However, after reading through the irqchip code again, I'm no =
longer
sure this is the case.

It looks like the BRIDGE_CAUSE register is cleared when the interruptio=
n
is acked (which happens in the handler if I understood the code right).
So requesting the IRQ is useless...

I'll trace the code to confirm this.

Sebastian: If the above is correct, do you think we can add a cause cle=
ar to
the orion irqchip? (supposing it's harmful) Something like this:

diff --git a/drivers/irqchip/irq-orion.c b/drivers/irqchip/irq-orion.c
index e51d400..fef9171 100644
--- a/drivers/irqchip/irq-orion.c
+++ b/drivers/irqchip/irq-orion.c
@@ -180,6 +180,9 @@ static int __init orion_bridge_irq_init(struct devi=
ce_node *np,
 	gc->chip_types[0].chip.irq_mask =3D irq_gc_mask_clr_bit;
 	gc->chip_types[0].chip.irq_unmask =3D irq_gc_mask_set_bit;
=20
+	/* clear pending interrupts */
+	writel(0, gc->reg_base + ORION_BRIDGE_IRQ_CAUSE);
+
 	/* mask all interrupts */
 	writel(0, gc->reg_base + ORION_BRIDGE_IRQ_MASK);
=20
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
