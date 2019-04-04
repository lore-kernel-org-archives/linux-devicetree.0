From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next v3 4/4] net: phy: meson-gxl: clean-up gxl variant driver
Date: Thu,  4 Apr 2019 15:11:47 +0200
Message-ID: <20190404131147.31156-5-jbrunet@baylibre.com>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190404131147.31156-1-jbrunet@baylibre.com>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The purpose of this change is to align the gxl and g12a driver
declaration.

Like on the g12a variant, remove genphy_aneg_done() from the driver
declaration as the net phy framework will default to it anyway.

Also, the gxl phy id should be an exact match as well, so let's change
this and use the macro provided.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/meson-gxl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 2033c93a46ca..6d4a8c508ec0 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -224,14 +224,12 @@ static int meson_gxl_config_intr(struct phy_device *phydev)
 
 static struct phy_driver meson_gxl_phy[] = {
 	{
-		.phy_id		= 0x01814400,
-		.phy_id_mask	= 0xfffffff0,
+		PHY_ID_MATCH_EXACT(0x01814400),
 		.name		= "Meson GXL Internal PHY",
 		.features	= PHY_BASIC_FEATURES,
 		.flags		= PHY_IS_INTERNAL,
 		.soft_reset     = genphy_soft_reset,
 		.config_init	= meson_gxl_config_init,
-		.aneg_done      = genphy_aneg_done,
 		.read_status	= meson_gxl_read_status,
 		.ack_interrupt	= meson_gxl_ack_interrupt,
 		.config_intr	= meson_gxl_config_intr,
@@ -251,7 +249,7 @@ static struct phy_driver meson_gxl_phy[] = {
 };
 
 static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
-	{ 0x01814400, 0xfffffff0 },
+	{ PHY_ID_MATCH_VENDOR(0x01814400) },
 	{ PHY_ID_MATCH_VENDOR(0x01803301) },
 	{ }
 };
-- 
2.20.1
