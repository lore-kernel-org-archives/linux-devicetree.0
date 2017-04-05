From: Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] of/fdt: introduce of_scan_flat_dt_subnodes and of_get_flat_dt_phandle
Date: Wed,  5 Apr 2017 22:37:05 +1000
Message-ID: <20170405123706.6081-3-npiggin@gmail.com>
References: <20170405123706.6081-1-npiggin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405123706.6081-1-npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce primitives for FDT parsing. These will be used for powerpc
cpufeatures node scanning, which has quite complex structure but should
be processed early.

Signed-off-by: Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c       | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h |  6 ++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index e5ce4b59e162..a45854fe5156 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -754,6 +754,37 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 }
 
 /**
+ * of_scan_flat_dt_subnodes - scan sub-nodes of a node call callback on each.
+ * @it: callback function
+ * @data: context data pointer
+ *
+ * This function is used to scan sub-nodes of a node.
+ */
+int __init of_scan_flat_dt_subnodes(unsigned long node,
+				    int (*it)(unsigned long node,
+					      const char *uname,
+					      void *data),
+				    void *data)
+{
+	const void *blob = initial_boot_params;
+	const char *pathp;
+	int offset, rc = 0;
+
+	offset = node;
+        for (offset = fdt_first_subnode(blob, offset);
+             offset >= 0 && !rc;
+             offset = fdt_next_subnode(blob, offset)) {
+
+		pathp = fdt_get_name(blob, offset, NULL);
+		if (*pathp == '/')
+			pathp = kbasename(pathp);
+		rc = it(offset, pathp, data);
+	}
+	return rc;
+}
+
+
+/**
  * of_get_flat_dt_subnode_by_name - get the subnode by given name
  *
  * @node: the parent node
@@ -812,6 +843,14 @@ int __init of_flat_dt_match(unsigned long node, const char *const *compat)
 	return of_fdt_match(initial_boot_params, node, compat);
 }
 
+/**
+ * of_get_flat_dt_prop - Given a node in the flat blob, return the phandle
+ */
+uint32_t __init of_get_flat_dt_phandle(unsigned long node)
+{
+	return fdt_get_phandle(initial_boot_params, node);
+}
+
 struct fdt_scan_status {
 	const char *name;
 	int namelen;
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 271b3fdf0070..1dfbfd0d8040 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -54,6 +54,11 @@ extern char __dtb_end[];
 extern int of_scan_flat_dt(int (*it)(unsigned long node, const char *uname,
 				     int depth, void *data),
 			   void *data);
+extern int of_scan_flat_dt_subnodes(unsigned long node,
+				    int (*it)(unsigned long node,
+					      const char *uname,
+					      void *data),
+				    void *data);
 extern int of_get_flat_dt_subnode_by_name(unsigned long node,
 					  const char *uname);
 extern const void *of_get_flat_dt_prop(unsigned long node, const char *name,
@@ -62,6 +67,7 @@ extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern int of_flat_dt_match(unsigned long node, const char *const *matches);
 extern unsigned long of_get_flat_dt_root(void);
 extern int of_get_flat_dt_size(void);
+extern uint32_t of_get_flat_dt_phandle(unsigned long node);
 
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
