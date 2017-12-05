From: Richard Leitner <dev@g0hl1n.net>
Subject: [PATCH net-next v3 2/4] phylib: add reset after clk enable support
Date: Tue,  5 Dec 2017 14:25:58 +0100
Message-ID: <20171205132600.13796-3-dev@g0hl1n.net>
References: <20171205132600.13796-1-dev@g0hl1n.net>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171205132600.13796-1-dev@g0hl1n.net>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, andrew@lunn.ch, f.fainelli@gmail.com, frowand.list@gmail.com
Cc: davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richard.leitner@skidata.com
List-Id: devicetree@vger.kernel.org

From: Richard Leitner <richard.leitner@skidata.com>

Some PHYs need the refclk to be a continuous clock. Therefore they don't
allow turning it off and on again during operation. Nonetheless such a
clock switching is performed by some ETH drivers (namely FEC [1]) for
power saving reasons. An example for an affected PHY is the
SMSC/Microchip LAN8720 in "REF_CLK In Mode".

In order to provide a uniform method to overcome this problem this patch
adds a new phy_driver flag (PHY_RST_AFTER_CLK_EN) and corresponding
function phy_reset_after_clk_enable() to the phylib. These should be
used to trigger reset of the PHY after the refclk is switched on again.

This patch depends on the "phylib: Add device reset GPIO support" patch
submitted by Geert Uytterhoeven/Sergei Shtylyov [2].

[1] commit e8fcfcd5684a ("net: fec: optimize the clock management to save power")
[2] https://patchwork.kernel.org/patch/10090149/

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
 include/linux/phy.h          |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 1de5e242b8b4..462c17ed87b8 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1218,6 +1218,30 @@ int phy_loopback(struct phy_device *phydev, bool enable)
 }
 EXPORT_SYMBOL(phy_loopback);
 
+/**
+ * phy_reset_after_clk_enable - perform a PHY reset if needed
+ * @phydev: target phy_device struct
+ *
+ * Description: Some PHYs are known to need a reset after their refclk was
+ *   enabled. This function evaluates the flags and perform the reset if it's
+ *   needed. Returns < 0 on error, 0 if the phy wasn't reset and 1 if the phy
+ *   was reset.
+ */
+int phy_reset_after_clk_enable(struct phy_device *phydev)
+{
+	if (!phydev || !phydev->drv)
+		return -ENODEV;
+
+	if (phydev->drv->flags & PHY_RST_AFTER_CLK_EN) {
+		phy_device_reset(phydev, 1);
+		phy_device_reset(phydev, 0);
+		return 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(phy_reset_after_clk_enable);
+
 /* Generic PHY support and helper functions */
 
 /**
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 2bcbe894eb10..5c05fc73af70 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -59,6 +59,7 @@
 
 #define PHY_HAS_INTERRUPT	0x00000001
 #define PHY_IS_INTERNAL		0x00000002
+#define PHY_RST_AFTER_CLK_EN	0x00000004
 #define MDIO_DEVICE_IS_PHY	0x80000000
 
 /* Interface Mode definitions */
@@ -839,6 +840,7 @@ int phy_aneg_done(struct phy_device *phydev);
 
 int phy_stop_interrupts(struct phy_device *phydev);
 int phy_restart_aneg(struct phy_device *phydev);
+int phy_reset_after_clk_enable(struct phy_device *phydev);
 
 static inline void phy_device_reset(struct phy_device *phydev, int value)
 {
-- 
2.11.0
