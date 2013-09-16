From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/28] of: create unflatten_and_copy_device_tree
Date: Mon, 16 Sep 2013 18:08:59 -0500
Message-ID: <1379372965-22359-4-git-send-email-robherring2@gmail.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379372965-22359-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Several architectures using DT support built-in dtb's in the init
section. These platforms need to copy the dtb from init since the
strings are referenced after unflattening. Every arch has their own
copying routine which do the same thing. Create a common function,
unflatten_and_copy_device_tree, to copy the dtb when unflattening the
dtb.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c       | 13 +++++++++++++
 include/linux/of_fdt.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 229dd9d..eca1810 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -802,6 +802,19 @@ void __init unflatten_device_tree(void)
 	of_alias_scan(early_init_dt_alloc_memory_arch);
 }
 
+void __init unflatten_and_copy_device_tree(void)
+{
+	int size = __be32_to_cpu(initial_boot_params->totalsize);
+	void *dt = early_init_dt_alloc_memory_arch(size,
+		__alignof__(struct boot_param_header));
+
+	if (dt) {
+		memcpy(dt, initial_boot_params, size);
+		initial_boot_params = dt;
+	}
+	unflatten_device_tree();
+}
+
 #endif /* CONFIG_OF_EARLY_FLATTREE */
 
 /* Feed entire flattened device tree into the random pool */
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index a478c62..58c28a8 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -118,9 +118,11 @@ extern int early_init_dt_scan_root(unsigned long node, const char *uname,
 
 /* Other Prototypes */
 extern void unflatten_device_tree(void);
+extern void unflatten_and_copy_device_tree(void);
 extern void early_init_devtree(void *);
 #else /* CONFIG_OF_FLATTREE */
 static inline void unflatten_device_tree(void) {}
+static inline void unflatten_and_copy_device_tree(void) {}
 #endif /* CONFIG_OF_FLATTREE */
 
 #endif /* __ASSEMBLY__ */
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
