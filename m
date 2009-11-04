From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: [RFC PATCH 1/5] Move devtree_lock and allnodes declaration to of.h
Date: Wed, 04 Nov 2009 16:14:42 -0600
Message-ID: <4AF1FCD2.9060307@austin.ibm.com>
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

Move the declaration of devtree_lock and allnodes from powerpc/microblaze
asm/prom.h to linux/of.h

Signed-off-by: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
---
Index: linux-next/include/linux/of.h
===================================================================
--- linux-next.orig/include/linux/of.h	2009-11-02 13:39:46.000000000 -0600
+++ linux-next/include/linux/of.h	2009-11-02 14:17:29.000000000 -0600
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <linux/kref.h>
 #include <linux/mod_devicetable.h>
+#include <linux/spinlock.h>
 
 typedef u32 phandle;
 typedef u32 ihandle;
@@ -63,6 +64,9 @@
 #endif
 };
 
+extern rwlock_t devtree_lock;
+extern struct device_node *allnodes;
+
 static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
 {
 	return test_bit(flag, &n->_flags);
Index: linux-next/arch/powerpc/kernel/prom.c
===================================================================
--- linux-next.orig/arch/powerpc/kernel/prom.c	2009-11-02 13:39:40.000000000 -0600
+++ linux-next/arch/powerpc/kernel/prom.c	2009-11-02 14:07:43.000000000 -0600
@@ -32,6 +32,7 @@
 #include <linux/debugfs.h>
 #include <linux/irq.h>
 #include <linux/lmb.h>
+#include <linux/of.h>
 
 #include <asm/prom.h>
 #include <asm/rtas.h>
@@ -79,10 +80,6 @@
 struct boot_param_header *initial_boot_params;
 #endif
 
-extern struct device_node *allnodes;	/* temporary while merging */
-
-extern rwlock_t devtree_lock;	/* temporary while merging */
-
 /* export that to outside world */
 struct device_node *of_chosen;
 
Index: linux-next/arch/microblaze/include/asm/prom.h
===================================================================
--- linux-next.orig/arch/microblaze/include/asm/prom.h	2009-11-02 13:39:39.000000000 -0600
+++ linux-next/arch/microblaze/include/asm/prom.h	2009-11-02 14:10:13.000000000 -0600
@@ -23,6 +23,7 @@
 #include <linux/of_fdt.h>
 #include <linux/proc_fs.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <asm/irq.h>
 #include <asm/atomic.h>
 
@@ -37,9 +38,6 @@
 
 #define HAVE_ARCH_DEVTREE_FIXUPS
 
-extern struct device_node *allnodes;	/* temporary while merging */
-extern rwlock_t devtree_lock;	/* temporary while merging */
-
 /* For updating the device tree at runtime */
 extern void of_attach_node(struct device_node *);
 extern void of_detach_node(struct device_node *);
Index: linux-next/arch/sparc/kernel/prom.h
===================================================================
--- linux-next.orig/arch/sparc/kernel/prom.h	2009-11-02 13:39:40.000000000 -0600
+++ linux-next/arch/sparc/kernel/prom.h	2009-11-02 14:12:46.000000000 -0600
@@ -2,11 +2,9 @@
 #define __PROM_H
 
 #include <linux/spinlock.h>
+#include <linux/of.h>
 #include <asm/prom.h>
 
-extern struct device_node *allnodes;	/* temporary while merging */
-extern rwlock_t devtree_lock;	/* temporary while merging */
-
 extern void * prom_early_alloc(unsigned long size);
 extern void irq_trans_init(struct device_node *dp);
