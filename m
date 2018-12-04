From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/8] phy: mvebu-cp110-comphy: fix port check in ->xlate()
Date: Tue,  4 Dec 2018 20:17:24 +0100
Message-ID: <20181204191730.11516-3-miquel.raynal@bootlin.com>
References: <20181204191730.11516-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204191730.11516-1-miquel.raynal@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, linux-kernel@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

So far the PHY ->xlate() callback was checking if the port was
"invalid" before continuing, meaning that the port has not been used
yet. This check is not correct as there is no opposite call to
->xlate() once the PHY is released by the user and the port will
remain "valid" after the first phy_get()/phy_put() calls. Hence, if
this driver is built as a module, inserted, removed and inserted
again, the PHY will appear busy and the second probe will fail.

To fix this, just drop the faulty check and instead verify that the
port number is valid (ie. in the possible range).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 31b9a1c18345..6cae6227c7f8 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -567,8 +567,6 @@ static struct phy *mvebu_comphy_xlate(struct device *dev,
 		return phy;
 
 	lane = phy_get_drvdata(phy);
-	if (lane->port >= 0)
-		return ERR_PTR(-EBUSY);
 	lane->port = args->args[0];
 
 	return phy;
-- 
2.19.1
