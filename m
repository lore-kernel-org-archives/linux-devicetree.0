From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v3 06/10] net: usb: support of_get_mac_address new ERR_PTR error
Date: Fri,  3 May 2019 09:56:03 +0200
Message-ID: <1556870168-26864-7-git-send-email-ynezz@true.cz>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, Steve Glendinning <steve.glendinning@shawell.net>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There was NVMEM support added to of_get_mac_address, so it could now
return NULL and ERR_PTR encoded error values, so we need to adjust all
current users of of_get_mac_address to this new fact.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 drivers/net/usb/smsc75xx.c | 2 +-
 drivers/net/usb/smsc95xx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/smsc75xx.c b/drivers/net/usb/smsc75xx.c
index ec287c9..7acfa64 100644
--- a/drivers/net/usb/smsc75xx.c
+++ b/drivers/net/usb/smsc75xx.c
@@ -774,7 +774,7 @@ static void smsc75xx_init_mac_address(struct usbnet *dev)
 
 	/* maybe the boot loader passed the MAC address in devicetree */
 	mac_addr = of_get_mac_address(dev->udev->dev.of_node);
-	if (mac_addr) {
+	if (!IS_ERR_OR_NULL(mac_addr)) {
 		memcpy(dev->net->dev_addr, mac_addr, ETH_ALEN);
 		return;
 	}
diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index e3d08626..841699f 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -917,7 +917,7 @@ static void smsc95xx_init_mac_address(struct usbnet *dev)
 
 	/* maybe the boot loader passed the MAC address in devicetree */
 	mac_addr = of_get_mac_address(dev->udev->dev.of_node);
-	if (mac_addr) {
+	if (!IS_ERR_OR_NULL(mac_addr)) {
 		memcpy(dev->net->dev_addr, mac_addr, ETH_ALEN);
 		return;
 	}
-- 
1.9.1
