From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/1] of_mdio: Remove unused variable
Date: Fri, 23 May 2014 16:48:02 +0530
Message-ID: <1400843883-28399-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

max_speed is no longer used. Remove it.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/of_mdio.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index b85709458639..7c6e277cdd1f 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -46,7 +46,6 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio, struct device_node *chi
 	struct phy_device *phy;
 	bool is_c45;
 	int rc;
-	u32 max_speed = 0;
 	u32 phy_id;
 
 	is_c45 = of_device_is_compatible(child,
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
