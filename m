From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] of/flattree: merge of_find_node_by_phandle
Date: Wed, 09 Dec 2009 17:44:40 +0800
Message-ID: <1260351880.769347.673092420055.1.gpush@pororo>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Merge common function between powerpc, sparc and microblaze. Code is
identical for powerpc and microblaze, but adds a lock (and release) of
the devtree_lock on sparc.

Currently untested.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 arch/microblaze/kernel/prom.c   |   21 ---------------------
 arch/powerpc/kernel/prom.c      |   21 ---------------------
 arch/sparc/kernel/prom_common.c |   12 ------------
 drivers/of/base.c               |   21 +++++++++++++++++++++
 4 files changed, 21 insertions(+), 54 deletions(-)

diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
index 9b4a20b..3fac1e2 100644
--- a/arch/microblaze/kernel/prom.c
+++ b/arch/microblaze/kernel/prom.c
@@ -238,27 +238,6 @@ void __init early_init_devtree_arch(void)
  *
  *******/
 
-/**
- *	of_find_node_by_phandle - Find a node given a phandle
- *	@handle:	phandle of the node to find
- *
- *	Returns a node pointer with refcount incremented, use
- *	of_node_put() on it when done.
- */
-struct device_node *of_find_node_by_phandle(phandle handle)
-{
-	struct device_node *np;
-
-	read_lock(&devtree_lock);
-	for (np = allnodes; np != NULL; np = np->allnext)
-		if (np->phandle == handle)
-			break;
-	of_node_get(np);
-	read_unlock(&devtree_lock);
-	return np;
-}
-EXPORT_SYMBOL(of_find_node_by_phandle);
-
 #if defined(CONFIG_DEBUG_FS) && defined(DEBUG)
 static struct debugfs_blob_wrapper flat_dt_blob;
 
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index d3ce311..83161d0 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -689,27 +689,6 @@ void __init early_init_devtree_arch(void)
  *******/
 
 /**
- *	of_find_node_by_phandle - Find a node given a phandle
- *	@handle:	phandle of the node to find
- *
- *	Returns a node pointer with refcount incremented, use
- *	of_node_put() on it when done.
- */
-struct device_node *of_find_node_by_phandle(phandle handle)
-{
-	struct device_node *np;
-
-	read_lock(&devtree_lock);
-	for (np = allnodes; np != 0; np = np->allnext)
-		if (np->phandle == handle)
-			break;
-	of_node_get(np);
-	read_unlock(&devtree_lock);
-	return np;
-}
-EXPORT_SYMBOL(of_find_node_by_phandle);
-
-/**
  *	of_find_next_cache_node - Find a node's subsidiary cache
  *	@np:	node of type "cpu" or "cache"
  *
diff --git a/arch/sparc/kernel/prom_common.c b/arch/sparc/kernel/prom_common.c
index 5832e13..57ac9e2 100644
--- a/arch/sparc/kernel/prom_common.c
+++ b/arch/sparc/kernel/prom_common.c
@@ -37,18 +37,6 @@ EXPORT_SYMBOL(of_console_path);
 char *of_console_options;
 EXPORT_SYMBOL(of_console_options);
 
-struct device_node *of_find_node_by_phandle(phandle handle)
-{
-	struct device_node *np;
-
-	for (np = allnodes; np; np = np->allnext)
-		if (np->phandle == handle)
-			break;
-
-	return np;
-}
-EXPORT_SYMBOL(of_find_node_by_phandle);
-
 int of_getintprop_default(struct device_node *np, const char *name, int def)
 {
 	struct property *prop;
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9212b87..b1c2159 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -672,6 +672,27 @@ int of_modalias_node(struct device_node *node, char *modalias, int len)
 EXPORT_SYMBOL_GPL(of_modalias_node);
 
 /**
+ * of_find_node_by_phandle - Find a node given a phandle
+ * @handle:	phandle of the node to find
+ *
+ * Returns a node pointer with refcount incremented, use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_find_node_by_phandle(phandle handle)
+{
+	struct device_node *np;
+
+	read_lock(&devtree_lock);
+	for (np = allnodes; np != 0; np = np->allnext)
+		if (np->phandle == handle)
+			break;
+	of_node_get(np);
+	read_unlock(&devtree_lock);
+	return np;
+}
+EXPORT_SYMBOL(of_find_node_by_phandle);
+
+/**
  * of_parse_phandle - Resolve a phandle property to a device_node pointer
  * @np: Pointer to device node holding phandle property
  * @phandle_name: Name of property holding a phandle value
