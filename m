From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/2] net/smscx5xx: use the device tree for mac address
Date: Wed,  3 Feb 2016 16:02:38 +0100
Message-ID: <1454511759-24827-2-git-send-email-lkundrak@v3.sk>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Peter Chen <peter.chen@freescale.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This takes the MAC address for smsc75xx/smsc95xx USB network devices
from a the device tree. This is required to get a usable persistent
address on the popular beagleboard, whose hardware designers
accidentally forgot that an ethernet device really requires an a
MAC address to be functional.

The smsc75xx and smsc95xx drivers are just two copies of the
same code, so better fix both.

Tested-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/usb/smsc75xx.c | 10 ++++++++++
 drivers/net/usb/smsc95xx.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/net/usb/smsc75xx.c b/drivers/net/usb/smsc75xx.c
index 30033db..b2e33e6 100644
--- a/drivers/net/usb/smsc75xx.c
+++ b/drivers/net/usb/smsc75xx.c
@@ -29,6 +29,7 @@
 #include <linux/crc32.h>
 #include <linux/usb/usbnet.h>
 #include <linux/slab.h>
+#include <linux/of_device.h>
 #include "smsc75xx.h"
 
 #define SMSC_CHIPNAME			"smsc75xx"
@@ -761,6 +762,8 @@ static int smsc75xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
 
 static void smsc75xx_init_mac_address(struct usbnet *dev)
 {
+	const void *address;
+
 	/* try reading mac address from EEPROM */
 	if (smsc75xx_read_eeprom(dev, EEPROM_MAC_OFFSET, ETH_ALEN,
 			dev->net->dev_addr) == 0) {
@@ -772,6 +775,13 @@ static void smsc75xx_init_mac_address(struct usbnet *dev)
 		}
 	}
 
+	address = of_get_property(dev->udev->dev.of_node,
+				  "local-mac-address", NULL);
+	if (address) {
+		memcpy(dev->net->dev_addr, address, ETH_ALEN);
+		return;
+	}
+
 	/* no eeprom, or eeprom values are invalid. generate random MAC */
 	eth_hw_addr_random(dev->net);
 	netif_dbg(dev, ifup, dev->net, "MAC address set to eth_random_addr\n");
diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 66b3ab9..021b9ce 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -29,6 +29,7 @@
 #include <linux/crc32.h>
 #include <linux/usb/usbnet.h>
 #include <linux/slab.h>
+#include <linux/of_device.h>
 #include "smsc95xx.h"
 
 #define SMSC_CHIPNAME			"smsc95xx"
@@ -765,6 +766,8 @@ static int smsc95xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
 
 static void smsc95xx_init_mac_address(struct usbnet *dev)
 {
+	const void *address;
+
 	/* try reading mac address from EEPROM */
 	if (smsc95xx_read_eeprom(dev, EEPROM_MAC_OFFSET, ETH_ALEN,
 			dev->net->dev_addr) == 0) {
@@ -775,6 +778,13 @@ static void smsc95xx_init_mac_address(struct usbnet *dev)
 		}
 	}
 
+	address = of_get_property(dev->udev->dev.of_node,
+				  "local-mac-address", NULL);
+	if (address) {
+		memcpy(dev->net->dev_addr, address, ETH_ALEN);
+		return;
+	}
+
 	/* no eeprom, or eeprom values are invalid. generate random MAC */
 	eth_hw_addr_random(dev->net);
 	netif_dbg(dev, ifup, dev->net, "MAC address set to eth_random_addr\n");
-- 
2.5.0
