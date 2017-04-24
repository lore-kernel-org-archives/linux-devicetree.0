From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 03/10] irqchip/sunxi-nmi: add support for the
 NMI in A64 R_INTC
Date: Tue, 25 Apr 2017 00:00:56 +0800
Message-ID: <20170424160103.9447-4-icenowy@aosc.io>
References: <20170424160103.9447-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBHGD7DDQKGQEKLFCXFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170424160103.9447-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for the newly imported compatible for the A64 R_INTC in
irq-sunxi-nmi driver

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
New patch in v4, which is part of NMI refactor.

 drivers/irqchip/irq-sunxi-nmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index 668730c5cb66..5f7408b1cd4d 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -56,6 +56,12 @@ static struct sunxi_sc_nmi_reg_offs sun9i_reg_offs = {
 	.enable	= 0x04,
 };
 
+static struct sunxi_sc_nmi_reg_offs sun50i_reg_offs = {
+	.ctrl	= 0x0c,
+	.pend	= 0x10,
+	.enable	= 0x40,
+};
+
 static inline void sunxi_sc_nmi_write(struct irq_chip_generic *gc, u32 off,
 				      u32 val)
 {
@@ -220,3 +226,10 @@ static int __init sun9i_nmi_irq_init(struct device_node *node,
 	return sunxi_sc_nmi_irq_init(node, &sun9i_reg_offs);
 }
 IRQCHIP_DECLARE(sun9i_nmi, "allwinner,sun9i-a80-nmi", sun9i_nmi_irq_init);
+
+static int __init sun50i_nmi_irq_init(struct device_node *node,
+				     struct device_node *parent)
+{
+	return sunxi_sc_nmi_irq_init(node, &sun50i_reg_offs);
+}
+IRQCHIP_DECLARE(sun50i_nmi, "allwinner,sun50i-a80-nmi", sun50i_nmi_irq_init);
-- 
2.12.2
