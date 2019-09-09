From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Subject: [PATCH v2 2/2] net: phy: dp83867: Add SGMII mode type switching
Date: Mon,  9 Sep 2019 14:02:22 +0300
Message-ID: <1568026945-3857-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
References: <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, f.fainelli@gmail.com
Cc: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Trent Piepho <tpiepho@impinj.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds ability to switch beetween two PHY SGMII modes.
Some hardware, for example, FPGA IP designs may use 6-wire mode
which enables differential SGMII clock to MAC.

Signed-off-by: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
---
Changes in v2:
- changed variable sgmii_type name to sgmii_ref_clk_en

 drivers/net/phy/dp83867.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 1f1ecee..cd6260e 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -37,6 +37,7 @@
 #define DP83867_STRAP_STS2	0x006f
 #define DP83867_RGMIIDCTL	0x0086
 #define DP83867_IO_MUX_CFG	0x0170
+#define DP83867_SGMIICTL	0x00D3
 #define DP83867_10M_SGMII_CFG   0x016F
 #define DP83867_10M_SGMII_RATE_ADAPT_MASK BIT(7)

@@ -61,6 +62,9 @@
 #define DP83867_RGMII_TX_CLK_DELAY_EN		BIT(1)
 #define DP83867_RGMII_RX_CLK_DELAY_EN		BIT(0)

+/* SGMIICTL bits */
+#define DP83867_SGMII_TYPE		BIT(14)
+
 /* STRAP_STS1 bits */
 #define DP83867_STRAP_STS1_RESERVED		BIT(11)

@@ -109,6 +113,7 @@ struct dp83867_private {
 	bool rxctrl_strap_quirk;
 	bool set_clk_output;
 	u32 clk_output_sel;
+	bool sgmii_ref_clk_en;
 };

 static int dp83867_ack_interrupt(struct phy_device *phydev)
@@ -197,6 +202,9 @@ static int dp83867_of_init(struct phy_device *phydev)
 	dp83867->rxctrl_strap_quirk = of_property_read_bool(of_node,
 					"ti,dp83867-rxctrl-strap-quirk");

+	dp83867->sgmii_ref_clk_en = of_property_read_bool(of_node,
+					"ti,sgmii-ref-clock-output-enable");
+
 	/* Existing behavior was to use default pin strapping delay in rgmii
 	 * mode, but rgmii should have meant no delay.  Warn existing users.
 	 */
@@ -389,6 +397,14 @@ static int dp83867_config_init(struct phy_device *phydev)

 		if (ret)
 			return ret;
+
+		/* SGMII type is set to 4-wire mode by default */
+		if (dp83867->sgmii_ref_clk_en) {
+			/* Switch on 6-wire mode */
+			val = phy_read_mmd(phydev, DP83867_DEVADDR, DP83867_SGMIICTL);
+			val |= DP83867_SGMII_TYPE;
+			phy_write_mmd(phydev, DP83867_DEVADDR, DP83867_SGMIICTL, val);
+		}
 	}

 	/* Enable Interrupt output INT_OE in CFG3 register */
--
2.7.4
