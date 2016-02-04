From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH 2/2] net/smscx5xx: use the device tree for mac address
Date: Thu,  4 Feb 2016 08:36:04 +0100
Message-ID: <1454571364-24708-3-git-send-email-lkundrak@v3.sk>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454571364-24708-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, popcornmix <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

This takes the MAC address for smsc75xx/smsc95xx USB network devices
from a the device tree. This is required to get a usable persistent
address on the popular beagleboard, whose hardware designers
accidentally forgot that an ethernet device really requires an a
MAC address to be functional.

The Raspberry Pi also ships smsc9514 without a serial EEPROM, stores the MAC
address in ROM accessible via VC4 firmware.

The smsc75xx and smsc95xx drivers are just two copies of the
same code, so better fix both.

[lkundrak-NGH9Lh4a5iE@public.gmane.org: updated to use of_get_property() as per suggestion from Arnd,
reworded the message and comments a bit]

Tested-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
Changes since v1:
  - Made use of_get_property()
  - Amended comments/commit message a bit

 drivers/net/usb/smsc75xx.c | 12 +++++++++++-
 drivers/net/usb/smsc95xx.c | 12 +++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/smsc75xx.c b/drivers/net/usb/smsc75xx.c
index 30033db..8266e27 100644
--- a/drivers/net/usb/smsc75xx.c
+++ b/drivers/net/usb/smsc75xx.c
@@ -29,6 +29,7 @@
 #include <linux/crc32.h>
 #include <linux/usb/usbnet.h>
 #include <linux/slab.h>
+#include <linux/of_net.h>
 #include "smsc75xx.h"
 
 #define SMSC_CHIPNAME			"smsc75xx"
@@ -761,6 +762,8 @@ static int smsc75xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
 
 static void smsc75xx_init_mac_address(struct usbnet *dev)
 {
+	const u8 *mac_addr;
+
 	/* try reading mac address from EEPROM */
 	if (smsc75xx_read_eeprom(dev, EEPROM_MAC_OFFSET, ETH_ALEN,
 			dev->net->dev_addr) == 0) {
@@ -772,7 +775,14 @@ static void smsc75xx_init_mac_address(struct usbnet *dev)
 		}
 	}
 
-	/* no eeprom, or eeprom values are invalid. generate random MAC */
+	/* maybe the boot loader passed the MAC address in devicetree */
+	mac_addr = of_get_mac_address (dev->udev->dev.of_node);
+	if (mac_addr) {
+		memcpy(dev->net->dev_addr, mac_addr, ETH_ALEN);
+		return;
+	}
+
+	/* no useful static MAC address found. generate a random one */
 	eth_hw_addr_random(dev->net);
 	netif_dbg(dev, ifup, dev->net, "MAC address set to eth_random_addr\n");
 }
diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 66b3ab9..623bb2e 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -29,6 +29,7 @@
 #include <linux/crc32.h>
 #include <linux/usb/usbnet.h>
 #include <linux/slab.h>
+#include <linux/of_net.h>
 #include "smsc95xx.h"
 
 #define SMSC_CHIPNAME			"smsc95xx"
@@ -765,6 +766,8 @@ static int smsc95xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
 
 static void smsc95xx_init_mac_address(struct usbnet *dev)
 {
+	const u8 *mac_addr;
+
 	/* try reading mac address from EEPROM */
 	if (smsc95xx_read_eeprom(dev, EEPROM_MAC_OFFSET, ETH_ALEN,
 			dev->net->dev_addr) == 0) {
@@ -775,7 +778,14 @@ static void smsc95xx_init_mac_address(struct usbnet *dev)
 		}
 	}
 
-	/* no eeprom, or eeprom values are invalid. generate random MAC */
+	/* maybe the boot loader passed the MAC address in devicetree */
+	mac_addr = of_get_mac_address (dev->udev->dev.of_node);
+	if (mac_addr) {
+		memcpy(dev->net->dev_addr, mac_addr, ETH_ALEN);
+		return;
+	}
+
+	/* no useful static MAC address found. generate a random one */
 	eth_hw_addr_random(dev->net);
 	netif_dbg(dev, ifup, dev->net, "MAC address set to eth_random_addr\n");
 }
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
