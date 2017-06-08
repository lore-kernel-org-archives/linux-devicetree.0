From: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/2] phy: Add stingray SATA phy support
Date: Thu,  8 Jun 2017 17:01:39 +0530
Message-ID: <1496921499-2808-3-git-send-email-srinath.mannam@broadcom.com>
References: <1496921499-2808-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496921499-2808-1-git-send-email-srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for stingray SATA phy in the
SATA BRCM phy driver.

Signed-off-by: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 73 ++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index ccbc3d9..e6544c8 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -46,6 +46,7 @@ enum brcm_sata_phy_version {
 	BRCM_SATA_PHY_STB_40NM,
 	BRCM_SATA_PHY_IPROC_NS2,
 	BRCM_SATA_PHY_IPROC_NSP,
+	BRCM_SATA_PHY_IPROC_SR,
 };
 
 struct brcm_sata_port {
@@ -81,12 +82,17 @@ enum sata_phy_regs {
 	PLL_ACTRL2				= 0x8b,
 	PLL_ACTRL2_SELDIV_MASK			= 0x1f,
 	PLL_ACTRL2_SELDIV_SHIFT			= 9,
+	PLL_ACTRL6				= 0x86,
 
 	PLL1_REG_BANK				= 0x060,
 	PLL1_ACTRL2				= 0x82,
 	PLL1_ACTRL3				= 0x83,
 	PLL1_ACTRL4				= 0x84,
 
+	TX_REG_BANK				= 0x070,
+	TX_ACTRL0				= 0x80,
+	TX_ACTRL0_TXPOL_FLIP			= BIT(6),
+
 	OOB_REG_BANK				= 0x150,
 	OOB1_REG_BANK				= 0x160,
 	OOB_CTRL1				= 0x80,
@@ -347,6 +353,68 @@ static int brcm_nsp_sata_init(struct brcm_sata_port *port)
 	return 0;
 }
 
+/* SR PHY PLL0 registers */
+#define SR_PLL0_ACTRL6_MAGIC			0xa
+
+/* SR PHY PLL1 registers */
+#define SR_PLL1_ACTRL2_MAGIC			0x32
+#define SR_PLL1_ACTRL3_MAGIC			0x2
+#define SR_PLL1_ACTRL4_MAGIC			0x3e8
+
+static int brcm_sr_sata_init(struct brcm_sata_port *port)
+{
+	struct brcm_sata_phy *priv = port->phy_priv;
+	struct device *dev = port->phy_priv->dev;
+	void __iomem *base = priv->phy_base;
+	unsigned int val, try;
+
+	/* Configure PHY PLL register bank 1 */
+	val = SR_PLL1_ACTRL2_MAGIC;
+	brcm_sata_phy_wr(base, PLL1_REG_BANK, PLL1_ACTRL2, 0x0, val);
+	val = SR_PLL1_ACTRL3_MAGIC;
+	brcm_sata_phy_wr(base, PLL1_REG_BANK, PLL1_ACTRL3, 0x0, val);
+	val = SR_PLL1_ACTRL4_MAGIC;
+	brcm_sata_phy_wr(base, PLL1_REG_BANK, PLL1_ACTRL4, 0x0, val);
+
+	/* Configure PHY PLL register bank 0 */
+	val = SR_PLL0_ACTRL6_MAGIC;
+	brcm_sata_phy_wr(base, PLL_REG_BANK_0, PLL_ACTRL6, 0x0, val);
+
+	/* Wait for PHY PLL lock by polling pll_lock bit */
+	try = 50;
+	do {
+		val = brcm_sata_phy_rd(base, BLOCK0_REG_BANK,
+					BLOCK0_XGXSSTATUS);
+		if (val & BLOCK0_XGXSSTATUS_PLL_LOCK)
+			break;
+		msleep(20);
+		try--;
+	} while (try);
+
+	if ((val & BLOCK0_XGXSSTATUS_PLL_LOCK) == 0) {
+		/* PLL did not lock; give up */
+		dev_err(dev, "port%d PLL did not lock\n", port->portnum);
+		return -ETIMEDOUT;
+	}
+
+	/* Invert Tx polarity */
+	brcm_sata_phy_wr(base, TX_REG_BANK, TX_ACTRL0,
+			 ~TX_ACTRL0_TXPOL_FLIP, TX_ACTRL0_TXPOL_FLIP);
+
+	/* Configure OOB control to handle 100MHz reference clock */
+	val = ((0xc << OOB_CTRL1_BURST_MAX_SHIFT) |
+		(0x4 << OOB_CTRL1_BURST_MIN_SHIFT) |
+		(0x8 << OOB_CTRL1_WAKE_IDLE_MAX_SHIFT) |
+		(0x3 << OOB_CTRL1_WAKE_IDLE_MIN_SHIFT));
+	brcm_sata_phy_wr(base, OOB_REG_BANK, OOB_CTRL1, 0x0, val);
+	val = ((0x1b << OOB_CTRL2_RESET_IDLE_MAX_SHIFT) |
+		(0x2 << OOB_CTRL2_BURST_CNT_SHIFT) |
+		(0x9 << OOB_CTRL2_RESET_IDLE_MIN_SHIFT));
+	brcm_sata_phy_wr(base, OOB_REG_BANK, OOB_CTRL2, 0x0, val);
+
+	return 0;
+}
+
 static int brcm_sata_phy_init(struct phy *phy)
 {
 	int rc;
@@ -363,6 +431,9 @@ static int brcm_sata_phy_init(struct phy *phy)
 	case BRCM_SATA_PHY_IPROC_NSP:
 		rc = brcm_nsp_sata_init(port);
 		break;
+	case BRCM_SATA_PHY_IPROC_SR:
+		rc = brcm_sr_sata_init(port);
+		break;
 	default:
 		rc = -ENODEV;
 	}
@@ -384,6 +455,8 @@ static const struct of_device_id brcm_sata_phy_of_match[] = {
 	  .data = (void *)BRCM_SATA_PHY_IPROC_NS2 },
 	{ .compatible = "brcm,iproc-nsp-sata-phy",
 	  .data = (void *)BRCM_SATA_PHY_IPROC_NSP },
+	{ .compatible	= "brcm,iproc-sr-sata-phy",
+	  .data = (void *)BRCM_SATA_PHY_IPROC_SR },
 	{},
 };
 MODULE_DEVICE_TABLE(of, brcm_sata_phy_of_match);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
