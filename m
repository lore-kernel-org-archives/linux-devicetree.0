From: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Subject: [PATCH 2/2] MIPS: ath79: add irq chip ar7240-misc-intc
Date: Sat, 19 Sep 2015 06:26:20 +0200
Message-ID: <1442636780-2891-3-git-send-email-lynxis@fe80.eu>
References: <1442636780-2891-1-git-send-email-lynxis@fe80.eu>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442636780-2891-1-git-send-email-lynxis-qyMx1GtpvWw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ar7240 misc irq chip use ack handler
instead of ack_mask handler. All new ath79 chips use
the ar7240 misc irq chip

Signed-off-by: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Acked-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 .../interrupt-controller/qca,ath79-misc-intc.txt     | 20 ++++++++++++++++++--
 arch/mips/ath79/irq.c                                | 10 ++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
index 391717a..ec96b1f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ath79-misc-intc.txt
@@ -4,8 +4,8 @@ The MISC interrupt controller is a secondary controller for lower priority
 interrupt.
 
 Required Properties:
-- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-misc-intc"
-  as fallback
+- compatible: has to be "qca,<soctype>-cpu-intc", "qca,ar7100-misc-intc" or
+  "qca,<soctype>-cpu-intc", "qca,ar7240-misc-intc"
 - reg: Base address and size of the controllers memory area
 - interrupt-parent: phandle of the parent interrupt controller.
 - interrupts: Interrupt specifier for the controllers interrupt.
@@ -13,6 +13,9 @@ Required Properties:
 - #interrupt-cells : Specifies the number of cells needed to encode interrupt
 		     source, should be 1
 
+Compatible fallback depends on the SoC. Use ar7100 for ar71xx and ar913x,
+use ar7240 for all other SoCs.
+
 Please refer to interrupts.txt in this directory for details of the common
 Interrupt Controllers bindings used by client devices.
 
@@ -28,3 +31,16 @@ Example:
 		interrupt-controller;
 		#interrupt-cells = <1>;
 	};
+
+Another example:
+
+	interrupt-controller@18060010 {
+		compatible = "qca,ar9331-misc-intc", qca,ar7240-misc-intc";
+		reg = <0x18060010 0x4>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
diff --git a/arch/mips/ath79/irq.c b/arch/mips/ath79/irq.c
index c9c0124..fd58f8b 100644
--- a/arch/mips/ath79/irq.c
+++ b/arch/mips/ath79/irq.c
@@ -319,6 +319,16 @@ static int __init ar7100_misc_intc_of_init(
 IRQCHIP_DECLARE(ar7100_misc_intc, "qca,ar7100-misc-intc",
 		ar7100_misc_intc_of_init);
 
+static int __init ar7240_misc_intc_of_init(
+	struct device_node *node, struct device_node *parent)
+{
+	ath79_misc_irq_chip.irq_ack = ar724x_misc_irq_ack;
+	return ath79_misc_intc_of_init(node, parent);
+}
+
+IRQCHIP_DECLARE(ar7240_misc_intc, "qca,ar7240-misc-intc",
+		ar7240_misc_intc_of_init);
+
 static int __init ar79_cpu_intc_of_init(
 	struct device_node *node, struct device_node *parent)
 {
-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
