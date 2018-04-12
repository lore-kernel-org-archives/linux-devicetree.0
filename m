From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 2/4] lan78xx: Read initial EEE setting from Device Tree
Date: Thu, 12 Apr 2018 14:55:34 +0100
Message-ID: <1523541336-145953-3-git-send-email-phil@raspberrypi.org>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

Add two new Device Tree properties:
* microchip,eee-enabled  - a boolean to enable EEE
* microchip,tx-lpi-timer - time in microseconds to wait after TX goes
                           idle before entering the low power state
                           (default 600)

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/net/usb/lan78xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index d2727b5..d98397b 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2080,6 +2080,23 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 	mii_adv = (u32)mii_advertise_flowctrl(dev->fc_request_control);
 	phydev->advertising |= mii_adv_to_ethtool_adv_t(mii_adv);
 
+	if (of_property_read_bool(dev->udev->dev.of_node,
+				  "microchip,eee-enabled")) {
+		struct ethtool_eee edata;
+
+		memset(&edata, 0, sizeof(edata));
+		edata.cmd = ETHTOOL_SEEE;
+		edata.advertised = ADVERTISED_1000baseT_Full |
+				   ADVERTISED_100baseT_Full;
+		edata.eee_enabled = true;
+		edata.tx_lpi_enabled = true;
+		if (of_property_read_u32(dev->udev->dev.of_node,
+					 "microchip,tx-lpi-timer",
+					 &edata.tx_lpi_timer))
+			edata.tx_lpi_timer = 600; /* non-aggressive */
+		(void)lan78xx_set_eee(dev->net, &edata);
+	}
+
 	genphy_config_aneg(phydev);
 
 	dev->fc_autoneg = phydev->autoneg;
-- 
2.7.4
