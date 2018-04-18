From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v2 2/3] lan78xx: Read LED states from Device Tree
Date: Wed, 18 Apr 2018 16:45:22 +0100
Message-ID: <1524066323-109628-3-git-send-email-phil@raspberrypi.org>
References: <1524066323-109628-1-git-send-email-phil@raspberrypi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524066323-109628-1-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Add support for DT property "microchip,led-modes", a vector of zero
to four cells (u32s) in the range 0-15, each of which sets the mode
for one of the LEDs. Some possible values are:

    0=link/activity          1=link1000/activity
    2=link100/activity       3=link10/activity
    4=link100/1000/activity  5=link10/1000/activity
    6=link10/100/activity    14=off    15=on

These values are given symbolic constants in a dt-bindings header.

Also use the presence of the DT property to indicate that the
LEDs should be enabled - necessary in the event that no valid OTP
or EEPROM is available.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 MAINTAINERS                              |  1 +
 drivers/net/usb/lan78xx.c                | 35 ++++++++++++++++++++++++++++++++
 include/dt-bindings/net/microchip-78xx.h | 21 +++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 include/dt-bindings/net/microchip-78xx.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b60179d..9c9bc63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14573,6 +14573,7 @@ M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/usb/lan78xx.*
+F:	include/dt-bindings/net/microchip-78xx.h
 
 USB MASS STORAGE DRIVER
 M:	Alan Stern <stern@rowland.harvard.edu>
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index a823f01..f47ffea 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -38,6 +38,7 @@
 #include <linux/microchipphy.h>
 #include <linux/phy.h>
 #include <linux/of_net.h>
+#include <dt-bindings/net/microchip-78xx.h>
 #include "lan78xx.h"
 
 #define DRIVER_AUTHOR	"WOOJUNG HUH <woojung.huh@microchip.com>"
@@ -74,6 +75,9 @@
 #define LAN78XX_EEPROM_MAGIC		(0x78A5)
 #define LAN78XX_OTP_MAGIC		(0x78F3)
 
+/* This register is specific to the LAN7800 and LAN7850 embedded PHYs */
+#define LAN78XX_PHY_LED_MODE_SELECT	29
+
 #define	MII_READ			1
 #define	MII_WRITE			0
 
@@ -2005,6 +2009,8 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 {
 	int ret;
 	u32 mii_adv;
+	u32 led_modes[4];
+	int len;
 	struct phy_device *phydev;
 
 	phydev = phy_find_first(dev->mdiobus);
@@ -2077,6 +2083,35 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 	mii_adv = (u32)mii_advertise_flowctrl(dev->fc_request_control);
 	phydev->advertising |= mii_adv_to_ethtool_adv_t(mii_adv);
 
+	len = of_property_read_variable_u32_array(dev->udev->dev.of_node,
+						  "microchip,led-modes",
+						  led_modes,
+						  0,
+						  ARRAY_SIZE(led_modes));
+	if (len >= 0) {
+		u32 reg = 0;
+		int i;
+
+		for (i = 0; i < len; i++) {
+			if (led_modes[i] > 15) {
+				ret = -EINVAL;
+				goto error;
+			}
+			reg |= led_modes[i] << (i * 4);
+		}
+		for (; i < ARRAY_SIZE(led_modes); i++)
+			reg |= LAN78XX_FORCE_LED_OFF << (i * 4);
+		(void)phy_write(phydev, LAN78XX_PHY_LED_MODE_SELECT, reg);
+
+		/* Ensure the LEDs are enabled */
+		lan78xx_read_reg(dev, HW_CFG, &reg);
+		reg |= HW_CFG_LED0_EN_ | HW_CFG_LED1_EN_;
+		lan78xx_write_reg(dev, HW_CFG, reg);
+	} else if (len == -EOVERFLOW) {
+		ret = -EINVAL;
+		goto error;
+	}
+
 	genphy_config_aneg(phydev);
 
 	dev->fc_autoneg = phydev->autoneg;
diff --git a/include/dt-bindings/net/microchip-78xx.h b/include/dt-bindings/net/microchip-78xx.h
new file mode 100644
index 0000000..dcf4a43
--- /dev/null
+++ b/include/dt-bindings/net/microchip-78xx.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_MICROCHIP_LAN78XX_H
+#define _DT_BINDINGS_MICROCHIP_LAN78XX_H
+
+/* LED modes */
+
+#define LAN78XX_LINK_ACTIVITY           0
+#define LAN78XX_LINK_1000_ACTIVITY      1
+#define LAN78XX_LINK_100_ACTIVITY       2
+#define LAN78XX_LINK_10_ACTIVITY        3
+#define LAN78XX_LINK_100_1000_ACTIVITY  4
+#define LAN78XX_LINK_10_1000_ACTIVITY   5
+#define LAN78XX_LINK_10_100_ACTIVITY    6
+#define LAN78XX_DUPLEX_COLLISION        8
+#define LAN78XX_COLLISION               9
+#define LAN78XX_ACTIVITY                10
+#define LAN78XX_AUTONEG_FAULT           12
+#define LAN78XX_FORCE_LED_OFF           14
+#define LAN78XX_FORCE_LED_ON            15
+
+#endif
-- 
2.7.4
