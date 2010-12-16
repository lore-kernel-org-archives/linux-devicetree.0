From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/3] of: platform: introduce of_probe_platform_driver()
Date: Thu, 16 Dec 2010 18:13:57 +0100
Message-ID: <1292519639-21859-2-git-send-email-w.sang@pengutronix.de>
References: <1292519639-21859-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1292519639-21859-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Introduce a function equivalent to platform_driver_probe() for of. This is
needed to keep some SoC devices in the __init section.

Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/of/platform.c       |   30 +++++++++++++++++++++++++++---
 include/linux/of_platform.h |    2 ++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 5b4a07f..511657b 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -72,7 +72,7 @@ static void platform_driver_shutdown_shim(struct platform_device *pdev)
 /**
  * of_register_platform_driver
  */
-int of_register_platform_driver(struct of_platform_driver *drv)
+int __of_register_platform_driver(struct of_platform_driver *drv, bool do_probe)
 {
 	char *of_name;
 
@@ -90,18 +90,42 @@ int of_register_platform_driver(struct of_platform_driver *drv)
 	sprintf(of_name, "of:%s", drv->driver.name);
 	drv->platform_driver.driver.name = of_name;
 
-	if (drv->probe)
-		drv->platform_driver.probe = platform_driver_probe_shim;
 	drv->platform_driver.remove = drv->remove;
 	if (drv->shutdown)
 		drv->platform_driver.shutdown = platform_driver_shutdown_shim;
 	drv->platform_driver.suspend = drv->suspend;
 	drv->platform_driver.resume = drv->resume;
 
+	if (do_probe)
+		return platform_driver_probe(&drv->platform_driver,
+					platform_driver_probe_shim);
+
+	if (drv->probe)
+		drv->platform_driver.probe = platform_driver_probe_shim;
+
 	return platform_driver_register(&drv->platform_driver);
 }
+
+int of_register_platform_driver(struct of_platform_driver *drv)
+{
+	return __of_register_platform_driver(drv, false);
+}
+
 EXPORT_SYMBOL(of_register_platform_driver);
 
+int of_probe_platform_driver(struct of_platform_driver *drv,
+		int (*probe)(struct platform_device *, const struct of_device_id *match))
+{
+	int ret;
+
+	drv->probe = probe;
+	ret = __of_register_platform_driver(drv, true);
+	drv->probe = NULL;
+
+	return ret;
+}
+EXPORT_SYMBOL(of_probe_platform_driver);
+
 void of_unregister_platform_driver(struct of_platform_driver *drv)
 {
 	platform_driver_unregister(&drv->platform_driver);
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index a68716a..c4082c7 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -53,6 +53,8 @@ extern void of_unregister_driver(struct of_platform_driver *drv);
 
 /* Platform drivers register/unregister */
 extern int of_register_platform_driver(struct of_platform_driver *drv);
+extern int of_probe_platform_driver(struct of_platform_driver *drv,
+		int (*probe)(struct platform_device *, const struct of_device_id *match));
 extern void of_unregister_platform_driver(struct of_platform_driver *drv);
 
 extern struct platform_device *of_device_alloc(struct device_node *np,
-- 
1.7.2.3
