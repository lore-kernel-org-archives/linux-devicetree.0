From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 07/10] mtd: brcsmtb_nand_soc: add support for BCM63138
Date: Wed,  6 May 2015 10:59:51 -0700
Message-ID: <1430935194-7579-8-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

This SoC just has its custom interrupt status bits.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmstb_nand_soc.c | 69 +++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/mtd/nand/brcmstb_nand_soc.c b/drivers/mtd/nand/brcmstb_nand_soc.c
index 970912c690a7..c878334edb1a 100644
--- a/drivers/mtd/nand/brcmstb_nand_soc.c
+++ b/drivers/mtd/nand/brcmstb_nand_soc.c
@@ -28,7 +28,76 @@ struct brcmnand_soc_ofdata {
 	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
 };
 
+struct bcm63138_nand_soc_priv {
+	void __iomem *base;
+};
+
+#define BCM63138_NAND_INT_STATUS		0x00
+#define BCM63138_NAND_INT_EN			0x04
+
+enum {
+	BCM63138_CTLRDY		= BIT(4),
+};
+
+static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
+	u32 val = __raw_readl(mmio);
+
+	if (val & BCM63138_CTLRDY) {
+		__raw_writel(val & ~BCM63138_CTLRDY, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void bcm63138_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->base + BCM63138_NAND_INT_EN;
+	u32 val = __raw_readl(mmio);
+
+	if (en)
+		val |= BCM63138_CTLRDY;
+	else
+		val &= ~BCM63138_CTLRDY;
+
+	__raw_writel(val, mmio);
+}
+
+static int bcm63138_nand_soc_init(struct brcmnand_soc *soc)
+{
+	struct bcm63138_nand_soc_priv *priv;
+
+	priv = devm_kzalloc(soc->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = of_io_request_and_map(soc->dn, 0, DRV_NAME);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	soc->priv = priv;
+
+	/* Clear the interrupt */
+	bcm63138_nand_intc_ack(soc);
+
+	return 0;
+}
+
+static const struct brcmnand_soc_ofdata bcm63138_nand_soc = {
+	.init			= bcm63138_nand_soc_init,
+	.ctlrdy_ack		= bcm63138_nand_intc_ack,
+	.ctlrdy_set_enabled	= bcm63138_nand_intc_set,
+};
+
 static const struct of_device_id brcmnand_soc_ofmatch[] = {
+	{
+		.compatible	= "brcm,nand-soc-bcm63138",
+		.data		= &bcm63138_nand_soc,
+	},
 	{},
 };
 
-- 
1.9.1
