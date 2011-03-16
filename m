From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v2 1/5] dt: Refactor of_platform_bus_probe()
Date: Wed, 16 Mar 2011 02:33:33 -0600
Message-ID: <20110316083333.1154.48161.stgit@localhost6.localdomain6>
References: <20110316083046.1154.89723.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110316083046.1154.89723.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The current implementation uses three copies of of basically identical
code.  This patch consolidates them to make the code simpler.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/platform.c |   55 ++++++++++++++++---------------------------------
 1 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 1ce4c45..f489e36 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -210,13 +210,16 @@ struct platform_device *of_platform_device_create(struct device_node *np,
 EXPORT_SYMBOL(of_platform_device_create);
 
 /**
- * of_platform_bus_create - Create an OF device for a bus node and all its
- * children. Optionally recursively instantiate matching busses.
+ * of_platform_bus_create() - Create a device for a node and its children.
  * @bus: device node of the bus to instantiate
  * @matches: match table, NULL to use the default, OF_NO_DEEP_PROBE to
- * disallow recursive creation of child busses
+ * disallow recursive creation of child buses
+ * @parent: parent for new device, or NULL for top level.
+ *
+ * Creates a platform_device for the provided device_node, and optionally
+ * recursively create devices for all the child nodes.
  */
-static int of_platform_bus_create(const struct device_node *bus,
+static int of_platform_bus_create(struct device_node *bus,
 				  const struct of_device_id *matches,
 				  struct device *parent)
 {
@@ -224,18 +227,13 @@ static int of_platform_bus_create(const struct device_node *bus,
 	struct platform_device *dev;
 	int rc = 0;
 
+	dev = of_platform_device_create(bus, NULL, parent);
+	if (!dev || !of_match_node(matches, bus))
+		return 0;
+
 	for_each_child_of_node(bus, child) {
 		pr_debug("   create child: %s\n", child->full_name);
-		dev = of_platform_device_create(child, NULL, parent);
-		if (dev == NULL)
-			continue;
-
-		if (!of_match_node(matches, child))
-			continue;
-		if (rc == 0) {
-			pr_debug("   and sub busses\n");
-			rc = of_platform_bus_create(child, matches, &dev->dev);
-		}
+		rc = of_platform_bus_create(child, matches, &dev->dev);
 		if (rc) {
 			of_node_put(child);
 			break;
@@ -245,7 +243,7 @@ static int of_platform_bus_create(const struct device_node *bus,
 }
 
 /**
- * of_platform_bus_probe - Probe the device-tree for platform busses
+ * of_platform_bus_probe() - Probe the device-tree for platform buses
  * @root: parent of the first level to probe or NULL for the root of the tree
  * @matches: match table, NULL to use the default
  * @parent: parent to hook devices from, NULL for toplevel
@@ -258,7 +256,6 @@ int of_platform_bus_probe(struct device_node *root,
 			  struct device *parent)
 {
 	struct device_node *child;
-	struct platform_device *dev;
 	int rc = 0;
 
 	if (WARN_ON(!matches || matches == OF_NO_DEEP_PROBE))
@@ -277,31 +274,15 @@ int of_platform_bus_probe(struct device_node *root,
 	 * children
 	 */
 	if (of_match_node(matches, root)) {
-		pr_debug(" root match, create all sub devices\n");
-		dev = of_platform_device_create(root, NULL, parent);
-		if (dev == NULL)
-			goto bail;
-
-		pr_debug(" create all sub busses\n");
-		rc = of_platform_bus_create(root, matches, &dev->dev);
-		goto bail;
-	}
-	for_each_child_of_node(root, child) {
+		rc = of_platform_bus_create(root, matches, parent);
+	} else for_each_child_of_node(root, child) {
 		if (!of_match_node(matches, child))
 			continue;
-
-		pr_debug("  match: %s\n", child->full_name);
-		dev = of_platform_device_create(child, NULL, parent);
-		if (dev == NULL)
-			continue;
-
-		rc = of_platform_bus_create(child, matches, &dev->dev);
-		if (rc) {
-			of_node_put(child);
+		rc = of_platform_bus_create(child, matches, parent);
+		if (rc)
 			break;
-		}
 	}
- bail:
+
 	of_node_put(root);
 	return rc;
 }
