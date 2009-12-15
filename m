From: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [RFC,PATCH] of/flattree: endian-convert members of boot_param_header
Date: Tue, 15 Dec 2009 14:31:31 +0800
Message-ID: <1260858691.827261.737373695655.1.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The boot_param_header has big-endian fields, so change the types to
__be32, and perform endian conversion when we access them.

Signed-off-by: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>

---
 drivers/of/fdt.c       |   18 +++++++++---------
 include/linux/of_fdt.h |   20 ++++++++++----------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3eaabe7..7cb386c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -42,7 +42,7 @@ struct boot_param_header *initial_boot_params;
 char *find_flat_dt_string(u32 offset)
 {
 	return ((char *)initial_boot_params) +
-		initial_boot_params->off_dt_strings + offset;
+		be32_to_cpu(initial_boot_params->off_dt_strings) + offset;
 }
 
 /**
@@ -60,7 +60,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 			   void *data)
 {
 	unsigned long p = ((unsigned long)initial_boot_params) +
-		initial_boot_params->off_dt_struct;
+		be32_to_cpu(initial_boot_params->off_dt_struct);
 	int rc = 0;
 	int depth = -1;
 
@@ -80,7 +80,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 		if (tag == OF_DT_PROP) {
 			u32 sz = be32_to_cpup((__be32 *)p);
 			p += 8;
-			if (initial_boot_params->version < 0x10)
+			if (be32_to_cpu(initial_boot_params->version) < 0x10)
 				p = _ALIGN(p, sz >= 8 ? 8 : 4);
 			p += sz;
 			p = _ALIGN(p, 4);
@@ -115,7 +115,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 unsigned long __init of_get_flat_dt_root(void)
 {
 	unsigned long p = ((unsigned long)initial_boot_params) +
-		initial_boot_params->off_dt_struct;
+		be32_to_cpu(initial_boot_params->off_dt_struct);
 
 	while (be32_to_cpup((__be32 *)p) == OF_DT_NOP)
 		p += 4;
@@ -149,7 +149,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
 		sz = be32_to_cpup((__be32 *)p);
 		noff = be32_to_cpup((__be32 *)(p + 4));
 		p += 8;
-		if (initial_boot_params->version < 0x10)
+		if (be32_to_cpu(initial_boot_params->version) < 0x10)
 			p = _ALIGN(p, sz >= 8 ? 8 : 4);
 
 		nstr = find_flat_dt_string(noff);
@@ -310,7 +310,7 @@ unsigned long __init unflatten_dt_node(unsigned long mem,
 		sz = be32_to_cpup((__be32 *)(*p));
 		noff = be32_to_cpup((__be32 *)((*p) + 4));
 		*p += 8;
-		if (initial_boot_params->version < 0x10)
+		if (be32_to_cpu(initial_boot_params->version) < 0x10)
 			*p = _ALIGN(*p, sz >= 8 ? 8 : 4);
 
 		pname = find_flat_dt_string(noff);
@@ -591,7 +591,7 @@ static void __init early_init_move_devtree(void)
 	pr_debug("-> %s()\n", __func__);
 
 	start = __pa(initial_boot_params);
-	size = initial_boot_params->totalsize;
+	size = be32_to_cpu(initial_boot_params->totalsize);
 
 	if ((memory_limit && (start + size) > memory_limit) ||
 			overlaps_crashkernel(start, size)) {
@@ -684,7 +684,7 @@ void __init unflatten_device_tree(void)
 
 	/* First pass, scan for size */
 	start = ((unsigned long)initial_boot_params) +
-		initial_boot_params->off_dt_struct;
+		be32_to_cpu(initial_boot_params->off_dt_struct);
 	size = unflatten_dt_node(0, &start, NULL, NULL, 0);
 	size = (size | 3) + 1;
 
@@ -701,7 +701,7 @@ void __init unflatten_device_tree(void)
 
 	/* Second pass, do actual unflattening */
 	start = ((unsigned long)initial_boot_params) +
-		initial_boot_params->off_dt_struct;
+		be32_to_cpu(initial_boot_params->off_dt_struct);
 	unflatten_dt_node(mem, &start, NULL, &allnextp, 0);
 	if (be32_to_cpup((__be32 *)start) != OF_DT_END)
 		pr_warning("Weird tag at end of tree: %08x\n", *((u32 *)start));
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 0177e36..77ae0a4 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -42,19 +42,19 @@
  * ends when size is 0
  */
 struct boot_param_header {
-	u32	magic;			/* magic word OF_DT_HEADER */
-	u32	totalsize;		/* total size of DT block */
-	u32	off_dt_struct;		/* offset to structure */
-	u32	off_dt_strings;		/* offset to strings */
-	u32	off_mem_rsvmap;		/* offset to memory reserve map */
-	u32	version;		/* format version */
-	u32	last_comp_version;	/* last compatible version */
+	__be32	magic;			/* magic word OF_DT_HEADER */
+	__be32	totalsize;		/* total size of DT block */
+	__be32	off_dt_struct;		/* offset to structure */
+	__be32	off_dt_strings;		/* offset to strings */
+	__be32	off_mem_rsvmap;		/* offset to memory reserve map */
+	__be32	version;		/* format version */
+	__be32	last_comp_version;	/* last compatible version */
 	/* version 2 fields below */
-	u32	boot_cpuid_phys;	/* Physical CPU id we're booting on */
+	__be32	boot_cpuid_phys;	/* Physical CPU id we're booting on */
 	/* version 3 fields below */
-	u32	dt_strings_size;	/* size of the DT strings block */
+	__be32	dt_strings_size;	/* size of the DT strings block */
 	/* version 17 fields below */
-	u32	dt_struct_size;		/* size of the DT structure block */
+	__be32	dt_struct_size;		/* size of the DT structure block */
 };
 
 /* TBD: Temporary export of fdt globals - remove when code fully merged */
