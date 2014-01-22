From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Wed, 22 Jan 2014 19:12:38 -0300
Message-ID: <20140122221237.GA30763@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140121233537.GS18269@obsidianresearch.com>
 <20140122164904.GB27273@localhost>
 <20140122173417.GT18269@obsidianresearch.com>
 <52E02AB6.7040104@gmail.com>
 <20140122205213.GW18269@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140122205213.GW18269-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 22, 2014 at 01:52:13PM -0700, Jason Gunthorpe wrote:
> > Clearing BRIDGE_CAUSE will only clear all currently pending upstrea=
m
> > IRQs, of course. If WDT IRQ will be re-raised right after that in
> > BRIDGE_CAUSE depends on the actual HW implementation, i.e. we do no
> > clear the causing IRQ itself but just what it raised in BRIDGE_CAUS=
E.
>=20
> Which is why it makes no sense to clear it one time at kernel start.
>=20

So, it seems we need to handle irq_startup(), as you suggested.
I've just tested the attached patch, and it's working fine: the driver'=
s
probe() fully stops the watchdog, and then request_irq() acks and
pending interrupts, through the added irq_startup().

How does it look?

diff --git a/drivers/irqchip/irq-orion.c b/drivers/irqchip/irq-orion.c
index e51d400..91a3955 100644
--- a/drivers/irqchip/irq-orion.c
+++ b/drivers/irqchip/irq-orion.c
@@ -108,6 +108,16 @@ IRQCHIP_DECLARE(orion_intc, "marvell,orion-intc", =
orion_irq_init);
 #define ORION_BRIDGE_IRQ_CAUSE	0x00
 #define ORION_BRIDGE_IRQ_MASK	0x04
=20
+static unsigned int orion_bridge_irq_startup(struct irq_data *data)
+{
+	/* Ack pending interrupts */
+	data->chip->irq_ack(data);
+
+	/* Unmask the interrupt */
+	data->chip->irq_unmask(data);
+	return 0;
+}
+
 static void orion_bridge_irq_handler(unsigned int irq, struct irq_desc=
 *desc)
 {
 	struct irq_domain *d =3D irq_get_handler_data(irq);
@@ -176,6 +186,7 @@ static int __init orion_bridge_irq_init(struct devi=
ce_node *np,
=20
 	gc->chip_types[0].regs.ack =3D ORION_BRIDGE_IRQ_CAUSE;
 	gc->chip_types[0].regs.mask =3D ORION_BRIDGE_IRQ_MASK;
+	gc->chip_types[0].chip.irq_startup =3D orion_bridge_irq_startup;
 	gc->chip_types[0].chip.irq_ack =3D irq_gc_ack_clr_bit;
 	gc->chip_types[0].chip.irq_mask =3D irq_gc_mask_clr_bit;
 	gc->chip_types[0].chip.irq_unmask =3D irq_gc_mask_set_bit;


--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
