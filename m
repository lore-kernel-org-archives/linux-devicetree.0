From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 1/3] of_mdio: mdio_device_create() never returns NULL
Date: Sun, 13 Mar 2016 00:33:13 +0300
Message-ID: <12055464.9Z0A9VL5sH@wasted.cogentembedded.com>
References: <2682275.WNlbxTfNal@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <2682275.WNlbxTfNal@wasted.cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

mdio_device_create() never returns NULL, thus checking for it in
of_mdiobus_register_device() is pointless...

Suggested-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- new patch.

 drivers/of/of_mdio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: net-next/drivers/of/of_mdio.c
===================================================================
--- net-next.orig/drivers/of/of_mdio.c
+++ net-next/drivers/of/of_mdio.c
@@ -98,7 +98,7 @@ static int of_mdiobus_register_device(st
 	int rc;
 
 	mdiodev = mdio_device_create(mdio, addr);
-	if (!mdiodev || IS_ERR(mdiodev))
+	if (IS_ERR(mdiodev))
 		return 1;
 
 	/* Associate the OF node with the device structure so it
