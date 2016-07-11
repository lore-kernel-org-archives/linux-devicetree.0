From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 3/6] libfdt: Add max phandle retrieval function
Date: Mon, 11 Jul 2016 21:56:20 +0200
Message-ID: <20160711195623.12840-4-maxime.ripard@free-electrons.com>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160711195623.12840-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to retrieve the highest phandle in a given device tree.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 libfdt/fdt_ro.c     | 26 ++++++++++++++++++++++++++
 libfdt/libfdt.h     | 14 ++++++++++++++
 tests/get_phandle.c |  6 ++++++
 3 files changed, 46 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 50cce864283c..04590984bd51 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -88,6 +88,32 @@ static int _fdt_string_eq(const void *fdt, int stroffset,
 	return (strlen(p) == len) && (memcmp(p, s, len) == 0);
 }
 
+uint32_t fdt_get_max_phandle(const void *fdt)
+{
+	uint32_t max_phandle = 0;
+	int offset;
+
+	for (offset = fdt_next_node(fdt, -1, NULL);;
+	     offset = fdt_next_node(fdt, offset, NULL)) {
+		uint32_t phandle;
+
+		if (offset == -FDT_ERR_NOTFOUND)
+			return max_phandle;
+
+		if (offset < 0)
+			return (uint32_t)-1;
+
+		phandle = fdt_get_phandle(fdt, offset);
+		if (phandle == (uint32_t)-1)
+			continue;
+
+		if (phandle > max_phandle)
+			max_phandle = phandle;
+	}
+
+	return 0;
+}
+
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 {
 	FDT_CHECK_HEADER(fdt);
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 9d3c9b234274..812937fede44 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -283,6 +283,20 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
  */
 const char *fdt_string(const void *fdt, int stroffset);
 
+/**
+ * fdt_get_max_phandle - retrieves the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ *
+ * fdt_get_max_phandle retrieves the highest phandle in the given
+ * device tree
+ *
+ * returns:
+ *      the highest phandle on success
+ *      0, if no phandle was found in the device tree
+ *      -1, if an error occurred
+ */
+uint32_t fdt_get_max_phandle(const void *fdt);
+
 /**
  * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
  * @fdt: pointer to the device tree blob
diff --git a/tests/get_phandle.c b/tests/get_phandle.c
index 2079591d4c49..22bd7b81b3f0 100644
--- a/tests/get_phandle.c
+++ b/tests/get_phandle.c
@@ -44,6 +44,7 @@ static void check_phandle(void *fdt, const char *path, uint32_t checkhandle)
 
 int main(int argc, char *argv[])
 {
+	uint32_t max;
 	void *fdt;
 
 	test_init(argc, argv);
@@ -53,5 +54,10 @@ int main(int argc, char *argv[])
 	check_phandle(fdt, "/subnode@2", PHANDLE_1);
 	check_phandle(fdt, "/subnode@2/subsubnode@0", PHANDLE_2);
 
+	max = fdt_get_max_phandle(fdt);
+	if (max != PHANDLE_2)
+		FAIL("fdt_get_max_phandle returned 0x%x instead of 0x%x\n",
+		     max, PHANDLE_2);
+
 	PASS();
 }
-- 
2.9.0
