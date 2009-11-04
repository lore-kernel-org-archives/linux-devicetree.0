From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: [RFC PATCH 4/5] Microblaze updates for OF dynamic code
Date: Wed, 04 Nov 2009 16:19:32 -0600
Message-ID: <4AF1FDF4.2000308@austin.ibm.com>
References: <4AF1FB29.50905@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4AF1FB29.50905-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch removes the common OF dynamic device tree updating from the
microblaze prom.c file to now use the generic OF code.

NOTE:  I have no means of building and testing for the microblaze architecture.
I'll sign off on this with the understanding that it has not even passed the
compile test yet.

Signed-off-by: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
---

Index: linux-next/arch/microblaze/kernel/prom.c
===================================================================
--- linux-next.orig/arch/microblaze/kernel/prom.c	2009-11-03 13:20:25.000000000 -0600
+++ linux-next/arch/microblaze/kernel/prom.c	2009-11-03 14:01:34.000000000 -0600
@@ -30,6 +30,7 @@
 #include <linux/debugfs.h>
 #include <linux/irq.h>
 #include <linux/lmb.h>
+#include <linux/of.h>
 
 #include <asm/prom.h>
 #include <asm/page.h>
@@ -859,252 +860,6 @@
 }
 EXPORT_SYMBOL(of_find_node_by_phandle);
 
