From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v4 03/10] net: macb: support of_get_mac_address new ERR_PTR error
Date: Fri,  3 May 2019 16:27:08 +0200
Message-ID: <1556893635-18549-4-git-send-email-ynezz@true.cz>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1556893635-18549-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There was NVMEM support added directly to of_get_mac_address, and it uses
nvmem_get_mac_address under the hood, so we can remove it. As
of_get_mac_address can now return ERR_PTR encoded error values, adjust to
that as well.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---

 Changes since v2:

 * ERR_PTR and EPROBE_DEFER handling

 Changes since v3:

  * IS_ERR_OR_NULL -> IS_ERR

 drivers/net/ethernet/cadence/macb_main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 3da2795..f0466e8 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4172,15 +4172,13 @@ static int macb_probe(struct platform_device *pdev)
 		bp->rx_intr_mask |= MACB_BIT(RXUBR);
 
 	mac = of_get_mac_address(np);
-	if (mac) {
+	if (PTR_ERR(mac) == -EPROBE_DEFER) {
+		err = -EPROBE_DEFER;
+		goto err_out_free_netdev;
+	} else if (!IS_ERR(mac)) {
 		ether_addr_copy(bp->dev->dev_addr, mac);
 	} else {
-		err = nvmem_get_mac_address(&pdev->dev, bp->dev->dev_addr);
-		if (err) {
-			if (err == -EPROBE_DEFER)
-				goto err_out_free_netdev;
-			macb_get_hwaddr(bp);
-		}
+		macb_get_hwaddr(bp);
 	}
 
 	err = of_get_phy_mode(np);
-- 
1.9.1
