From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] of_mdio: use IS_ERR_OR_NULL()
Date: Sat, 12 Mar 2016 01:12:48 +0300
Message-ID: <3305414.rAFdOb57tB@wasted.cogentembedded.com>
References: <4882738.uyje2ICxKW@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4882738.uyje2ICxKW@wasted.cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

IS_ERR_OR_NULL() is open coded in of_mdiobus_register_{phy|device}(), so
just call it directly...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/of/of_mdio.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: net-next/drivers/of/of_mdio.c
===================================================================
--- net-next.orig/drivers/of/of_mdio.c
+++ net-next/drivers/of/of_mdio.c
@@ -56,7 +56,7 @@ static int of_mdiobus_register_phy(struc
 		phy = phy_device_create(mdio, addr, phy_id, 0, NULL);
 	else
 		phy = get_phy_device(mdio, addr, is_c45);
-	if (!phy || IS_ERR(phy))
+	if (IS_ERR_OR_NULL(phy))
 		return 1;
 
 	rc = irq_of_parse_and_map(child, 0);
@@ -98,7 +98,7 @@ static int of_mdiobus_register_device(st
 	int rc;
 
 	mdiodev = mdio_device_create(mdio, addr);
-	if (!mdiodev || IS_ERR(mdiodev))
+	if (IS_ERR_OR_NULL(mdiodev))
 		return 1;
 
 	/* Associate the OF node with the device structure so it
