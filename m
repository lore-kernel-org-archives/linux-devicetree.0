From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 03/10] irqchip: sunxi-nmi: Reorder sunxi_sc_nmi_reg_offs' in ascending order
Date: Tue,  6 Jun 2017 13:59:25 +0800
Message-ID: <20170606055932.22548-4-wens@csie.org>
References: <20170606055932.22548-1-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606055932.22548-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

This is a pure code move to reorder the various sunxi_sc_nmi_reg_offs'
by family and alphabetical order. No functionality changes.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/irqchip/irq-sunxi-nmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index 9a7f6971cc3a..76f2431b6b7b 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -52,18 +52,18 @@ struct sunxi_sc_nmi_reg_offs {
 	u32 enable;
 };
 
-static struct sunxi_sc_nmi_reg_offs sun7i_reg_offs = {
-	.ctrl	= SUN7I_NMI_CTRL,
-	.pend	= SUN7I_NMI_PENDING,
-	.enable	= SUN7I_NMI_ENABLE,
-};
-
 static struct sunxi_sc_nmi_reg_offs sun6i_reg_offs = {
 	.ctrl	= SUN6I_NMI_CTRL,
 	.pend	= SUN6I_NMI_PENDING,
 	.enable	= SUN6I_NMI_ENABLE,
 };
 
+static struct sunxi_sc_nmi_reg_offs sun7i_reg_offs = {
+	.ctrl	= SUN7I_NMI_CTRL,
+	.pend	= SUN7I_NMI_PENDING,
+	.enable	= SUN7I_NMI_ENABLE,
+};
+
 static struct sunxi_sc_nmi_reg_offs sun9i_reg_offs = {
 	.ctrl	= SUN9I_NMI_CTRL,
 	.pend	= SUN9I_NMI_PENDING,
-- 
2.11.0
