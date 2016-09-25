From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH v3 1/5] drivers/of: introduce of_fdt_is_available()
Date: Sun, 25 Sep 2016 13:36:52 -0500
Message-ID: <1474828616-16608-2-git-send-email-arbab@linux.vnet.ibm.com>
References: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

In __fdt_scan_reserved_mem(), the availability of a node is determined
by testing its "status" property.

Move this check into its own function, borrowing logic from the
unflattened version, of_device_is_available().

Another caller will be added in a subsequent patch.

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 drivers/of/fdt.c       | 26 +++++++++++++++++++++++---
 include/linux/of_fdt.h |  2 ++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 085c638..9241c6e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -151,6 +151,23 @@ int of_fdt_match(const void *blob, unsigned long node,
 	return score;
 }
 
+bool of_fdt_is_available(const void *blob, unsigned long node)
+{
+	const char *status;
+	int statlen;
+
+	status = fdt_getprop(blob, node, "status", &statlen);
+	if (!status)
+		return true;
+
+	if (statlen) {
+		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
+			return true;
+	}
+
+	return false;
+}
+
 static void *unflatten_dt_alloc(void **mem, unsigned long size,
 				       unsigned long align)
 {
@@ -647,7 +664,6 @@ static int __init __fdt_scan_reserved_mem(unsigned long node, const char *uname,
 					  int depth, void *data)
 {
 	static int found;
-	const char *status;
 	int err;
 
 	if (!found && depth == 1 && strcmp(uname, "reserved-memory") == 0) {
@@ -667,8 +683,7 @@ static int __init __fdt_scan_reserved_mem(unsigned long node, const char *uname,
 		return 1;
 	}
 
-	status = of_get_flat_dt_prop(node, "status", NULL);
-	if (status && strcmp(status, "okay") != 0 && strcmp(status, "ok") != 0)
+	if (!of_flat_dt_is_available(node))
 		return 0;
 
 	err = __reserved_mem_reserve_reg(node, uname);
@@ -809,6 +824,11 @@ int __init of_flat_dt_match(unsigned long node, const char *const *compat)
 	return of_fdt_match(initial_boot_params, node, compat);
 }
 
+bool __init of_flat_dt_is_available(unsigned long node)
+{
+	return of_fdt_is_available(initial_boot_params, node);
+}
+
 struct fdt_scan_status {
 	const char *name;
 	int namelen;
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 26c3302..49e0b8f 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -37,6 +37,7 @@ extern bool of_fdt_is_big_endian(const void *blob,
 				 unsigned long node);
 extern int of_fdt_match(const void *blob, unsigned long node,
 			const char *const *compat);
+extern bool of_fdt_is_available(const void *blob, unsigned long node);
 extern void *of_fdt_unflatten_tree(const unsigned long *blob,
 				   struct device_node *dad,
 				   struct device_node **mynodes);
@@ -59,6 +60,7 @@ extern const void *of_get_flat_dt_prop(unsigned long node, const char *name,
 				       int *size);
 extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern int of_flat_dt_match(unsigned long node, const char *const *matches);
+extern bool of_flat_dt_is_available(unsigned long node);
 extern unsigned long of_get_flat_dt_root(void);
 extern int of_get_flat_dt_size(void);
 
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
