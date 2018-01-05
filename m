From: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH net] of_mdio: avoid MDIO bus removal when a PHY is missing
Date: Fri, 5 Jan 2018 11:36:14 +0200
Message-ID: <1515144974-31377-1-git-send-email-madalin.bucur@nxp.com>
Reply-To: <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If one of the child devices is missing the of_mdiobus_register_phy()
call will return -ENODEV. When a missing device is encountered the
registration of the remaining PHYs is stopped and the MDIO bus will
fail to register. Propagate all errors except ENODEV to avoid it.

Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
---
 drivers/of/of_mdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 3481e69..93d41275 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -231,7 +231,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 			rc = of_mdiobus_register_phy(mdio, child, addr);
 		else
 			rc = of_mdiobus_register_device(mdio, child, addr);
-		if (rc)
+		if (rc && rc != -ENODEV)
 			goto unregister;
 	}
 
@@ -255,7 +255,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 
 			if (of_mdiobus_child_is_phy(child)) {
 				rc = of_mdiobus_register_phy(mdio, child, addr);
-				if (rc)
+				if (rc && rc != -ENODEV)
 					goto unregister;
 			}
 		}
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
