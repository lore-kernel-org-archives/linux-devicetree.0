From: John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH 1/3] FDT: Add fixup support of multiple banks of memory
Date: Wed, 28 Jul 2010 15:59:53 -0600
Message-ID: <1280354395-9128-2-git-send-email-john.rigby@linaro.org>
References: <1280354395-9128-1-git-send-email-john.rigby@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1280354395-9128-1-git-send-email-john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add fdt_fixup_memory_banks and reimplement fdt_fixup_memory
to use it.

Signed-off-by: John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 common/fdt_support.c  |   86 ++++++++++++++++++++++++++-----------------------
 include/fdt_support.h |    1 +
 2 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index 718b635..73c95a8 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -362,10 +362,40 @@ void do_fixup_by_compat_u32(void *fdt, const char *compat,
 	do_fixup_by_compat(fdt, compat, prop, &val, 4, create);
 }
 
-int fdt_fixup_memory(void *blob, u64 start, u64 size)
+/*
+ * Get cells len in bytes
+ *     if #NNNN-cells property is 2 then len is 8
+ *     otherwise len is 4
+ */
+static int get_cells_len(void *blob, char *nr_cells_name)
+{
+	const u32 *cell;
+
+	cell = fdt_getprop(blob, 0, nr_cells_name, NULL);
+	if (cell && *cell == 2)
+		return 8;
+
+	return 4;
+}
+
+/*
+ * Write a 4 or 8 byte big endian cell
+ */
+static void write_cell(u8 *addr, u64 val, int size)
 {
-	int err, nodeoffset, len = 0;
-	u8 tmp[16];
+	int shift = (size - 1) * 8;
+	while (size-- > 0) {
+		*addr++ = (val >> shift) & 0xff;
+		shift -= 8;
+	}
+}
+
+int fdt_fixup_memory_banks(void *blob, u64 start[], u64 size[], int banks)
+{
+	int err, nodeoffset;
+	int addr_cell_len, size_cell_len, len;
+	u8 tmp[banks * 8];
+	int bank;
 	const u32 *addrcell, *sizecell;
 
 	err = fdt_check_header(blob);
@@ -391,44 +421,15 @@ int fdt_fixup_memory(void *blob, u64 start, u64 size)
 		return err;
 	}
 
-	addrcell = fdt_getprop(blob, 0, "#address-cells", NULL);
-	/* use shifts and mask to ensure endianness */
-	if ((addrcell) && (*addrcell == 2)) {
-		tmp[0] = (start >> 56) & 0xff;
-		tmp[1] = (start >> 48) & 0xff;
-		tmp[2] = (start >> 40) & 0xff;
-		tmp[3] = (start >> 32) & 0xff;
-		tmp[4] = (start >> 24) & 0xff;
-		tmp[5] = (start >> 16) & 0xff;
-		tmp[6] = (start >>  8) & 0xff;
-		tmp[7] = (start      ) & 0xff;
-		len = 8;
-	} else {
-		tmp[0] = (start >> 24) & 0xff;
-		tmp[1] = (start >> 16) & 0xff;
-		tmp[2] = (start >>  8) & 0xff;
-		tmp[3] = (start      ) & 0xff;
-		len = 4;
-	}
+	addr_cell_len = get_cells_len(blob, "#address-cells");
+	size_cell_len = get_cells_len(blob, "#size-cells");
 
-	sizecell = fdt_getprop(blob, 0, "#size-cells", NULL);
-	/* use shifts and mask to ensure endianness */
-	if ((sizecell) && (*sizecell == 2)) {
-		tmp[0+len] = (size >> 56) & 0xff;
-		tmp[1+len] = (size >> 48) & 0xff;
-		tmp[2+len] = (size >> 40) & 0xff;
-		tmp[3+len] = (size >> 32) & 0xff;
-		tmp[4+len] = (size >> 24) & 0xff;
-		tmp[5+len] = (size >> 16) & 0xff;
-		tmp[6+len] = (size >>  8) & 0xff;
-		tmp[7+len] = (size      ) & 0xff;
-		len += 8;
-	} else {
-		tmp[0+len] = (size >> 24) & 0xff;
-		tmp[1+len] = (size >> 16) & 0xff;
-		tmp[2+len] = (size >>  8) & 0xff;
-		tmp[3+len] = (size      ) & 0xff;
-		len += 4;
+	for (bank = 0, len = 0; bank < banks; bank++) {
+		write_cell(tmp + len, start, addr_cell_len);
+		len += addr_cell_len;
+
+		write_cell(tmp + len, start, size_cell_len);
+		len += size_cell_len;
 	}
 
 	err = fdt_setprop(blob, nodeoffset, "reg", tmp, len);
@@ -440,6 +441,11 @@ int fdt_fixup_memory(void *blob, u64 start, u64 size)
 	return 0;
 }
 
+int fdt_fixup_memory(void *blob, u64 start, u64 size)
+{
+	return fdt_fixup_memory_banks(blob, &start, &size, 1);
+}
+
 void fdt_fixup_ethernet(void *fdt)
 {
 	int node, i, j;
diff --git a/include/fdt_support.h b/include/fdt_support.h
index 54af9fe..76c731d 100644
--- a/include/fdt_support.h
+++ b/include/fdt_support.h
@@ -48,6 +48,7 @@ void do_fixup_by_compat(void *fdt, const char *compat,
 void do_fixup_by_compat_u32(void *fdt, const char *compat,
 			    const char *prop, u32 val, int create);
 int fdt_fixup_memory(void *blob, u64 start, u64 size);
+int fdt_fixup_memory_banks(void *blob, u64 start[], u64 size[], int banks);
 void fdt_fixup_ethernet(void *fdt);
 int fdt_find_and_setprop(void *fdt, const char *node, const char *prop,
 			 const void *val, int len, int create);
-- 
1.7.0.4
