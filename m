From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 2/2] of/fdt: add kernel command line option for dtb_compat
	string
Date: Mon, 15 Nov 2010 20:01:21 -0800
Message-ID: <bdb6f333aea69accf3ca3e74c1f01da0a8587aee.1289877715.git.dirk.brandewie@gmail.com>
References: <cover.1289877715.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1289877715.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1289877715.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1289877715.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add support for specifying a "compatible" string from the kernel
command line and functions for the platform to find the compatible
blob present in the kernel image if any.

Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/kernel-parameters.txt |    7 ++++
 drivers/of/fdt.c                    |   55 +++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h              |    5 +++
 3 files changed, 67 insertions(+), 0 deletions(-)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index ed45e98..f9b77fa 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -655,6 +655,13 @@ and is between 256 and 4096 characters. It is defined in the file
 
 	dscc4.setup=	[NET]
 
+	dtb_compat=	[KNL]
+			Specify the "compatible" string for the device
+			tree blob present in the kernel image.  This
+			string will be used to select the first device
+			tree blob whose compatible property matches
+			the string passed on the kernel commandline.
+
 	dynamic_printk	Enables pr_debug()/dev_dbg() calls if
 			CONFIG_DYNAMIC_PRINTK_DEBUG has been enabled.
 			These can also be switched on/off via
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c1360e0..77ab091 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -15,6 +15,8 @@
 #include <linux/of_fdt.h>
 #include <linux/string.h>
 #include <linux/errno.h>
+#include <asm-generic/vmlinux.lds.h>
+
 
 #ifdef CONFIG_PPC
 #include <asm/machdep.h>
@@ -604,3 +606,56 @@ void __init unflatten_device_tree(void)
 
 	pr_debug(" <- unflatten_device_tree()\n");
 }
+
+#ifndef MODULE
+#ifdef CONFIG_OF_FLATTREE
+char dtb_compat_name[MAX_DTB_COMPAT_STR] = "";
+
+char __init *of_get_dtb_compatible_string(void)
+{
+	return dtb_compat_name;
+}
+
+
+extern uint8_t __dtb_start[];
+extern uint8_t __dtb_end[];
+void *of_find_compatible_dtb(char *name)
+{
+	void *rc = NULL;
+	unsigned long root, size;
+	struct boot_param_header  *orig_initial_boot_params;
+	uint8_t *blob;
+
+	orig_initial_boot_params = initial_boot_params;
+	blob = __dtb_start;
+	initial_boot_params = (struct boot_param_header *)blob;
+
+	do {
+		root = of_get_flat_dt_root();
+		if (of_flat_dt_is_compatible(root, name) > 0) {
+			rc = (void *) blob;
+			break;
+		}
+
+		size =  be32_to_cpu(initial_boot_params->totalsize);
+		blob = (uint8_t *) ALIGN(((unsigned long)blob + size),
+					DTB_ALIGNMENT);
+		initial_boot_params = (struct boot_param_header *)blob;
+	} while (blob < __dtb_end);
+
+	if (rc == NULL)
+		initial_boot_params = orig_initial_boot_params;
+	return rc;
+}
+
+
+static int __init dtb_compat_setup(char *line)
+{
+	strncpy(dtb_compat_name, line, MAX_DTB_COMPAT_STR);
+	return 1;
+}
+
+early_param("dtb_compat", dtb_compat_setup);
+#endif
+#endif
+
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 7bbf5b3..c696da3c 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -58,6 +58,8 @@ struct boot_param_header {
 };
 
 #if defined(CONFIG_OF_FLATTREE)
+#define MAX_DTB_COMPAT_STR 64
+
 /* TBD: Temporary export of fdt globals - remove when code fully merged */
 extern int __initdata dt_root_addr_cells;
 extern int __initdata dt_root_size_cells;
@@ -82,6 +84,9 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern u64 early_init_dt_alloc_memory_arch(u64 size, u64 align);
 extern u64 dt_mem_next_cell(int s, __be32 **cellp);
 
+extern char *of_get_dtb_compatible_string(void);
+extern void *of_find_compatible_dtb(char *name);
+
 /*
  * If BLK_DEV_INITRD, the fdt early init code will call this function,
  * to be provided by the arch code. start and end are specified as
-- 
1.7.2.3
