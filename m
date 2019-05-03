From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v3 07/10] net: wireless: support of_get_mac_address new ERR_PTR error
Date: Fri,  3 May 2019 09:56:04 +0200
Message-ID: <1556870168-26864-8-git-send-email-ynezz@true.cz>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Kalle Valo <kvalo@codeaurora.org>, Stanislaw Gruszka <sgruszka@redhat.com>, Helmut Schaa <helmut.schaa@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There was NVMEM support added to of_get_mac_address, so it could now
return NULL and ERR_PTR encoded error values, so we need to adjust all
current users of of_get_mac_address to this new fact.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 drivers/net/wireless/ath/ath9k/init.c          | 2 +-
 drivers/net/wireless/mediatek/mt76/eeprom.c    | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index 98141b6..8be2da8 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -642,7 +642,7 @@ static int ath9k_of_init(struct ath_softc *sc)
 	}
 
 	mac = of_get_mac_address(np);
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		ether_addr_copy(common->macaddr, mac);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index a1529920d..7cb16ba 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -94,7 +94,7 @@
 		return;
 
 	mac = of_get_mac_address(np);
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		memcpy(dev->macaddr, mac, ETH_ALEN);
 #endif
 
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 357c094..ef52467 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -1007,7 +1007,7 @@ void rt2x00lib_set_mac_address(struct rt2x00_dev *rt2x00dev, u8 *eeprom_mac_addr
 	const char *mac_addr;
 
 	mac_addr = of_get_mac_address(rt2x00dev->dev->of_node);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		ether_addr_copy(eeprom_mac_addr, mac_addr);
 
 	if (!is_valid_ether_addr(eeprom_mac_addr)) {
-- 
1.9.1
