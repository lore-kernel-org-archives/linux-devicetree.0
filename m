From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next 3/3] net: phy: meson-gxl: add g12a support
Date: Thu, 14 Mar 2019 15:01:35 +0100
Message-ID: <20190314140135.19184-4-jbrunet@baylibre.com>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190314140135.19184-1-jbrunet@baylibre.com>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The g12a SoC family uses the type of internal PHY that was used on the
gxl family. The quirks of gxl family, like the LPA register corruption,
appear to have been resolved on this new SoC generation.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/meson-gxl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 0eec2913c289..49cad0f4c79b 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -237,11 +237,25 @@ static struct phy_driver meson_gxl_phy[] = {
 		.config_intr	= meson_gxl_config_intr,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+	}, {
+		.phy_id		= 0x01803301,
+		.phy_id_mask	= 0xffffffff,
+		.name		= "Meson G12A Internal PHY",
+		.features	= PHY_BASIC_FEATURES,
+		.flags		= PHY_IS_INTERNAL,
+		.soft_reset     = genphy_soft_reset,
+		.aneg_done      = genphy_aneg_done,
+		.read_status	= genphy_read_status,
+		.ack_interrupt	= meson_gxl_ack_interrupt,
+		.config_intr	= meson_gxl_config_intr,
+		.suspend        = genphy_suspend,
+		.resume         = genphy_resume,
 	},
 };
 
 static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
 	{ 0x01814400, 0xfffffff0 },
+	{ 0x01803301, 0xffffffff },
 	{ }
 };
 
-- 
2.20.1
