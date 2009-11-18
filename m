From: Nathan Fontenot <nfont@austin.ibm.com>
Subject: [PATCH 4/4] Move of_node[attach,detach] declarations to linux/of.h
Date: Tue, 17 Nov 2009 20:57:30 -0600
Message-ID: <4B03629A.9050503@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4B030FC2.9070401@austin.ibm.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

Merge the declarations of of_attach_node and of_detach_node from the asm/prom.h
headers of powerpc and microblaze into linux/of.h.

This update also requires adding linux/of.h to the include list for
powerpc/platforms/pseries/reconfig.h.

Signed-off-by: Nathan Fontenot <nfont@austin.ibm.com>
---

Index: test-devicetree/arch/microblaze/include/asm/prom.h
===================================================================
--- test-devicetree.orig/arch/microblaze/include/asm/prom.h	2009-11-17 14:17:03.000000000 -0600
+++ test-devicetree/arch/microblaze/include/asm/prom.h	2009-11-17 14:18:25.000000000 -0600
@@ -139,10 +139,6 @@
 		of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern unsigned long __init of_get_flat_dt_root(void);
 
-/* For updating the device tree at runtime */
-extern void of_attach_node(struct device_node *);
-extern void of_detach_node(struct device_node *);
-
 /* Other Prototypes */
 extern void finish_device_tree(void);
 extern void unflatten_device_tree(void);
Index: test-devicetree/arch/powerpc/include/asm/prom.h
===================================================================
--- test-devicetree.orig/arch/powerpc/include/asm/prom.h	2009-11-17 14:17:03.000000000 -0600
+++ test-devicetree/arch/powerpc/include/asm/prom.h	2009-11-17 14:18:25.000000000 -0600
@@ -137,10 +137,6 @@
 extern int __init of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern unsigned long __init of_get_flat_dt_root(void);
 
-/* For updating the device tree at runtime */
-extern void of_attach_node(struct device_node *);
-extern void of_detach_node(struct device_node *);
-
 /* Other Prototypes */
 extern void finish_device_tree(void);
 extern void unflatten_device_tree(void);
Index: test-devicetree/arch/powerpc/platforms/pseries/reconfig.c
===================================================================
--- test-devicetree.orig/arch/powerpc/platforms/pseries/reconfig.c	2009-11-17 14:17:03.000000000 -0600
+++ test-devicetree/arch/powerpc/platforms/pseries/reconfig.c	2009-11-17 14:18:25.000000000 -0600
@@ -15,6 +15,7 @@
 #include <linux/kref.h>
 #include <linux/notifier.h>
 #include <linux/proc_fs.h>
+#include <linux/of.h>
 
 #include <asm/prom.h>
 #include <asm/machdep.h>
Index: test-devicetree/include/linux/of.h
===================================================================
--- test-devicetree.orig/include/linux/of.h	2009-11-17 14:17:03.000000000 -0600
+++ test-devicetree/include/linux/of.h	2009-11-17 14:18:25.000000000 -0600
@@ -84,4 +84,10 @@
 	const char *list_name, const char *cells_name, int index,
 	struct device_node **out_node, const void **out_args);
 
+#ifdef CONFIG_OF_DYNAMIC
+/* For updating the device tree at runtime */
+extern void of_attach_node(struct device_node *);
+extern void of_detach_node(struct device_node *);
+#endif
+
 #endif /* _LINUX_OF_H */
