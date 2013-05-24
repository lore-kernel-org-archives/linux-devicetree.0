From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 1/3] drivers: mfd: refactor the vexpress config bridge API
Date: Fri, 24 May 2013 13:53:04 +0100
Message-ID: <1369399986-15649-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369399986-15649-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Achin Gupta <achin.gupta-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>

The introduction of Serial Power Controller (SPC) requires the vexpress
config interface to change slightly since the SPC memory mapped interface
can be used as configuration bus but also for operating points
programming and retrieval. The helper that allocates the bridge functions
requires an additional parameter allowing to request component specific
functions that need not be initialized through device tree bindings but
just using simple look-up and statically defined constants.

This patch introduces the necessary changes to the vexpress config layer
to cater for the new vexpress bridge interface requirements.

Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Achin Gupta <achin.gupta-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 drivers/mfd/vexpress-config.c | 61 ++++++----
 drivers/mfd/vexpress-sysreg.c |  2 +-
 include/linux/vexpress.h      | 16 ++-
 3 files changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/vexpress-config.c b/drivers/mfd/vexpress-config.c
index 84ce6b9..1af2b0e 100644
--- a/drivers/mfd/vexpress-config.c
+++ b/drivers/mfd/vexpress-config.c
@@ -86,29 +86,13 @@ void vexpress_config_bridge_unregister(struct vexpress_config_bridge *bridge)
 }
 EXPORT_SYMBOL(vexpress_config_bridge_unregister);
 
-
-struct vexpress_config_func {
-	struct vexpress_config_bridge *bridge;
-	void *func;
-};
-
-struct vexpress_config_func *__vexpress_config_func_get(struct device *dev,
-		struct device_node *node)
+static struct vexpress_config_bridge *
+		vexpress_config_bridge_find(struct device_node *node)
 {
-	struct device_node *bridge_node;
-	struct vexpress_config_func *func;
 	int i;
+	struct vexpress_config_bridge *res = NULL;
+	struct device_node *bridge_node = of_node_get(node);
 
-	if (WARN_ON(dev && node && dev->of_node != node))
-		return NULL;
-	if (dev && !node)
-		node = dev->of_node;
-
-	func = kzalloc(sizeof(*func), GFP_KERNEL);
-	if (!func)
-		return NULL;
-
-	bridge_node = of_node_get(node);
 	while (bridge_node) {
 		const __be32 *prop = of_get_property(bridge_node,
 				"arm,vexpress,config-bridge", NULL);
@@ -129,13 +113,46 @@ struct vexpress_config_func *__vexpress_config_func_get(struct device *dev,
 
 		if (test_bit(i, vexpress_config_bridges_map) &&
 				bridge->node == bridge_node) {
-			func->bridge = bridge;
-			func->func = bridge->info->func_get(dev, node);
+			res = bridge;
 			break;
 		}
 	}
 	mutex_unlock(&vexpress_config_bridges_mutex);
 
+	return res;
+}
+
+
+struct vexpress_config_func {
+	struct vexpress_config_bridge *bridge;
+	void *func;
+};
+
+struct vexpress_config_func *__vexpress_config_func_get(
+		struct vexpress_config_bridge *bridge,
+		struct device *dev,
+		struct device_node *node,
+		const char *id)
+{
+	struct vexpress_config_func *func;
+
+	if (WARN_ON(dev && node && dev->of_node != node))
+		return NULL;
+	if (dev && !node)
+		node = dev->of_node;
+
+	if (!bridge)
+		bridge = vexpress_config_bridge_find(node);
+	if (!bridge)
+		return NULL;
+
+	func = kzalloc(sizeof(*func), GFP_KERNEL);
+	if (!func)
+		return NULL;
+
+	func->bridge = bridge;
+	func->func = bridge->info->func_get(dev, node, id);
+
 	if (!func->func) {
 		of_node_put(node);
 		kfree(func);
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index 96a020b..d2599aa 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -165,7 +165,7 @@ static u32 *vexpress_sysreg_config_data;
 static int vexpress_sysreg_config_tries;
 
 static void *vexpress_sysreg_config_func_get(struct device *dev,
-		struct device_node *node)
+		struct device_node *node, const char *id)
 {
 	struct vexpress_sysreg_config_func *config_func;
 	u32 site;
diff --git a/include/linux/vexpress.h b/include/linux/vexpress.h
index 6e7980d..50368e0 100644
--- a/include/linux/vexpress.h
+++ b/include/linux/vexpress.h
@@ -68,7 +68,8 @@
  */
 struct vexpress_config_bridge_info {
 	const char *name;
-	void *(*func_get)(struct device *dev, struct device_node *node);
+	void *(*func_get)(struct device *dev, struct device_node *node,
+			  const char *id);
 	void (*func_put)(void *func);
 	int (*func_exec)(void *func, int offset, bool write, u32 *data);
 };
@@ -87,12 +88,17 @@ void vexpress_config_complete(struct vexpress_config_bridge *bridge,
 
 struct vexpress_config_func;
 
-struct vexpress_config_func *__vexpress_config_func_get(struct device *dev,
-		struct device_node *node);
+struct vexpress_config_func *__vexpress_config_func_get(
+		struct vexpress_config_bridge *bridge,
+		struct device *dev,
+		struct device_node *node,
+		const char *id);
+#define vexpress_config_func_get(bridge, id) \
+		__vexpress_config_func_get(bridge, NULL, NULL, id)
 #define vexpress_config_func_get_by_dev(dev) \
-		__vexpress_config_func_get(dev, NULL)
+		__vexpress_config_func_get(NULL, dev, NULL, NULL)
 #define vexpress_config_func_get_by_node(node) \
-		__vexpress_config_func_get(NULL, node)
+		__vexpress_config_func_get(NULL, NULL, node, NULL)
 void vexpress_config_func_put(struct vexpress_config_func *func);
 
 /* Both may sleep! */
-- 
1.8.2.2
