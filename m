From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] [RFC] of/platform: Make of_dev_node_match() helper public
Date: Fri,  5 May 2017 16:52:41 +0200
Message-ID: <1493995961-11828-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Several drivers provide their own match functions, identical to
of_dev_node_match() in the OF platform core.

Reduce duplication by making of_dev_node_match() public.
To avoid conflicts, the duplicates in coresight and i2c must be removed
at the same time.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Is "of_dev_node_match()" a suitable name for a public API?
If another (non-conflicting) name is chosen, the conversion of coresight
and i2c can be moved into a separate patch.

TODO: Convert all other code using (non-const) match functions with
different names, but doing exactly the same.
---
 drivers/hwtracing/coresight/of_coresight.c | 5 -----
 drivers/i2c/i2c-core.c                     | 5 -----
 drivers/of/platform.c                      | 2 +-
 include/linux/of_platform.h                | 1 +
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
index 629e031b745651f1..62e8208759dbebc9 100644
--- a/drivers/hwtracing/coresight/of_coresight.c
+++ b/drivers/hwtracing/coresight/of_coresight.c
@@ -25,11 +25,6 @@
 #include <asm/smp_plat.h>
 
 
-static int of_dev_node_match(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static struct device *
 of_coresight_get_endpoint_device(struct device_node *endpoint)
 {
diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 7a065c4260f30be4..d545ef4eba2c3571 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -1830,11 +1830,6 @@ static void of_i2c_register_devices(struct i2c_adapter *adap)
 	of_node_put(bus);
 }
 
-static int of_dev_node_match(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 /* must call put_device() when done with returned i2c_client device */
 struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 {
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 71fecc2debfc940a..5e70725ff6f984b4 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -37,7 +37,7 @@ const struct of_device_id of_default_bus_match_table[] = {
 	{} /* Empty terminated list */
 };
 
-static int of_dev_node_match(struct device *dev, void *data)
+int of_dev_node_match(struct device *dev, void *data)
 {
 	return dev->of_node == data;
 }
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index dc8224ae28d5d9e6..7346ba02553b4761 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -57,6 +57,7 @@ extern const struct of_device_id of_default_bus_match_table[];
 extern struct platform_device *of_device_alloc(struct device_node *np,
 					 const char *bus_id,
 					 struct device *parent);
+extern int of_dev_node_match(struct device *dev, void *data);
 extern struct platform_device *of_find_device_by_node(struct device_node *np);
 
 /* Platform devices and busses creation */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
