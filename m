From: "Wang, Yalin" <Yalin.Wang-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [RFC] fdt:free the fdt reserved memory
Date: Thu, 18 Sep 2014 17:25:12 +0800
Message-ID: <35FD53F367049845BC99AC72306C23D103D6DB49161A@CNBJMBX05.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "'grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org'" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "'robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org'" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "'devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "'pawel.moll-5wv7dgnIgG8@public.gmane.org'" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "'mark.rutland-5wv7dgnIgG8@public.gmane.org'" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "'ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org'" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "'linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch make some change to unflatten_dt_node(), make sure the
device_node don't reference to fdt raw blob memory, so that we can
free the raw blob reserved memory after initcalls.

Signed-off-by: Yalin Wang <yalin.wang-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 drivers/of/fdt.c       | 27 +++++++++++++++++++++++----
 include/linux/of_fdt.h |  2 ++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 79cb831..e891ef6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -240,6 +240,7 @@ static void * unflatten_dt_node(void *blob,
 	     (offset = fdt_next_property_offset(blob, offset))) {
 		const char *pname;
 		u32 sz;
+		int name_len;
 
 		if (!(p = fdt_getprop_by_offset(blob, offset, &pname, &sz))) {
 			offset = -FDT_ERR_INTERNAL;
@@ -250,10 +251,12 @@ static void * unflatten_dt_node(void *blob,
 			pr_info("Can't find property name in list !\n");
 			break;
 		}
+		name_len = strlen(pname);
 		if (strcmp(pname, "name") == 0)
 			has_name = 1;
-		pp = unflatten_dt_alloc(&mem, sizeof(struct property),
-					__alignof__(struct property));
+		pp = unflatten_dt_alloc(&mem,
+				ALIGN(sizeof(struct property) + name_len + 1, 4)
+				+ sz, __alignof__(struct property));
 		if (allnextpp) {
 			/* We accept flattened tree phandles either in
 			 * ePAPR-style "phandle" properties, or the
@@ -270,9 +273,11 @@ static void * unflatten_dt_node(void *blob,
 			 * stuff */
 			if (strcmp(pname, "ibm,phandle") == 0)
 				np->phandle = be32_to_cpup(p);
-			pp->name = (char *)pname;
+			pp->name = (char *)memcpy(pp + 1, pname, name_len + 1);
 			pp->length = sz;
-			pp->value = (__be32 *)p;
+			pp->value = (__be32 *)memcpy((void *)pp +
+					ALIGN(sizeof(struct property) +
+						name_len + 1, 4), p, sz);
 			*prev_pp = pp;
 			prev_pp = &pp->next;
 		}
@@ -564,6 +569,20 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	fdt_init_reserved_mem();
 }
 
+void __init free_early_init_fdt_scan_reserved_mem(void)
+{
+	unsigned long start, end, size;
+	if (!initial_boot_params)
+		return;
+
+	size = fdt_totalsize(initial_boot_params);
+	memblock_free(__pa(initial_boot_params), size);
+	start = round_down((unsigned long)initial_boot_params, PAGE_SIZE);
+	end = round_up((unsigned long)initial_boot_params + size, PAGE_SIZE);
+	free_reserved_area((void *)start, (void *)end, 0, "fdt");
+	initial_boot_params = 0;
+}
+
 /**
  * of_scan_flat_dt - scan flattened tree blob and call callback on each.
  * @it: callback function
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 0ff360d..21d51ce 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -62,6 +62,7 @@ extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
 extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
 				     int depth, void *data);
 extern void early_init_fdt_scan_reserved_mem(void);
+extern void free_early_init_fdt_scan_reserved_mem(void);
 extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern int early_init_dt_reserve_memory_arch(phys_addr_t base, phys_addr_t size,
 					     bool no_map);
@@ -89,6 +90,7 @@ extern u64 fdt_translate_address(const void *blob, int node_offset);
 extern void of_fdt_limit_memory(int limit);
 #else /* CONFIG_OF_FLATTREE */
 static inline void early_init_fdt_scan_reserved_mem(void) {}
+static inline void free_early_init_fdt_scan_reserved_mem(void) {}
 static inline const char *of_flat_dt_get_machine_name(void) { return NULL; }
 static inline void unflatten_device_tree(void) {}
 static inline void unflatten_and_copy_device_tree(void) {}
-- 
2.1.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
