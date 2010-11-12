From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 4/4] of/fdt: add kernel command line option for dtb_compat
	string
Date: Thu, 11 Nov 2010 16:03:50 -0800
Message-ID: <855a5a11d04a7c1883675b6a77992c4af85222fd.1289520079.git.dirk.brandewie@gmail.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 drivers/of/fdt.c       |   52 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h |    9 ++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c1360e0..07fe4c6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -604,3 +604,55 @@ void __init unflatten_device_tree(void)
 
 	pr_debug(" <- unflatten_device_tree()\n");
 }
+
+#ifndef MODULE
+#ifdef CONFIG_OF_FLATTREE
+static char dtb_compat_name[MAX_DTB_COMPAT_STR] = "";
+
+char __init *of_get_dtb_compatible_string(void)
+{
+	return dtb_compat_name;
+}
+
+#ifdef CONFIG_KERNEL_DTB
+extern char __dtb_start[];
+extern char __dtb_end[];
+
+void *of_find_compatible_dtb(char *name)
+{
+	void *rc = NULL;
+	char *hdr;
+	unsigned long node, root;
+	struct boot_param_header *blob, *orig_initial_boot_params;
+	
+	orig_initial_boot_params = initial_boot_params;
+	
+	if (__dtb_start != __dtb_end){
+		blob = (struct boot_param_header *)__dtb_start;
+		do{
+			node = ((unsigned long)blob) +  
+				be32_to_cpu(blob->off_dt_struct);
+			initial_boot_params = blob;
+			root = of_get_flat_dt_root();
+			if (of_flat_dt_is_compatible(root, name) > 0) {
+				rc = (void*) blob;
+				break;
+			}
+			blob = (unsigned long)blob+be32_to_cpu(blob->totalsize);
+		}while (blob < (struct boot_param_header *)__dtb_end);
+	}
+	if (rc == NULL)
+		initial_boot_params = orig_initial_boot_params;	
+	return rc;
+}
+#endif
+
+static int __init dtb_compat_setup(char *line)
+{
+	strncpy(dtb_compat_name, line, MAX_DTB_COMPAT_STR);
+	return 1;
+}
+
+__setup("dtb_compat=", dtb_compat_setup);
+#endif
+#endif
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 7bbf5b3..181e413 100644
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
@@ -82,6 +84,13 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern u64 early_init_dt_alloc_memory_arch(u64 size, u64 align);
 extern u64 dt_mem_next_cell(int s, __be32 **cellp);
 
+extern char *of_get_dtb_compatible_string(void);
+#ifdef CONFIG_KERNEL_DTB
+extern void *of_find_compatible_dtb(char *name);
+#else
+static inline void *of_find_compatible_dtb(char *name) {return 0;}
+
+#endif 
 /*
  * If BLK_DEV_INITRD, the fdt early init code will call this function,
  * to be provided by the arch code. start and end are specified as
-- 
1.7.2.3
