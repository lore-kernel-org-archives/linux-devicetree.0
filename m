From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH 3/4] net: macb: Drop nvmem_get_mac_address usage
Date: Sat, 27 Apr 2019 01:06:41 +0200
Message-ID: <1556320002-26213-4-git-send-email-ynezz@true.cz>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556320002-26213-1-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
List-Id: devicetree@vger.kernel.org

of_get_mac_address now uses NVMEM under the hood, so it's not necessary
to call it manually anymore.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 drivers/net/ethernet/cadence/macb_main.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 3da2795..1b98bc8 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4172,16 +4172,10 @@ static int macb_probe(struct platform_device *pdev)
 		bp->rx_intr_mask |= MACB_BIT(RXUBR);
 
 	mac = of_get_mac_address(np);
-	if (mac) {
+	if (mac)
 		ether_addr_copy(bp->dev->dev_addr, mac);
-	} else {
-		err = nvmem_get_mac_address(&pdev->dev, bp->dev->dev_addr);
-		if (err) {
-			if (err == -EPROBE_DEFER)
-				goto err_out_free_netdev;
-			macb_get_hwaddr(bp);
-		}
-	}
+	else
+		macb_get_hwaddr(bp);
 
 	err = of_get_phy_mode(np);
 	if (err < 0) {
-- 
1.9.1
