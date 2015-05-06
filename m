From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 08/10] mtd: brcsmtb_nand_soc: add iProc support
Date: Wed,  6 May 2015 10:59:52 -0700
Message-ID: <1430935194-7579-9-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Dan Ehrenberg <dehrenberg@chromium.org>, Gregory Fong <gregory.0xf0@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Ray Jui <rjui@broadcom.com>

Signed-off-by: Ray Jui <rjui@broadcom.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmstb_nand_soc.c | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/mtd/nand/brcmstb_nand_soc.c b/drivers/mtd/nand/brcmstb_nand_soc.c
index c878334edb1a..5fb851c655f2 100644
--- a/drivers/mtd/nand/brcmstb_nand_soc.c
+++ b/drivers/mtd/nand/brcmstb_nand_soc.c
@@ -93,11 +93,121 @@ static const struct brcmnand_soc_ofdata bcm63138_nand_soc = {
 	.ctlrdy_set_enabled	= bcm63138_nand_intc_set,
 };
 
+struct iproc_nand_soc_priv {
+	void __iomem *idm_base;
+	void __iomem *ext_base;
+	spinlock_t idm_lock;
+};
+
+#define IPROC_NAND_CTLR_READY_OFFSET       0x10
+#define IPROC_NAND_CTLR_READY              BIT(0)
+
+#define IPROC_NAND_IO_CTRL_OFFSET          0x00
+#define IPROC_NAND_APB_LE_MODE             BIT(24)
+#define IPROC_NAND_INT_CTRL_READ_ENABLE    BIT(6)
+
+static bool iproc_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct iproc_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->ext_base + IPROC_NAND_CTLR_READY_OFFSET;
+	u32 val = __raw_readl(mmio);
+
+	if (val & IPROC_NAND_CTLR_READY) {
+		__raw_writel(IPROC_NAND_CTLR_READY, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void iproc_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct iproc_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->idm_base + IPROC_NAND_IO_CTRL_OFFSET;
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->idm_lock, flags);
+
+	val = __raw_readl(mmio);
+
+	if (en)
+		val |= IPROC_NAND_INT_CTRL_READ_ENABLE;
+	else
+		val &= ~IPROC_NAND_INT_CTRL_READ_ENABLE;
+
+	__raw_writel(val, mmio);
+
+	spin_unlock_irqrestore(&priv->idm_lock, flags);
+}
+
+static int iproc_nand_soc_init(struct brcmnand_soc *soc)
+{
+	struct iproc_nand_soc_priv *priv;
+
+	priv = devm_kzalloc(soc->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->idm_lock);
+
+	priv->idm_base = of_io_request_and_map(soc->dn, 0, DRV_NAME);
+	if (IS_ERR(priv->idm_base))
+		return PTR_ERR(priv->idm_base);
+
+	priv->ext_base = of_io_request_and_map(soc->dn, 1, DRV_NAME);
+	if (IS_ERR(priv->ext_base)) {
+		struct resource res;
+
+		of_address_to_resource(soc->dn, 0, &res);
+		release_mem_region(res.start, resource_size(&res));
+		iounmap(priv->idm_base);
+		return PTR_ERR(priv->ext_base);
+	}
+
+	soc->priv = priv;
+	iproc_nand_intc_ack(soc);
+
+	return 0;
+}
+
+static void iproc_nand_apb_access(struct brcmnand_soc *soc, bool prepare)
+{
+	struct iproc_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->idm_base + IPROC_NAND_IO_CTRL_OFFSET;
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->idm_lock, flags);
+
+	val = __raw_readl(mmio);
+
+	if (prepare)
+		val |= IPROC_NAND_APB_LE_MODE;
+	else
+		val &= ~IPROC_NAND_APB_LE_MODE;
+
+	__raw_writel(val, mmio);
+
+	spin_unlock_irqrestore(&priv->idm_lock, flags);
+}
+
+static const struct brcmnand_soc_ofdata iproc_nand_soc = {
+	.init			= iproc_nand_soc_init,
+	.ctlrdy_ack		= iproc_nand_intc_ack,
+	.ctlrdy_set_enabled	= iproc_nand_intc_set,
+	.prepare_data_bus	= iproc_nand_apb_access,
+};
+
 static const struct of_device_id brcmnand_soc_ofmatch[] = {
 	{
 		.compatible	= "brcm,nand-soc-bcm63138",
 		.data		= &bcm63138_nand_soc,
 	},
+	{
+		.compatible	= "brcm,nand-soc-iproc",
+		.data		= &iproc_nand_soc,
+	},
 	{},
 };
 
-- 
1.9.1
