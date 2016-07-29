From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 5/8] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Fri, 29 Jul 2016 11:55:48 +0200
Message-ID: <20160729095551.13592-6-maxime.ripard@free-electrons.com>
References: <20160729095551.13592-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160729095551.13592-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a function to modify inplace only a portion of a property..

This is especially useful when the property is an array of values, and you
want to update one of them without changing the DT size.

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_wip.c        | 29 +++++++++++++++++++++++++----
 libfdt/libfdt.h         | 21 +++++++++++++++++++++
 tests/setprop_inplace.c | 10 ++++++++++
 tests/testdata.h        |  3 +++
 4 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c5bbb68d3273..a6e158d1889a 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -55,21 +55,42 @@
 
 #include "libfdt_internal.h"
 
+int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
+					const char *name, int namelen,
+					uint32_t idx, const void *val,
+					int len)
+{
+	void *propval;
+	int proplen;
+
+	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
+					&proplen);
+	if (!propval)
+		return proplen;
+
+	if (proplen < (len + idx))
+		return -FDT_ERR_NOSPACE;
+
+	memcpy((unsigned char *)propval + idx, val, len);
+	return 0;
+}
+
 int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 			const void *val, int len)
 {
-	void *propval;
+	const void *propval;
 	int proplen;
 
-	propval = fdt_getprop_w(fdt, nodeoffset, name, &proplen);
+	propval = fdt_getprop(fdt, nodeoffset, name, &proplen);
 	if (! propval)
 		return proplen;
 
 	if (proplen != len)
 		return -FDT_ERR_NOSPACE;
 
-	memcpy(propval, val, len);
-	return 0;
+	return fdt_setprop_inplace_namelen_partial(fdt, nodeoffset, name,
+						   strlen(name), 0,
+						   val, len);
 }
 
 static void _fdt_nop_region(void *start, int len)
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 0189350fb32f..e534a34355a4 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -1079,6 +1079,27 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
 /* Write-in-place functions                                           */
 /**********************************************************************/
 
+/**
+ * fdt_setprop_inplace_namelen_partial - change a property's value,
+ *                                       but not its size
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: number of characters of name to consider
+ * @index: index of the property to change in the array
+ * @val: pointer to data to replace the property value with
+ * @len: length of the property value
+ *
+ * Identical to fdt_setprop_inplace(), but modifies the given property
+ * starting from the given index, and using only the first characters
+ * of the name. It is useful when you want to manipulate only one value of
+ * an array and you have a string that doesn't end with \0.
+ */
+int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
+					const char *name, int namelen,
+					uint32_t idx, const void *val,
+					int len);
+
 /**
  * fdt_setprop_inplace - change a property's value, but not its size
  * @fdt: pointer to the device tree blob
diff --git a/tests/setprop_inplace.c b/tests/setprop_inplace.c
index daef182d0b28..80447a0b13ab 100644
--- a/tests/setprop_inplace.c
+++ b/tests/setprop_inplace.c
@@ -83,5 +83,15 @@ int main(int argc, char *argv[])
 	strp = check_getprop(fdt, 0, "prop-str", xlen+1, xstr);
 	verbose_printf("New string value is \"%s\"\n", strp);
 
+	err = fdt_setprop_inplace_namelen_partial(fdt, 0, "compatible",
+						  strlen("compatible"), 4,
+						  TEST_STRING_4_PARTIAL,
+						  strlen(TEST_STRING_4_PARTIAL));
+	if (err)
+		FAIL("Failed to set \"compatible\": %s\n", fdt_strerror(err));
+
+	check_getprop(fdt, 0, "compatible", strlen(TEST_STRING_4_RESULT) + 1,
+		      TEST_STRING_4_RESULT);
+
 	PASS();
 }
diff --git a/tests/testdata.h b/tests/testdata.h
index 576974dddee8..3588778ad159 100644
--- a/tests/testdata.h
+++ b/tests/testdata.h
@@ -21,6 +21,9 @@
 #define TEST_STRING_2	"nastystring: \a\b\t\n\v\f\r\\\""
 #define TEST_STRING_3	"\xde\xad\xbe\xef"
 
+#define TEST_STRING_4_PARTIAL	"foobar"
+#define TEST_STRING_4_RESULT	"testfoobar"
+
 #define TEST_CHAR1	'\r'
 #define TEST_CHAR2	'b'
 #define TEST_CHAR3	'\0'
-- 
2.9.2
