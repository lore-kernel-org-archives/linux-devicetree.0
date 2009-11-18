From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: [PATCH 1/4] Merge of_attach_node
Date: Tue, 17 Nov 2009 20:53:29 -0600
Message-ID: <4B0361A9.20209@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B030FC2.9070401-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Merge the common of_attach_node() routine from powerpc and microblaze to
drivers/of/of_dynamic.c

Signed-off-by: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
---

Index: test-devicetree/arch/microblaze/kernel/prom.c
===================================================================
--- test-devicetree.orig/arch/microblaze/kernel/prom.c	2009-11-17 13:52:45.000000000 -0600
+++ test-devicetree/arch/microblaze/kernel/prom.c	2009-11-17 14:17:05.000000000 -0600
@@ -957,21 +957,6 @@
 EXPORT_SYMBOL(of_node_put);
 
 /*
- * Plug a device node into the tree and global list.
- */
-void of_attach_node(struct device_node *np)
-{
-	unsigned long flags;
-
-	write_lock_irqsave(&devtree_lock, flags);
-	np->sibling = np->parent->child;
-	np->allnext = allnodes;
-	np->parent->child = np;
-	allnodes = np;
-	write_unlock_irqrestore(&devtree_lock, flags);
-}
-
-/*
  * "Unplug" a node from the device tree.  The caller must hold
  * a reference to the node.  The memory associated with the node
  * is not freed until its refcount goes to zero.
Index: test-devicetree/arch/powerpc/kernel/prom.c
===================================================================
--- test-devicetree.orig/arch/powerpc/kernel/prom.c	2009-11-17 13:52:45.000000000 -0600
+++ test-devicetree/arch/powerpc/kernel/prom.c	2009-11-17 14:17:05.000000000 -0600
@@ -1413,21 +1413,6 @@
 EXPORT_SYMBOL(of_node_put);
 
 /*
- * Plug a device node into the tree and global list.
- */
-void of_attach_node(struct device_node *np)
-{
-	unsigned long flags;
-
-	write_lock_irqsave(&devtree_lock, flags);
-	np->sibling = np->parent->child;
-	np->allnext = allnodes;
-	np->parent->child = np;
-	allnodes = np;
-	write_unlock_irqrestore(&devtree_lock, flags);
-}
-
-/*
  * "Unplug" a node from the device tree.  The caller must hold
  * a reference to the node.  The memory associated with the node
  * is not freed until its refcount goes to zero.
Index: test-devicetree/drivers/of/of_dynamic.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ test-devicetree/drivers/of/of_dynamic.c	2009-11-17 14:18:11.000000000 -0600
@@ -0,0 +1,36 @@
+/*
+ * Procedures for creating, accessing and interpreting the device tree.
+ *
+ * Paul Mackerras	August 1996.
+ * Copyright (C) 1996-2005 Paul Mackerras.
+ *
+ *  Adapted for 64bit PowerPC by Dave Engebretsen and Peter Bergner.
+ *    {engebret|bergner}@us.ibm.com
+ *
+ *      This program is free software; you can redistribute it and/or
+ *      modify it under the terms of the GNU General Public License
+ *      as published by the Free Software Foundation; either version
+ *      2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/of.h>
+
+/* temporary while merging */
+extern struct device_node *allnodes;
+extern rwlock_t devtree_lock;
+
+/*
+ * Plug a device node into the tree and global list.
+ */
+void of_attach_node(struct device_node *np)
+{
+	unsigned long flags;
+
+	write_lock_irqsave(&devtree_lock, flags);
+	np->sibling = np->parent->child;
+	np->allnext = allnodes;
+	np->parent->child = np;
+	allnodes = np;
+	write_unlock_irqrestore(&devtree_lock, flags);
+}
+
