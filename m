From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/8] phy: mvebu-cp110-comphy: fix spelling in structure name
Date: Fri, 30 Nov 2018 15:47:36 +0100
Message-ID: <20181130144743.675-2-miquel.raynal@bootlin.com>
References: <20181130144743.675-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130144743.675-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Rename the mvebu_comhy_conf structure to be mvebu_comphy_conf, which is
probably what the original author meant.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 86a5f7b9448b..31b9a1c18345 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -114,7 +114,7 @@
 #define MVEBU_COMPHY_LANES	6
 #define MVEBU_COMPHY_PORTS	3
 
-struct mvebu_comhy_conf {
+struct mvebu_comphy_conf {
 	enum phy_mode mode;
 	unsigned lane;
 	unsigned port;
@@ -129,7 +129,7 @@ struct mvebu_comhy_conf {
 		.mux = _mux,				\
 	}
 
-static const struct mvebu_comhy_conf mvebu_comphy_cp110_modes[] = {
+static const struct mvebu_comphy_conf mvebu_comphy_cp110_modes[] = {
 	/* lane 0 */
 	MVEBU_COMPHY_CONF(0, 1, PHY_MODE_SGMII, 0x1),
 	MVEBU_COMPHY_CONF(0, 1, PHY_MODE_2500SGMII, 0x1),
-- 
2.19.1
