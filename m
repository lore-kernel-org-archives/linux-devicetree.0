From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v3 08/10] staging: octeon-ethernet: support of_get_mac_address new ERR_PTR error
Date: Fri,  3 May 2019 09:56:05 +0200
Message-ID: <1556870168-26864-9-git-send-email-ynezz@true.cz>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There was NVMEM support added to of_get_mac_address, so it could now
return NULL and ERR_PTR encoded error values, so we need to adjust all
current users of of_get_mac_address to this new fact.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 drivers/staging/octeon/ethernet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 986db76..8847a11c2 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -421,7 +421,7 @@ int cvm_oct_common_init(struct net_device *dev)
 	if (priv->of_node)
 		mac = of_get_mac_address(priv->of_node);
 
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		ether_addr_copy(dev->dev_addr, mac);
 	else
 		eth_hw_addr_random(dev);
-- 
1.9.1
