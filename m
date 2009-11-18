From: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
Subject: Re: [PATCH 4/4] Move of_node[attach,
	detach] declarations to linux/of.h
Date: Wed, 18 Nov 2009 15:48:02 -0600
Message-ID: <4B046B92.3060108@austin.ibm.com>
References: <4B030FC2.9070401@austin.ibm.com> <4B03629A.9050503@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B03629A.9050503-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
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

Merge the declarations of of_attach_node and of_detach_node from the asm/prom.h
headers of powerpc and microblaze into linux/of.h.

This update also requires adding linux/of.h to the include list for
powerpc/platforms/pseries/reconfig.h.

Updated patch that should apply cleanly to test-devicetree, now with
diffstat output.

Signed-off-by: Nathan Fontenot <nfont-V7BBcbaFuwjMbYB6QlFGEg@public.gmane.org>
---
 arch/microblaze/include/asm/prom.h        |    4 ----
 arch/powerpc/include/asm/prom.h           |    4 ----
 arch/powerpc/platforms/pseries/reconfig.c |    1 +
 include/linux/of.h                        |    6 ++++++
 4 files changed, 7 insertions(+), 8 deletions(-)

Index: test-devicetree/arch/microblaze/include/asm/prom.h
===================================================================
--- test-devicetree.orig/arch/microblaze/include/asm/prom.h	2009-11-18 17:34:36.000000000 -0600
+++ test-devicetree/arch/microblaze/include/asm/prom.h	2009-11-18 19:26:53.000000000 -0600
@@ -39,10 +39,6 @@
 
 extern rwlock_t devtree_lock;	/* temporary while merging */
 
-/* For updating the device tree at runtime */
-extern void of_attach_node(struct device_node *);
-extern void of_detach_node(struct device_node *);
-
 /* Other Prototypes */
 extern int early_uartlite_console(void);
 
Index: test-devicetree/arch/powerpc/include/asm/prom.h
===================================================================
--- test-devicetree.orig/arch/powerpc/include/asm/prom.h	2009-11-18 17:34:36.000000000 -0600
+++ test-devicetree/arch/powerpc/include/asm/prom.h	2009-11-18 19:27:32.000000000 -0600
@@ -34,10 +34,6 @@
 
 #define HAVE_ARCH_DEVTREE_FIXUPS
 
-/* For updating the device tree at runtime */
-extern void of_attach_node(struct device_node *);
-extern void of_detach_node(struct device_node *);
-
 #ifdef CONFIG_PPC32
 /*
  * PCI <-> OF matching functions
Index: test-devicetree/arch/powerpc/platforms/pseries/reconfig.c
===================================================================
--- test-devicetree.orig/arch/powerpc/platforms/pseries/reconfig.c	2009-11-18 17:23:40.000000000 -0600
+++ test-devicetree/arch/powerpc/platforms/pseries/reconfig.c	2009-11-18 19:26:53.000000000 -0600
@@ -15,6 +15,7 @@
 #include <linux/kref.h>
 #include <linux/notifier.h>
 #include <linux/proc_fs.h>
+#include <linux/of.h>
 
 #include <asm/prom.h>
 #include <asm/machdep.h>
Index: test-devicetree/include/linux/of.h
===================================================================
--- test-devicetree.orig/include/linux/of.h	2009-11-18 17:34:36.000000000 -0600
+++ test-devicetree/include/linux/of.h	2009-11-18 19:26:53.000000000 -0600
@@ -187,4 +187,10 @@
 	const char *list_name, const char *cells_name, int index,
 	struct device_node **out_node, const void **out_args);
 
+#ifdef CONFIG_OF_DYNAMIC
+/* For updating the device tree at runtime */
+extern void of_attach_node(struct device_node *);
+extern void of_detach_node(struct device_node *);
+#endif
+
 #endif /* _LINUX_OF_H */
