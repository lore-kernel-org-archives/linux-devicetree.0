From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/10] irqchip: versatile-fpga: add pass-thru enable support
Date: Tue, 20 May 2014 16:09:29 -0500
Message-ID: <1400620176-7239-4-git-send-email-robherring2@gmail.com>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400620176-7239-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Set the PIC_ENABLES register when the passthru-mask property is present.
This enables interrupts on the secondary controller to be passed thru
directly to the primary controller.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index 3ae2bb8..328440b 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -26,6 +26,8 @@
 #define FIQ_ENABLE_SET		0x28
 #define FIQ_ENABLE_CLEAR	0x2C
 
+#define PIC_ENABLES             0x20	/* set interrupt pass through bits */
+
 /**
  * struct fpga_irq_data - irq data container for the FPGA IRQ controller
  * @base: memory offset in virtual memory
@@ -185,6 +187,7 @@ int __init fpga_irq_of_init(struct device_node *node,
 	void __iomem *base;
 	u32 clear_mask;
 	u32 valid_mask;
+	u32 passthru_mask;
 	int parent_irq;
 
 	if (WARN_ON(!node))
@@ -209,6 +212,9 @@ int __init fpga_irq_of_init(struct device_node *node,
 	writel(clear_mask, base + IRQ_ENABLE_CLEAR);
 	writel(clear_mask, base + FIQ_ENABLE_CLEAR);
 
+	if (!of_property_read_u32(node, "passthru-mask", &passthru_mask))
+		writel(passthru_mask, base + PIC_ENABLES);
+
 	return 0;
 }
 #endif
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
