From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] phy: brcm-sata: Allow RX equalizer tuning
Date: Wed, 11 Oct 2017 17:53:12 -0700
Message-ID: <20171012005312.17363-4-f.fainelli@gmail.com>
References: <20171012005312.17363-1-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171012005312.17363-1-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Parse the DT properties brcm,rxaeq-mode and brcm,rxaeq-value to
correctly configure the RX equalizer of the PHY. This may be required to
resolve specific signal integrity issues.

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 69 +++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index 0152d0b32dae..3f953db70288 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -49,11 +49,29 @@ enum brcm_sata_phy_version {
 	BRCM_SATA_PHY_IPROC_SR,
 };
 
+enum brcm_sata_phy_rxaeq_mode {
+	RXAEQ_MODE_OFF = 0,
+	RXAEQ_MODE_AUTO,
+	RXAEQ_MODE_MANUAL,
+};
+
+static enum brcm_sata_phy_rxaeq_mode rxaeq_to_val(const char *m)
+{
+	if (!strcmp(m, "auto"))
+		return RXAEQ_MODE_AUTO;
+	else if (!strcmp(m, "manual"))
+		return RXAEQ_MODE_MANUAL;
+	else
+		return RXAEQ_MODE_OFF;
+}
+
 struct brcm_sata_port {
 	int portnum;
 	struct phy *phy;
 	struct brcm_sata_phy *phy_priv;
 	bool ssc_en;
+	enum brcm_sata_phy_rxaeq_mode rxaeq_mode;
+	u32 rxaeq_val;
 };
 
 struct brcm_sata_phy {
@@ -93,6 +111,15 @@ enum sata_phy_regs {
 	TX_ACTRL0				= 0x80,
 	TX_ACTRL0_TXPOL_FLIP			= BIT(6),
 
+	AEQRX_REG_BANK_0			= 0xd0,
+	AEQ_CONTROL1				= 0x81,
+	AEQ_CONTROL1_ENABLE			= BIT(2),
+	AEQ_CONTROL1_FREEZE			= BIT(3),
+	AEQ_FRC_EQ				= 0x83,
+	AEQ_FRC_EQ_FORCE			= BIT(0),
+	AEQ_FRC_EQ_FORCE_VAL			= BIT(1),
+	AEQRX_REG_BANK_1			= 0xe0,
+
 	OOB_REG_BANK				= 0x150,
 	OOB1_REG_BANK				= 0x160,
 	OOB_CTRL1				= 0x80,
@@ -217,11 +244,43 @@ static void brcm_stb_sata_ssc_init(struct brcm_sata_port *port)
 			  ~TXPMD_TX_FREQ_CTRL_CONTROL3_FMAX_MASK, tmp);
 }
 
+#define AEQ_FRC_EQ_VAL_SHIFT	2
+#define AEQ_FRC_EQ_VAL_MASK	0x3f
+
+static int brcm_stb_sata_rxaeq_init(struct brcm_sata_port *port)
+{
+	void __iomem *base = brcm_sata_pcb_base(port);
+	u32 tmp = 0, reg = 0;
+
+	switch (port->rxaeq_mode) {
+	case RXAEQ_MODE_OFF:
+		return 0;
+
+	case RXAEQ_MODE_AUTO:
+		reg = AEQ_CONTROL1;
+		tmp = AEQ_CONTROL1_ENABLE | AEQ_CONTROL1_FREEZE;
+		break;
+
+	case RXAEQ_MODE_MANUAL:
+		reg = AEQ_FRC_EQ;
+		tmp = AEQ_FRC_EQ_FORCE | AEQ_FRC_EQ_FORCE_VAL;
+		if (port->rxaeq_val > AEQ_FRC_EQ_VAL_MASK)
+			return -EINVAL;
+		tmp |= port->rxaeq_val << AEQ_FRC_EQ_VAL_SHIFT;
+		break;
+	}
+
+	brcm_sata_phy_wr(base, AEQRX_REG_BANK_0, reg, ~tmp, tmp);
+	brcm_sata_phy_wr(base, AEQRX_REG_BANK_1, reg, ~tmp, tmp);
+
+	return 0;
+}
+
 static int brcm_stb_sata_init(struct brcm_sata_port *port)
 {
 	brcm_stb_sata_ssc_init(port);
 
-	return 0;
+	return brcm_stb_sata_rxaeq_init(port);
 }
 
 /* NS2 SATA PLL1 defaults were characterized by H/W group */
@@ -468,6 +527,7 @@ MODULE_DEVICE_TABLE(of, brcm_sata_phy_of_match);
 
 static int brcm_sata_phy_probe(struct platform_device *pdev)
 {
+	const char *rxaeq_mode;
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node, *child;
 	const struct of_device_id *of_id;
@@ -530,6 +590,13 @@ static int brcm_sata_phy_probe(struct platform_device *pdev)
 		port->portnum = id;
 		port->phy_priv = priv;
 		port->phy = devm_phy_create(dev, child, &phy_ops);
+		port->rxaeq_mode = RXAEQ_MODE_OFF;
+		if (!of_property_read_string(child, "brcm,rxaeq-mode",
+					     &rxaeq_mode))
+			port->rxaeq_mode = rxaeq_to_val(rxaeq_mode);
+		if (port->rxaeq_mode == RXAEQ_MODE_MANUAL)
+			of_property_read_u32(child, "brcm,rxaeq-value",
+					     &port->rxaeq_val);
 		port->ssc_en = of_property_read_bool(child, "brcm,enable-ssc");
 		if (IS_ERR(port->phy)) {
 			dev_err(dev, "failed to create PHY\n");
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
