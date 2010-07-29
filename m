From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/platform: Register of_platform_drivers with an "of:" prefix
Date: Thu, 29 Jul 2010 17:57:41 -0600
Message-ID: <20100729235741.19423.77412.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently there are some drivers in tree which register both a
platform_driver and an of_platform_driver with the same name.  This is
a temporary situation until all the relevant of_platform_drivers are
converted to be normal platform_drivers.  Until then, this patch gives
all the of_platform_drivers an "of:" prefix to protect against bogus
matches and namespace conflicts.
---
 drivers/of/platform.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index da10181..a6dbfd5 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -74,8 +74,22 @@ static void platform_driver_shutdown_shim(struct platform_device *pdev)
  */
 int of_register_platform_driver(struct of_platform_driver *drv)
 {
+	char *of_name;
+
 	/* setup of_platform_driver to platform_driver adaptors */
 	drv->platform_driver.driver = drv->driver;
+
+	/* Prefix the driver name with 'of:' to avoid namespace collisions
+	 * and bogus matches.  There are some drivers in the tree that
+	 * register both an of_platform_driver and a platform_driver with
+	 * the same name.  This is a temporary measure until they are all
+	 * cleaned up --gcl July 29, 2010 */
+	of_name = kmalloc(strlen(drv->driver.name) + 5, GFP_KERNEL);
+	if (!of_name)
+		return -ENOMEM;
+	sprintf(of_name, "of:%s", drv->driver.name);
+	drv->platform_driver.driver.name = of_name;
+
 	if (drv->probe)
 		drv->platform_driver.probe = platform_driver_probe_shim;
 	drv->platform_driver.remove = drv->remove;
@@ -91,6 +105,8 @@ EXPORT_SYMBOL(of_register_platform_driver);
 void of_unregister_platform_driver(struct of_platform_driver *drv)
 {
 	platform_driver_unregister(&drv->platform_driver);
+	kfree(drv->platform_driver.driver.name);
+	drv->platform_driver.driver.name = NULL;
 }
 EXPORT_SYMBOL(of_unregister_platform_driver);
