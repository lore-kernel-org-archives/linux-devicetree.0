From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v3 03/11] net: mscc: ocelot: get HSIO regmap from syscon
Date: Fri, 14 Sep 2018 10:16:01 +0200
Message-ID: <d9b23949e81272006e076e0b58d90e0541f80c7f.1536912834.git-series.quentin.schulz@bootlin.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
In-Reply-To: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

HSIO address space was moved to a syscon, hence we need to get the
regmap of this address space from there and no more from the device
node.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 drivers/net/ethernet/mscc/ocelot_board.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_board.c b/drivers/net/ethernet/mscc/ocelot_board.c
index 26bb3b1..b7d755b 100644
--- a/drivers/net/ethernet/mscc/ocelot_board.c
+++ b/drivers/net/ethernet/mscc/ocelot_board.c
@@ -9,6 +9,7 @@
 #include <linux/netdevice.h>
 #include <linux/of_mdio.h>
 #include <linux/of_platform.h>
+#include <linux/mfd/syscon.h>
 #include <linux/skbuff.h>
 
 #include "ocelot.h"
@@ -162,6 +163,7 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *ports, *portnp;
 	struct ocelot *ocelot;
+	struct regmap *hsio;
 	u32 val;
 
 	struct {
@@ -173,7 +175,6 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 		{ QSYS, "qsys" },
 		{ ANA, "ana" },
 		{ QS, "qs" },
-		{ HSIO, "hsio" },
 	};
 
 	if (!np && !pdev->dev.platform_data)
@@ -196,6 +197,14 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
 		ocelot->targets[res[i].id] = target;
 	}
 
+	hsio = syscon_regmap_lookup_by_compatible("mscc,ocelot-hsio");
+	if (IS_ERR(hsio)) {
+		dev_err(&pdev->dev, "missing hsio syscon\n");
+		return PTR_ERR(hsio);
+	}
+
+	ocelot->targets[HSIO] = hsio;
+
 	err = ocelot_chip_init(ocelot);
 	if (err)
 		return err;
-- 
git-series 0.9.1
