From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 3/4] lan78xx: Read LED modes from Device Tree
Date: Thu, 12 Apr 2018 14:55:35 +0100
Message-ID: <1523541336-145953-4-git-send-email-phil@raspberrypi.org>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
Sender: netdev-owner@vger.kernel.org
To: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Add support for DT property "microchip,led-modes", a vector of two
cells (u32s) in the range 0-15, each of which sets the mode for one
of the two LEDs. Some possible values are:

    0=link/activity          1=link1000/activity
    2=link100/activity       3=link10/activity
    4=link100/1000/activity  5=link10/1000/activity
    6=link10/100/activity    14=off    15=on

Also use the presence of the DT property to indicate that the
LEDs should be enabled - necessary in the event that no valid OTP
or EEPROM is available.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/net/usb/lan78xx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index d98397b..ffb483d 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2008,6 +2008,7 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 {
 	int ret;
 	u32 mii_adv;
+	u32 led_modes[2];
 	struct phy_device *phydev;
 
 	phydev = phy_find_first(dev->mdiobus);
@@ -2097,6 +2098,25 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 		(void)lan78xx_set_eee(dev->net, &edata);
 	}
 
+	if (!of_property_read_u32_array(dev->udev->dev.of_node,
+					"microchip,led-modes",
+					led_modes, ARRAY_SIZE(led_modes))) {
+		u32 reg;
+		int i;
+
+		reg = phy_read(phydev, 0x1d);
+		for (i = 0; i < ARRAY_SIZE(led_modes); i++) {
+			reg &= ~(0xf << (i * 4));
+			reg |= (led_modes[i] & 0xf) << (i * 4);
+		}
+		(void)phy_write(phydev, 0x1d, reg);
+
+		/* Ensure the LEDs are enabled */
+		lan78xx_read_reg(dev, HW_CFG, &reg);
+		reg |= HW_CFG_LED0_EN_ | HW_CFG_LED1_EN_;
+		lan78xx_write_reg(dev, HW_CFG, reg);
+	}
+
 	genphy_config_aneg(phydev);
 
 	dev->fc_autoneg = phydev->autoneg;
-- 
2.7.4
