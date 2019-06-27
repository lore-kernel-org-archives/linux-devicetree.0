From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 07/19] phy: mvebu-cp110-comphy: Allow non-Ethernet modes to
 be configured
Date: Thu, 27 Jun 2019 11:50:52 +0200
Message-ID: <20190627095104.22529-8-miquel.raynal@bootlin.com>
References: <20190627095104.22529-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190627095104.22529-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The COMPHY can configure the SERDES lanes in several non-Ethernet
modes: SATA, USB3, PCIe. Drop the condition limiting the driver to
Ethernet modes only before adding support for more.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 2d8ca678a247..224fb5400b96 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -671,9 +671,6 @@ static int mvebu_comphy_set_mode(struct phy *phy,
 {
 	struct mvebu_comphy_lane *lane = phy_get_drvdata(phy);
 
-	if (mode != PHY_MODE_ETHERNET)
-		return -EINVAL;
-
 	if (submode == PHY_INTERFACE_MODE_1000BASEX)
 		submode = PHY_INTERFACE_MODE_SGMII;
 
-- 
2.19.1
