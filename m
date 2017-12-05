From: Richard Leitner <dev@g0hl1n.net>
Subject: [PATCH net-next v3 3/4] net: phy: smsc: LAN8710/20: add PHY_RST_AFTER_CLK_EN flag
Date: Tue,  5 Dec 2017 14:25:59 +0100
Message-ID: <20171205132600.13796-4-dev@g0hl1n.net>
References: <20171205132600.13796-1-dev@g0hl1n.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171205132600.13796-1-dev@g0hl1n.net>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, fugang.duan@nxp.com, andrew@lunn.ch, f.fainelli@gmail.com, frowand.list@gmail.com
Cc: davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richard.leitner@skidata.com
List-Id: devicetree@vger.kernel.org

From: Richard Leitner <richard.leitner@skidata.com>

The Microchip/SMSC LAN8710/LAN8720 PHYs need (according to their
datasheet [1]) a continuous REF_CLK when configured to "REF_CLK In Mode".
Therefore set the PHY_RST_AFTER_CLK_EN flag for those PHYs to let the
ETH driver reset them after the REF_CLK is enabled.

[1] http://ww1.microchip.com/downloads/en/DeviceDoc/00002165B.pdf

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/net/phy/smsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index a1961ba87e2b..be399d645224 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -312,7 +312,7 @@ static struct phy_driver smsc_phy_driver[] = {
 	.name		= "SMSC LAN8710/LAN8720",
 
 	.features	= PHY_BASIC_FEATURES,
-	.flags		= PHY_HAS_INTERRUPT,
+	.flags		= PHY_HAS_INTERRUPT | PHY_RST_AFTER_CLK_EN,
 
 	.probe		= smsc_phy_probe,
 
-- 
2.11.0
