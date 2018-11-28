From: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 06/17] irqchip/sun4i: Move IC specific
 register offsets to struct
Date: Thu, 29 Nov 2018 01:33:16 +0300
Message-ID: <d84fa2e506cc91e64edae4a4dfd0680b2989a980.1543443475.git.mesihkilinc@gmail.com>
References: <cover.1543443475.git.mesihkilinc@gmail.com>
Reply-To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDI4VHO5SYLBB3VP7TPQKGQE62PM4XA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1543443475.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch moves IC specific register offsets to sun4i_irq_chip_data
struct in order to support different chips.

Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
 drivers/irqchip/irq-sun4i.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
index 0c32506..507f4e3 100644
--- a/drivers/irqchip/irq-sun4i.c
+++ b/drivers/irqchip/irq-sun4i.c
@@ -28,12 +28,16 @@
 #define SUN4I_IRQ_NMI_CTRL_REG		0x0c
 #define SUN4I_IRQ_PENDING_REG(x)	(0x10 + 0x4 * x)
 #define SUN4I_IRQ_FIQ_PENDING_REG(x)	(0x20 + 0x4 * x)
-#define SUN4I_IRQ_ENABLE_REG(x)		(0x40 + 0x4 * x)
-#define SUN4I_IRQ_MASK_REG(x)		(0x50 + 0x4 * x)
+#define SUN4I_IRQ_ENABLE_REG(data, x)	((data)->enable_reg_offset + 0x4 * x)
+#define SUN4I_IRQ_MASK_REG(data, x)	((data)->mask_reg_offset + 0x4 * x)
+#define SUN4I_IRQ_ENABLE_REG_OFFSET	0x40
+#define SUN4I_IRQ_MASK_REG_OFFSET	0x50
 
 struct sun4i_irq_chip_data {
 	void __iomem *irq_base;
 	struct irq_domain *irq_domain;
+	u32 enable_reg_offset;
+	u32 mask_reg_offset;
 };
 
 static struct sun4i_irq_chip_data *irq_ic_data;
@@ -57,9 +61,10 @@ static void sun4i_irq_mask(struct irq_data *irqd)
 	int reg = irq / 32;
 	u32 val;
 
-	val = readl(irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
+	val = readl(irq_ic_data->irq_base +
+			SUN4I_IRQ_ENABLE_REG(irq_ic_data, reg));
 	writel(val & ~(1 << irq_off),
-	       irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
+	       irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(irq_ic_data, reg));
 }
 
 static void sun4i_irq_unmask(struct irq_data *irqd)
@@ -69,9 +74,10 @@ static void sun4i_irq_unmask(struct irq_data *irqd)
 	int reg = irq / 32;
 	u32 val;
 
-	val = readl(irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
+	val = readl(irq_ic_data->irq_base +
+			SUN4I_IRQ_ENABLE_REG(irq_ic_data, reg));
 	writel(val | (1 << irq_off),
-	       irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(reg));
+	       irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(irq_ic_data, reg));
 }
 
 static struct irq_chip sun4i_irq_chip = {
@@ -105,20 +111,23 @@ static int __init sun4i_of_init(struct device_node *node,
 		return -ENOMEM;
 	}
 
+	irq_ic_data->enable_reg_offset = SUN4I_IRQ_ENABLE_REG_OFFSET;
+	irq_ic_data->mask_reg_offset = SUN4I_IRQ_MASK_REG_OFFSET;
+
 	irq_ic_data->irq_base = of_iomap(node, 0);
 	if (!irq_ic_data->irq_base)
 		panic("%pOF: unable to map IC registers\n",
 			node);
 
 	/* Disable all interrupts */
-	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(0));
-	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(1));
-	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(2));
+	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(irq_ic_data, 0));
+	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(irq_ic_data, 1));
+	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_ENABLE_REG(irq_ic_data, 2));
 
 	/* Unmask all the interrupts, ENABLE_REG(x) is used for masking */
-	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(0));
-	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(1));
-	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(2));
+	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(irq_ic_data, 0));
+	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(irq_ic_data, 1));
+	writel(0, irq_ic_data->irq_base + SUN4I_IRQ_MASK_REG(irq_ic_data, 2));
 
 	/* Clear all the pending interrupts */
 	writel(0xffffffff, irq_ic_data->irq_base + SUN4I_IRQ_PENDING_REG(0));
-- 
2.7.4
