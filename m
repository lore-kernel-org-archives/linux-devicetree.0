From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 3/3] net: phy: realtek: Support SSC for the RTL8211E
Date: Mon,  1 Jul 2019 12:52:25 -0700
Message-ID: <20190701195225.120808-3-mka@chromium.org>
References: <20190701195225.120808-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190701195225.120808-1-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

By default Spread-Spectrum Clocking (SSC) is disabled on the RTL8211E.
Enable it if the device tree property 'realtek,enable-ssc' exists.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 drivers/net/phy/realtek.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index dfc2e20ef335..b617169ccc8c 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -9,8 +9,10 @@
  * Copyright (c) 2004 Freescale Semiconductor, Inc.
  */
 #include <linux/bitops.h>
-#include <linux/phy.h>
+#include <linux/device.h>
+#include <linux/of.h>
 #include <linux/module.h>
+#include <linux/phy.h>
 
 #define RTL821x_PHYSR				0x11
 #define RTL821x_PHYSR_DUPLEX			BIT(13)
@@ -28,6 +30,8 @@
 
 #define RTL8211E_EXT_PAGE			7
 #define RTL8211E_EPAGSR				0x1e
+#define RTL8211E_SCR				0x1a
+#define RTL8211E_SCR_DISABLE_RXC_SSC		BIT(2)
 
 #define RTL8211F_INSR				0x1d
 
@@ -87,8 +91,8 @@ static int rtl821e_restore_page(struct phy_device *phydev, int oldpage, int ret)
 	return ret;
 }
 
-static int __maybe_unused rtl8211e_modify_ext_paged(struct phy_device *phydev,
-				    int page, u32 regnum, u16 mask, u16 set)
+static int rtl8211e_modify_ext_paged(struct phy_device *phydev, int page,
+				     u32 regnum, u16 mask, u16 set)
 {
 	int ret = 0;
 	int oldpage;
@@ -114,6 +118,22 @@ static int __maybe_unused rtl8211e_modify_ext_paged(struct phy_device *phydev,
 	return rtl821e_restore_page(phydev, oldpage, ret);
 }
 
+static int rtl8211e_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	int err;
+
+	if (of_property_read_bool(dev->of_node, "realtek,enable-ssc")) {
+		err = rtl8211e_modify_ext_paged(phydev, 0xa0, RTL8211E_SCR,
+						RTL8211E_SCR_DISABLE_RXC_SSC,
+						0);
+		if (err)
+			dev_err(dev, "failed to enable SSC on RXC: %d\n", err);
+	}
+
+	return 0;
+}
+
 static int rtl8201_ack_interrupt(struct phy_device *phydev)
 {
 	int err;
@@ -372,6 +392,7 @@ static struct phy_driver realtek_drvs[] = {
 		.config_init	= &rtl8211e_config_init,
 		.ack_interrupt	= &rtl821x_ack_interrupt,
 		.config_intr	= &rtl8211e_config_intr,
+		.probe          = rtl8211e_probe,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
 		.read_page	= rtl821x_read_page,
-- 
2.22.0.410.gd8fdbe21b5-goog
