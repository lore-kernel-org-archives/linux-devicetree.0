From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/4] libfdt: Add max phandle retrieval function
Date: Fri, 27 May 2016 10:28:48 +0200
Message-ID: <1464337729-7821-5-git-send-email-maxime.ripard@free-electrons.com>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464337729-7821-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to retrieve the highest phandle in a given device tree.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_ro.c | 15 +++++++++++++++
 libfdt/libfdt.h | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
index 50cce864283c..d5a14178190f 100644
--- a/libfdt/fdt_ro.c
+++ b/libfdt/fdt_ro.c
@@ -88,6 +88,21 @@ static int _fdt_string_eq(const void *fdt, int stroffset,
 	return (strlen(p) == len) && (memcmp(p, s, len) == 0);
 }
 
+uint32_t fdt_get_max_phandle(const void *fdt)
+{
+	uint32_t max_phandle = 0, phandle;
+	int offset;
+
+	for (offset = fdt_next_node(fdt, -1, NULL); offset >= 0;
+	     offset = fdt_next_node(fdt, offset, NULL)) {
+		phandle = fdt_get_phandle(fdt, offset);
+		if (phandle > max_phandle)
+			max_phandle = phandle;
+	}
+
+	return max_phandle;
+}
+
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 {
 	FDT_CHECK_HEADER(fdt);
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 6589e08db7ab..7156b264b1e9 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -284,6 +284,19 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
 const char *fdt_string(const void *fdt, int stroffset);
 
 /**
+ * fdt_get_max_phandle - retrieves the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ *
+ * fdt_get_max_phandle retrieves the highest phandlle in the given
+ * device tree
+ *
+ * returns:
+ *      the highest phandle on success
+ *      0, if an error occured
+ */
+uint32_t fdt_get_max_phandle(const void *fdt);
+
+/**
  * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
  * @fdt: pointer to the device tree blob
  *
-- 
2.8.2
