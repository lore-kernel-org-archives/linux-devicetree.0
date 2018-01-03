From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv1 2/6] net: dsa: mv88e6xxx: add 88E6240 DT compatible
Date: Wed,  3 Jan 2018 13:26:05 +0100
Message-ID: <20180103122609.5482-3-sebastian.reichel@collabora.co.uk>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Add compatible for Marvell 88E6240 switch.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 Documentation/devicetree/bindings/net/dsa/marvell.txt | 6 ++++--
 drivers/net/dsa/mv88e6xxx/chip.c                      | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Documentation/devicetree/bindings/net/dsa/marvell.txt
index 1d4d0f49c9d0..cf437b526f7f 100644
--- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
+++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
@@ -14,8 +14,10 @@ The properties described here are those specific to Marvell devices.
 Additional required and optional properties can be found in dsa.txt.
 
 Required properties:
-- compatible		: Should be one of "marvell,mv88e6085" or
-			  "marvell,mv88e6190"
+- compatible		: Should be one of the following
+ * "marvell,mv88e6085"
+ * "marvell,mv88e6190"
+ * "marvell,mv88e6240"
 - reg			: Address on the MII bus for the switch.
 
 Optional properties:
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 66d33e97cbc5..78ff06239b58 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -4012,6 +4012,10 @@ static const struct of_device_id mv88e6xxx_of_match[] = {
 		.compatible = "marvell,mv88e6190",
 		.data = &mv88e6xxx_table[MV88E6190],
 	},
+	{
+		.compatible = "marvell,mv88e6240",
+		.data = &mv88e6xxx_table[MV88E6240],
+	},
 	{ /* sentinel */ },
 };
 
-- 
2.15.1
