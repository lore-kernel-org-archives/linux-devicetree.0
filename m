From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 10/19] phy: mvebu-cp110-comphy: Cosmetic change in a helper
Date: Wed, 31 Jul 2019 14:21:17 +0200
Message-ID: <20190731122126.3049-11-miquel.raynal@bootlin.com>
References: <20190731122126.3049-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190731122126.3049-1-miquel.raynal@bootlin.com>
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

Before adding more logic, simplify a bit the writing of the
mvebu_comphy_get_mode() helper by using a pointer instead of
referencing a configuration with the entire table name.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 67050f98b3c6..c61469ed7cbe 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -265,16 +265,18 @@ static int mvebu_comphy_get_mode(bool fw_mode, int lane, int port,
 				 enum phy_mode mode, int submode)
 {
 	int i, n = ARRAY_SIZE(mvebu_comphy_cp110_modes);
+	const struct mvebu_comphy_conf *conf;
 
 	/* Unused PHY mux value is 0x0 */
 	if (mode == PHY_MODE_INVALID)
 		return 0;
 
 	for (i = 0; i < n; i++) {
-		if (mvebu_comphy_cp110_modes[i].lane == lane &&
-		    mvebu_comphy_cp110_modes[i].port == port &&
-		    mvebu_comphy_cp110_modes[i].mode == mode &&
-		    mvebu_comphy_cp110_modes[i].submode == submode)
+		conf = &mvebu_comphy_cp110_modes[i];
+		if (conf->lane == lane &&
+		    conf->port == port &&
+		    conf->mode == mode &&
+		    conf->submode == submode)
 			break;
 	}
 
@@ -282,9 +284,9 @@ static int mvebu_comphy_get_mode(bool fw_mode, int lane, int port,
 		return -EINVAL;
 
 	if (fw_mode)
-		return mvebu_comphy_cp110_modes[i].fw_mode;
+		return conf->fw_mode;
 	else
-		return mvebu_comphy_cp110_modes[i].mux;
+		return conf->mux;
 }
 
 static inline int mvebu_comphy_get_mux(int lane, int port,
-- 
2.20.1
