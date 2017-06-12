From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] mdio_bus: use devm_gpiod_get_optional()
Date: Mon, 12 Jun 2017 23:55:39 +0300
Message-ID: <20170612210551.696721345__12621.0674913184$1497301575$gmane$org@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline; filename=mdio_bus-use-devm_gpiod_get_optional.patch
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

The MDIO reset GPIO is really a classical optional GPIO property case,
so devm_gpiod_get_optional() should have been used, not devm_gpiod_get().
Doing this  saves several LoCs...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/phy/mdio_bus.c |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

Index: net-next/drivers/net/phy/mdio_bus.c
===================================================================
--- net-next.orig/drivers/net/phy/mdio_bus.c
+++ net-next/drivers/net/phy/mdio_bus.c
@@ -354,16 +354,12 @@ int __mdiobus_register(struct mii_bus *b
 	mutex_init(&bus->mdio_lock);
 
 	/* de-assert bus level PHY GPIO reset */
-	gpiod = devm_gpiod_get(&bus->dev, "reset", GPIOD_OUT_LOW);
+	gpiod = devm_gpiod_get_optional(&bus->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(gpiod)) {
-		err = PTR_ERR(gpiod);
-		if (err != -ENOENT) {
-			dev_err(&bus->dev,
-				"mii_bus %s couldn't get reset GPIO\n",
-				bus->id);
-			return err;
-		}
-	} else	{
+		dev_err(&bus->dev, "mii_bus %s couldn't get reset GPIO\n",
+			bus->id);
+		return PTR_ERR(gpiod);
+	} else	if (gpiod) {
 		bus->reset_gpiod = gpiod;
 
 		gpiod_set_value_cansleep(gpiod, 1);
