From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/8] phy: mvebu-cp110-comphy: fix port check in ->xlate()
Date: Fri, 30 Nov 2018 15:47:37 +0100
Message-ID: <20181130144743.675-3-miquel.raynal@bootlin.com>
References: <20181130144743.675-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130144743.675-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Miquel Raynal <miquel.raynal@bootlin.com>
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
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index 31b9a1c18345..a40b876ff214 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -567,9 +567,9 @@ static struct phy *mvebu_comphy_xlate(struct device *dev,
 		return phy;
 
 	lane = phy_get_drvdata(phy);
-	if (lane->port >= 0)
-		return ERR_PTR(-EBUSY);
 	lane->port = args->args[0];
+	if (lane->port >= MVEBU_COMPHY_PORTS)
+		return ERR_PTR(-EINVAL);
 
 	return phy;
 }
-- 
2.19.1
