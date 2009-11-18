From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: [PATCH 2/4] Merge of_detach_node
Date: Wed, 18 Nov 2009 15:45:52 -0600
Message-ID: <4B046B10.3040101@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com> <4B03620C.2060105@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B03620C.2060105-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Merge the common of_detach_node() from powerpc and microblaze into the common
drivers/of/of_dynamic.c

Updated patch that should apply cleanly to test-devicetree, now with diffstat
output.

Signed-off-by: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
---
 arch/microblaze/kernel/prom.c |   44 ------------------------------------------
 arch/powerpc/kernel/prom.c    |   44 ------------------------------------------
 drivers/of/of_dynamic.c       |   43 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 88 deletions(-)

Index: test-devicetree/arch/microblaze/kernel/prom.c
===================================================================
--- test-devicetree.orig/arch/microblaze/kernel/prom.c	2009-11-18 19:21:31.000000000 -0600
+++ test-devicetree/arch/microblaze/kernel/prom.c	2009-11-18 19:23:04.000000000 -0600
@@ -482,50 +482,6 @@
 }
 EXPORT_SYMBOL(of_node_put);
 
-/*
- * "Unplug" a node from the device tree.  The caller must hold
- * a reference to the node.  The memory associated with the node
- * is not freed until its refcount goes to zero.
- */
-void of_detach_node(struct device_node *np)
-{
-	struct device_node *parent;
-	unsigned long flags;
-
-	write_lock_irqsave(&devtree_lock, flags);
-
-	parent = np->parent;
-	if (!parent)
-		goto out_unlock;
-
-	if (allnodes == np)
-		allnodes = np->allnext;
-	else {
-		struct device_node *prev;
-		for (prev = allnodes;
-		     prev->allnext != np;
-		     prev = prev->allnext)
-			;
-		prev->allnext = np->allnext;
-	}
-
-	if (parent->child == np)
-		parent->child = np->sibling;
-	else {
-		struct device_node *prevsib;
-		for (prevsib = np->parent->child;
-		     prevsib->sibling != np;
-		     prevsib = prevsib->sibling)
-			;
-		prevsib->sibling = np->sibling;
-	}
-
-	of_node_set_flag(np, OF_DETACHED);
-
-out_unlock:
-	write_unlock_irqrestore(&devtree_lock, flags);
-}
-
 #if defined(CONFIG_DEBUG_FS) && defined(DEBUG)
 static struct debugfs_blob_wrapper flat_dt_blob;
 
Index: test-devicetree/arch/powerpc/kernel/prom.c
===================================================================
--- test-devicetree.orig/arch/powerpc/kernel/prom.c	2009-11-18 19:21:31.000000000 -0600
+++ test-devicetree/arch/powerpc/kernel/prom.c	2009-11-18 19:22:22.000000000 -0600
@@ -935,50 +935,6 @@
 }
 EXPORT_SYMBOL(of_node_put);
 
-/*
- * "Unplug" a node from the device tree.  The caller must hold
- * a reference to the node.  The memory associated with the node
- * is not freed until its refcount goes to zero.
- */
-void of_detach_node(struct device_node *np)
-{
-	struct device_node *parent;
-	unsigned long flags;
-
-	write_lock_irqsave(&devtree_lock, flags);
-
-	parent = np->parent;
-	if (!parent)
-		goto out_unlock;
-
-	if (allnodes == np)
-		allnodes = np->allnext;
-	else {
-		struct device_node *prev;
-		for (prev = allnodes;
-		     prev->allnext != np;
-		     prev = prev->allnext)
-			;
-		prev->allnext = np->allnext;
-	}
-
-	if (parent->child == np)
-		parent->child = np->sibling;
-	else {
-		struct device_node *prevsib;
-		for (prevsib = np->parent->child;
-		     prevsib->sibling != np;
-		     prevsib = prevsib->sibling)
-			;
-		prevsib->sibling = np->sibling;
-	}
-
-	of_node_set_flag(np, OF_DETACHED);
-
-out_unlock:
-	write_unlock_irqrestore(&devtree_lock, flags);
-}
-
 #ifdef CONFIG_PPC_PSERIES
 /*
  * Fix up the uninitialized fields in a new device node:
Index: test-devicetree/drivers/of/of_dynamic.c
===================================================================
--- test-devicetree.orig/drivers/of/of_dynamic.c	2009-11-18 19:21:31.000000000 -0600
+++ test-devicetree/drivers/of/of_dynamic.c	2009-11-18 19:22:22.000000000 -0600
@@ -34,3 +34,46 @@
 	write_unlock_irqrestore(&devtree_lock, flags);
 }
 
+/*
+ * "Unplug" a node from the device tree.  The caller must hold
+ * a reference to the node.  The memory associated with the node
+ * is not freed until its refcount goes to zero.
+ */
+void of_detach_node(struct device_node *np)
+{
+	struct device_node *parent;
+	unsigned long flags;
+
+	write_lock_irqsave(&devtree_lock, flags);
+
+	parent = np->parent;
+	if (!parent)
+		goto out_unlock;
+
+	if (allnodes == np)
+		allnodes = np->allnext;
+	else {
+		struct device_node *prev;
+		for (prev = allnodes;
+		     prev->allnext != np;
+		     prev = prev->allnext)
+			;
+		prev->allnext = np->allnext;
+	}
+
+	if (parent->child == np)
+		parent->child = np->sibling;
+	else {
+		struct device_node *prevsib;
+		for (prevsib = np->parent->child;
+		     prevsib->sibling != np;
+		     prevsib = prevsib->sibling)
+			;
+		prevsib->sibling = np->sibling;
+	}
+
+	of_node_set_flag(np, OF_DETACHED);
+
+out_unlock:
+	write_unlock_irqrestore(&devtree_lock, flags);
+}