-/**
- *	of_node_get - Increment refcount of a node
- *	@node:	Node to inc refcount, NULL is supported to
- *		simplify writing of callers
- *
- *	Returns node.
- */
-struct device_node *of_node_get(struct device_node *node)
-{
-	if (node)
-		kref_get(&node->kref);
-	return node;
-}
-EXPORT_SYMBOL(of_node_get);
-
-static inline struct device_node *kref_to_device_node(struct kref *kref)
-{
-	return container_of(kref, struct device_node, kref);
-}
-
-/**
- *	of_node_release - release a dynamically allocated node
- *	@kref:  kref element of the node to be released
- *
- *	In of_node_put() this function is passed to kref_put()
- *	as the destructor.
- */
-static void of_node_release(struct kref *kref)
-{
-	struct device_node *node = kref_to_device_node(kref);
-	struct property *prop = node->properties;
-
-	/* We should never be releasing nodes that haven't been detached. */
-	if (!of_node_check_flag(node, OF_DETACHED)) {
-		printk(KERN_INFO "WARNING: Bad of_node_put() on %s\n",
-			node->full_name);
-		dump_stack();
-		kref_init(&node->kref);
-		return;
-	}
-
-	if (!of_node_check_flag(node, OF_DYNAMIC))
-		return;
-
-	while (prop) {
-		struct property *next = prop->next;
-		kfree(prop->name);
-		kfree(prop->value);
-		kfree(prop);
-		prop = next;
-
-		if (!prop) {
-			prop = node->deadprops;
-			node->deadprops = NULL;
-		}
-	}
-	kfree(node->full_name);
-	kfree(node->data);
-	kfree(node);
-}
-
-/**
- *	of_node_put - Decrement refcount of a node
- *	@node:	Node to dec refcount, NULL is supported to
- *		simplify writing of callers
- *
- */
-void of_node_put(struct device_node *node)
-{
-	if (node)
-		kref_put(&node->kref, of_node_release);
-}
-EXPORT_SYMBOL(of_node_put);
-
-/*
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
-/*
- * Add a property to a node
- */
-int prom_add_property(struct device_node *np, struct property *prop)
-{
-	struct property **next;
-	unsigned long flags;
-
-	prop->next = NULL;
-	write_lock_irqsave(&devtree_lock, flags);
-	next = &np->properties;
-	while (*next) {
-		if (strcmp(prop->name, (*next)->name) == 0) {
-			/* duplicate ! don't insert it */
-			write_unlock_irqrestore(&devtree_lock, flags);
-			return -1;
-		}
-		next = &(*next)->next;
-	}
-	*next = prop;
-	write_unlock_irqrestore(&devtree_lock, flags);
-
-#ifdef CONFIG_PROC_DEVICETREE
-	/* try to add to proc as well if it was initialized */
-	if (np->pde)
-		proc_device_tree_add_prop(np->pde, prop);
-#endif /* CONFIG_PROC_DEVICETREE */
-
-	return 0;
-}
-
-/*
- * Remove a property from a node.  Note that we don't actually
- * remove it, since we have given out who-knows-how-many pointers
- * to the data using get-property.  Instead we just move the property
- * to the "dead properties" list, so it won't be found any more.
- */
-int prom_remove_property(struct device_node *np, struct property *prop)
-{
-	struct property **next;
-	unsigned long flags;
-	int found = 0;
-
-	write_lock_irqsave(&devtree_lock, flags);
-	next = &np->properties;
-	while (*next) {
-		if (*next == prop) {
-			/* found the node */
-			*next = prop->next;
-			prop->next = np->deadprops;
-			np->deadprops = prop;
-			found = 1;
-			break;
-		}
-		next = &(*next)->next;
-	}
-	write_unlock_irqrestore(&devtree_lock, flags);
-
-	if (!found)
-		return -ENODEV;
-
-#ifdef CONFIG_PROC_DEVICETREE
-	/* try to remove the proc node as well */
-	if (np->pde)
-		proc_device_tree_remove_prop(np->pde, prop);
-#endif /* CONFIG_PROC_DEVICETREE */
-
-	return 0;
-}
-
-/*
- * Update a property in a node.  Note that we don't actually
- * remove it, since we have given out who-knows-how-many pointers
- * to the data using get-property.  Instead we just move the property
- * to the "dead properties" list, and add the new property to the
- * property list
- */
-int prom_update_property(struct device_node *np,
-			 struct property *newprop,
-			 struct property *oldprop)
-{
-	struct property **next;
-	unsigned long flags;
-	int found = 0;
-
-	write_lock_irqsave(&devtree_lock, flags);
-	next = &np->properties;
-	while (*next) {
-		if (*next == oldprop) {
-			/* found the node */
-			newprop->next = oldprop->next;
-			*next = newprop;
-			oldprop->next = np->deadprops;
-			np->deadprops = oldprop;
-			found = 1;
-			break;
-		}
-		next = &(*next)->next;
-	}
-	write_unlock_irqrestore(&devtree_lock, flags);
-
-	if (!found)
-		return -ENODEV;
-
-#ifdef CONFIG_PROC_DEVICETREE
-	/* try to add to proc as well if it was initialized */
-	if (np->pde)
-		proc_device_tree_update_prop(np->pde, newprop, oldprop);
-#endif /* CONFIG_PROC_DEVICETREE */
-
-	return 0;
-}
-
 #if defined(CONFIG_DEBUG_FS) && defined(DEBUG)
 static struct debugfs_blob_wrapper flat_dt_blob;
 
Index: linux-next/arch/microblaze/include/asm/prom.h
===================================================================
--- linux-next.orig/arch/microblaze/include/asm/prom.h	2009-11-03 13:20:25.000000000 -0600
+++ linux-next/arch/microblaze/include/asm/prom.h	2009-11-03 14:01:34.000000000 -0600
@@ -38,10 +38,6 @@
 
 #define HAVE_ARCH_DEVTREE_FIXUPS
 
-/* For updating the device tree at runtime */
-extern void of_attach_node(struct device_node *);
-extern void of_detach_node(struct device_node *);
-
 /* Other Prototypes */
 extern int early_uartlite_console(void);
 
Index: linux-next/arch/microblaze/Kconfig
===================================================================
--- linux-next.orig/arch/microblaze/Kconfig	2009-11-02 13:39:39.000000000 -0600
+++ linux-next/arch/microblaze/Kconfig	2009-11-03 14:02:21.000000000 -0600
@@ -112,6 +112,9 @@
 config OF
 	def_bool y
 
+config OF_DYNAMIC
+	def_bool y
+
 config PROC_DEVICETREE
 	bool "Support for device tree in /proc"
 	depends on PROC_FS
