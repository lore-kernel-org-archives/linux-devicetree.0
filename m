From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] irq: versatile-fpga: add OX820 compatible
Date: Fri,  9 Sep 2016 15:29:53 +0200
Message-ID: <20160909132953.15061-1-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to support the interrupt controler in the Oxford Semiconductor
OX820 SoC, add a new comatible string.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt           | 3 ++-
 drivers/irqchip/irq-versatile-fpga.c                                   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
index 2a1d16b..8bd124c2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
@@ -6,7 +6,8 @@ controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
 instance can handle up to 32 interrupts.
 
 Required properties:
-- compatible: "arm,versatile-fpga-irq" or "oxsemi,ox810se-rps-irq"
+- compatible: "arm,versatile-fpga-irq", "oxsemi,ox810se-rps-irq" or
+		"oxsemi,ox820-rps-irq"
 - interrupt-controller: Identifies the node as an interrupt controller
 - #interrupt-cells: The number of cells to define the interrupts.  Must be 1
   as the FPGA IRQ controller has no configuration options for interrupt
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index 37dd464..da0e6d6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -228,4 +228,5 @@ int __init fpga_irq_of_init(struct device_node *node,
 IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
 IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
 IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
+IRQCHIP_DECLARE(ox820_rps, "oxsemi,ox820-rps-irq", fpga_irq_of_init);
 #endif
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
