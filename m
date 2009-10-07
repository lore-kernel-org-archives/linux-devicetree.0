From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 12/12] of: merge of_find_all_nodes() implementations
Date: Tue, 06 Oct 2009 22:32:27 -0600
Message-ID: <20091007043219.16890.40203.stgit__20669.9955896058$1254890394$gmane$org@angua>
References: <20091007041007.16890.62194.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091007041007.16890.62194.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, microblaze-uclinux
List-Id: devicetree@vger.kernel.org

Merge common code between Microblaze and PowerPC, and make it available
to Sparc

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/kernel/prom.c |   23 -----------------------
 arch/powerpc/kernel/prom.c    |   23 -----------------------
 drivers/of/base.c             |   26 +++++++++++++++++++++++++-
 include/linux/of.h            |    3 ++-
 4 files changed, 27 insertions(+), 48 deletions(-)

diff --git a/arch/microblaze/kernel/prom.c b/arch/microblaze/kernel/prom.c
index c005cc6..b817df1 100644
--- a/arch/microblaze/kernel/prom.c
+++ b/arch/microblaze/kernel/prom.c
@@ -860,29 +860,6 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 EXPORT_SYMBOL(of_find_node_by_phandle);
 
 /**
- *	of_find_all_nodes - Get next node in global list
- *	@prev:	Previous node or NULL to start iteration
- *		of_node_put() will be called on it
- *
- *	Returns a node pointer with refcount incremented, use
- *	of_node_put() on it when done.
- */
-struct device_node *of_find_all_nodes(struct device_node *prev)
-{
-	struct device_node *np;
-
-	read_lock(&devtree_lock);
-	np = prev ? prev->allnext : allnodes;
-	for (; np != NULL; np = np->allnext)
-		if (of_node_get(np))
-			break;
-	of_node_put(prev);
-	read_unlock(&devtree_lock);
-	return np;
-}
-EXPORT_SYMBOL(of_find_all_nodes);
-
-/**
  *	of_node_get - Increment refcount of a node
  *	@node:	Node to inc refcount, NULL is supported to
  *		simplify writing of callers
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index d4405b9..4ec3008 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -1317,29 +1317,6 @@ struct device_node *of_find_next_cache_node(struct device_node *np)
 }
 
 /**
- *	of_find_all_nodes - Get next node in global list
- *	@prev:	Previous node or NULL to start iteration
- *		of_node_put() will be called on it
- *
- *	Returns a node pointer with refcount incremented, use
- *	of_node_put() on it when done.
- */
-struct device_node *of_find_all_nodes(struct device_node *prev)
-{
-	struct device_node *np;
-
-	read_lock(&devtree_lock);
-	np = prev ? prev->allnext : allnodes;
-	for (; np != 0; np = np->allnext)
-		if (of_node_get(np))
-			break;
-	of_node_put(prev);
-	read_unlock(&devtree_lock);
-	return np;
-}
-EXPORT_SYMBOL(of_find_all_nodes);
-
-/**
  *	of_node_get - Increment refcount of a node
  *	@node:	Node to inc refcount, NULL is supported to
  *		simplify writing of callers
diff --git a/drivers/of/base.c b/drivers/of/base.c
index ddf224d..e6627b2 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -9,7 +9,8 @@
  *
  *  Adapted for sparc and sparc64 by David S. Miller davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
  *
- *  Reconsolidated from arch/x/kernel/prom.c by Stephen Rothwell.
+ *  Reconsolidated from arch/x/kernel/prom.c by Stephen Rothwell and
+ *  Grant Likely.
  *
  *      This program is free software; you can redistribute it and/or
  *      modify it under the terms of the GNU General Public License
@@ -82,6 +83,29 @@ struct property *of_find_property(const struct device_node *np,
 }
 EXPORT_SYMBOL(of_find_property);
 
+/**
+ * of_find_all_nodes - Get next node in global list
+ * @prev:	Previous node or NULL to start iteration
+ *		of_node_put() will be called on it
+ *
+ * Returns a node pointer with refcount incremented, use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_find_all_nodes(struct device_node *prev)
+{
+	struct device_node *np;
+
+	read_lock(&devtree_lock);
+	np = prev ? prev->allnext : allnodes;
+	for (; np != NULL; np = np->allnext)
+		if (of_node_get(np))
+			break;
+	of_node_put(prev);
+	read_unlock(&devtree_lock);
+	return np;
+}
+EXPORT_SYMBOL(of_find_all_nodes);
+
 /*
  * Find a property with a given name for a given node
  * and return the value.
diff --git a/include/linux/of.h b/include/linux/of.h
index 4636bba..e7facd8 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -79,6 +79,8 @@ set_node_proc_entry(struct device_node *dn, struct proc_dir_entry *de)
 	dn->pde = de;
 }
 
+extern struct device_node *of_find_all_nodes(struct device_node *prev);
+
 #if defined(CONFIG_SPARC)
 /* Dummy ref counting routines - to be implemented later */
 static inline struct device_node *of_node_get(struct device_node *node)
@@ -90,7 +92,6 @@ static inline void of_node_put(struct device_node *node)
 }
 
 #else
-extern struct device_node *of_find_all_nodes(struct device_node *prev);
 extern struct device_node *of_node_get(struct device_node *node);
 extern void of_node_put(struct device_node *node);
 #endif
