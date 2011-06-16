From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 05/11] dt: Add default match table for bus ids
Date: Wed, 15 Jun 2011 22:42:04 -0600
Message-ID: <20110616044200.29371.80953.stgit@ponder>
References: <20110616042653.29371.2052.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110616042653.29371.2052.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinu
List-Id: devicetree@vger.kernel.org

No need for most platforms to define their own bus table when calling
of_platform_populate().  Supply a stock one.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/platform.c       |    8 ++++++++
 include/linux/of_platform.h |    2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 9b785be..1f4a5d3 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -22,6 +22,14 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
+const struct of_device_id of_default_bus_match_table[] = {
+	{ .compatible = "simple-bus", },
+#ifdef CONFIG_ARM_AMBA
+	{ .compatible = "arm,amba-bus", },
+#endif /* CONFIG_ARM_AMBA */
+	{} /* Empty terminated list */
+};
+
 static int of_dev_node_match(struct device *dev, void *data)
 {
 	return dev->of_node == data;
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 43c723d..8390233 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -40,6 +40,8 @@ struct of_platform_driver
 #define	to_of_platform_driver(drv) \
 	container_of(drv,struct of_platform_driver, driver)
 
+extern const struct of_device_id of_default_bus_match_table[];
+
 /* Platform drivers register/unregister */
 extern struct platform_device *of_device_alloc(struct device_node *np,
 					 const char *bus_id,
