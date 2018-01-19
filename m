From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [RFC PATCH 3/9] irqchip/sun4i: add support for suniv
 interrupt controller
Date: Sat, 20 Jan 2018 07:17:29 +0800
Message-ID: <20180119231735.61504-4-icenowy@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBQHZRHJQKGQEETXPPHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180119231735.61504-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The new F-series SoCs (suniv) from Allwinner use an stripped version of
the interrupt controller in A10/A13.

Add support for it in irq-sun4i driver.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/irqchip/irq-sun4i.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
index e3e5b9132b75..64ae41379802 100644
--- a/drivers/irqchip/irq-sun4i.c
+++ b/drivers/irqchip/irq-sun4i.c
@@ -23,13 +23,26 @@
 
 #include <asm/exception.h>
 
+enum sun4i_irq_type {
+	sun4i_ic,
+	suniv_ic
+};
+
+static enum sun4i_irq_type sun4i_irq_type;
+static int sun4i_irq_enable_reg_offset;
+static int sun4i_irq_mask_reg_offset;
+
 #define SUN4I_IRQ_VECTOR_REG		0x00
 #define SUN4I_IRQ_PROTECTION_REG	0x08
 #define SUN4I_IRQ_NMI_CTRL_REG		0x0c
 #define SUN4I_IRQ_PENDING_REG(x)	(0x10 + 0x4 * x)
 #define SUN4I_IRQ_FIQ_PENDING_REG(x)	(0x20 + 0x4 * x)
-#define SUN4I_IRQ_ENABLE_REG(x)		(0x40 + 0x4 * x)
-#define SUN4I_IRQ_MASK_REG(x)		(0x50 + 0x4 * x)
+#define SUN4I_IRQ_ENABLE_REG_OFFSET	0x40
+#define SUN4I_IRQ_MASK_REG_OFFSET	0x50
+#define SUNIV_IRQ_ENABLE_REG_OFFSET	0x20
+#define SUNIV_IRQ_MASK_REG_OFFSET	0x30
+#define SUN4I_IRQ_ENABLE_REG(x)		(sun4i_irq_enable_reg_offset + 0x4 * x)
+#define SUN4I_IRQ_MASK_REG(x)		(sun4i_irq_mask_reg_offset + 0x4 * x)
 
 static void __iomem *sun4i_irq_base;
 static struct irq_domain *sun4i_irq_domain;
@@ -115,8 +128,9 @@ static int __init sun4i_of_init(struct device_node *node,
 	writel(0xffffffff, sun4i_irq_base + SUN4I_IRQ_PENDING_REG(1));
 	writel(0xffffffff, sun4i_irq_base + SUN4I_IRQ_PENDING_REG(2));
 
-	/* Enable protection mode */
-	writel(0x01, sun4i_irq_base + SUN4I_IRQ_PROTECTION_REG);
+	/* Enable protection mode (not available in suniv) */
+	if (sun4i_irq_type == sun4i_ic)
+		writel(0x01, sun4i_irq_base + SUN4I_IRQ_PROTECTION_REG);
 
 	/* Configure the external interrupt source type */
 	writel(0x00, sun4i_irq_base + SUN4I_IRQ_NMI_CTRL_REG);
@@ -130,7 +144,26 @@ static int __init sun4i_of_init(struct device_node *node,
 
 	return 0;
 }
-IRQCHIP_DECLARE(allwinner_sun4i_ic, "allwinner,sun4i-a10-ic", sun4i_of_init);
+
+static int __init sun4i_ic_of_init(struct device_node *node,
+				   struct device_node *parent)
+{
+	sun4i_irq_type = sun4i_ic;
+	sun4i_irq_enable_reg_offset = SUN4I_IRQ_ENABLE_REG_OFFSET;
+	sun4i_irq_mask_reg_offset = SUN4I_IRQ_MASK_REG_OFFSET;
+	sun4i_of_init(node, parent);
+}
+IRQCHIP_DECLARE(allwinner_sun4i_ic, "allwinner,sun4i-a10-ic", sun4i_ic_of_init);
+
+static int __init suniv_ic_of_init(struct device_node *node,
+				   struct device_node *parent)
+{
+	sun4i_irq_type = suniv_ic;
+	sun4i_irq_enable_reg_offset = SUNIV_IRQ_ENABLE_REG_OFFSET;
+	sun4i_irq_mask_reg_offset = SUNIV_IRQ_MASK_REG_OFFSET;
+	sun4i_of_init(node, parent);
+}
+IRQCHIP_DECLARE(allwinner_suniv_ic, "allwinner,suniv-ic", suniv_ic_of_init);
 
 static void __exception_irq_entry sun4i_handle_irq(struct pt_regs *regs)
 {
-- 
2.14.2
