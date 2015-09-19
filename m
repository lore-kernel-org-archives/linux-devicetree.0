From: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Subject: [PATCH 1/2] MIPS: ath79: set missing irq ack handler for ar7100-misc-intc irq chip
Date: Sat, 19 Sep 2015 06:26:19 +0200
Message-ID: <1442636780-2891-2-git-send-email-lynxis@fe80.eu>
References: <1442636780-2891-1-git-send-email-lynxis@fe80.eu>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442636780-2891-1-git-send-email-lynxis-qyMx1GtpvWw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The irq ack handler was forgotten while introducing OF support.
Only ar71xx and ar933x based devices require it.

Signed-off-by: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Acked-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 arch/mips/ath79/irq.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ath79/irq.c b/arch/mips/ath79/irq.c
index afb0096..c9c0124 100644
--- a/arch/mips/ath79/irq.c
+++ b/arch/mips/ath79/irq.c
@@ -308,8 +308,16 @@ static int __init ath79_misc_intc_of_init(
 
 	return 0;
 }
-IRQCHIP_DECLARE(ath79_misc_intc, "qca,ar7100-misc-intc",
-		ath79_misc_intc_of_init);
+
+static int __init ar7100_misc_intc_of_init(
+	struct device_node *node, struct device_node *parent)
+{
+	ath79_misc_irq_chip.irq_mask_ack = ar71xx_misc_irq_mask;
+	return ath79_misc_intc_of_init(node, parent);
+}
+
+IRQCHIP_DECLARE(ar7100_misc_intc, "qca,ar7100-misc-intc",
+		ar7100_misc_intc_of_init);
 
 static int __init ar79_cpu_intc_of_init(
 	struct device_node *node, struct device_node *parent)
-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
