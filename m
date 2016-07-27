From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 5/8] libfdt: Add fdt_setprop_inplace_namelen_partial
Date: Wed, 27 Jul 2016 14:55:57 +0200
Message-ID: <20160727125600.15949-6-maxime.ripard@free-electrons.com>
References: <20160727125600.15949-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160727125600.15949-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
 libfdt/fdt_wip.c                    | 29 +++++++++++++++++++++++++----
 libfdt/libfdt.h                     | 21 +++++++++++++++++++++
 tests/include1.dts                  |  1 +
 tests/rw_tree1.c                    |  5 +++++
 tests/setprop_inplace.c             | 14 ++++++++++++++
 tests/sw_tree1.c                    |  4 ++++
 tests/test_tree1.dts                |  1 +
 tests/test_tree1_label_noderef.dts  |  1 +
 tests/test_tree1_merge.dts          |  1 +
 tests/test_tree1_merge_labelled.dts |  1 +
 tests/test_tree1_merge_path.dts     |  1 +
 tests/testdata.h                    |  5 +++++
 tests/trees.S                       |  8 ++++++++
 13 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c5bbb68d3273..fd53e0b67416 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -55,21 +55,42 @@
 
 #include "libfdt_internal.h"
 
+int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
+					const char *name, int namelen,
+					uint32_t index, const void *val,
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
+	if (proplen < (len + index))
+		return -FDT_ERR_NOSPACE;
+
+	memcpy((unsigned char *)propval + index, val, len);
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
index 0189350fb32f..97b6346020ed 100644
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
+					uint32_t index, const void *val,
+					int len);
+
 /**
  * fdt_setprop_inplace - change a property's value, but not its size
  * @fdt: pointer to the device tree blob
diff --git a/tests/include1.dts b/tests/include1.dts
index 0b4b773e654d..8797aba0ed68 100644
--- a/tests/include1.dts
+++ b/tests/include1.dts
@@ -5,6 +5,7 @@
 
 / {
 	/include/ "include4.dts"
+	prop-array = <0xdeadbeef 0xdeadbeef 0xdeadbeef>;
 	/include/ "include5.dts" = <0xdeadbeef>;
 	prop-int64 /include/ "include5a.dts";
 	prop-str = /include/ "include6.dts";
diff --git a/tests/rw_tree1.c b/tests/rw_tree1.c
index efd471892f1c..dfc9908c97cd 100644
--- a/tests/rw_tree1.c
+++ b/tests/rw_tree1.c
@@ -47,6 +47,9 @@
 
 int main(int argc, char *argv[])
 {
+	uint32_t test_array[] = { cpu_to_fdt32(TEST_ARRAY_VAL_1),
+				  cpu_to_fdt32(TEST_ARRAY_VAL_2),
+				  cpu_to_fdt32(TEST_ARRAY_VAL_3), };
 	void *fdt;
 	int err;
 	int offset, s1, s2;
@@ -62,6 +65,8 @@ int main(int argc, char *argv[])
 	CHECK(fdt_add_mem_rsv(fdt, TEST_ADDR_2, TEST_SIZE_2));
 
 	CHECK(fdt_setprop_string(fdt, 0, "compatible", "test_tree1"));
+	CHECK(fdt_setprop(fdt, 0, "prop-array", test_array,
+			  sizeof(test_array)));
 	CHECK(fdt_setprop_u32(fdt, 0, "prop-int", TEST_VALUE_1));
 	CHECK(fdt_setprop_u64(fdt, 0, "prop-int64", TEST_VALUE64_1));
 	CHECK(fdt_setprop_string(fdt, 0, "prop-str", TEST_STRING_1));
diff --git a/tests/setprop_inplace.c b/tests/setprop_inplace.c
index daef182d0b28..b1c8c68bf7f5 100644
--- a/tests/setprop_inplace.c
+++ b/tests/setprop_inplace.c
@@ -32,11 +32,15 @@
 
 int main(int argc, char *argv[])
 {
+	uint32_t test_array[] = { cpu_to_fdt32(TEST_ARRAY_VAL_1),
+				  cpu_to_fdt32(TEST_ARRAY_VAL_2_NEW),
+				  cpu_to_fdt32(TEST_ARRAY_VAL_3), };
 	void *fdt;
 	const uint32_t *intp;
 	const uint64_t *int64p;
 	const char *strp;
 	char *xstr;
+	uint32_t val;
 	int xlen, i;
 	int err;
 
@@ -83,5 +87,15 @@ int main(int argc, char *argv[])
 	strp = check_getprop(fdt, 0, "prop-str", xlen+1, xstr);
 	verbose_printf("New string value is \"%s\"\n", strp);
 
+	val = TEST_ARRAY_VAL_2_NEW;
+	err = fdt_setprop_inplace_namelen_partial(fdt, 0,
+						  "prop-array",
+						  strlen("prop-array"),
+						  4, &val, sizeof(val));
+	if (err)
+		FAIL("Failed to set \"prop-array\": %s\n", fdt_strerror(err));
+
+	check_getprop(fdt, 0, "prop-array", sizeof(test_array), test_array);
+
 	PASS();
 }
diff --git a/tests/sw_tree1.c b/tests/sw_tree1.c
index 6d4c53102967..7911320f6546 100644
--- a/tests/sw_tree1.c
+++ b/tests/sw_tree1.c
@@ -81,6 +81,9 @@ static void realloc_fdt(void **fdt, size_t *size, bool created)
 
 int main(int argc, char *argv[])
 {
+	uint32_t test_array[] = { cpu_to_fdt32(TEST_ARRAY_VAL_1),
+				  cpu_to_fdt32(TEST_ARRAY_VAL_2),
+				  cpu_to_fdt32(TEST_ARRAY_VAL_3), };
 	void *fdt = NULL;
 	size_t size;
 	int err;
@@ -122,6 +125,7 @@ int main(int argc, char *argv[])
 
 	CHECK(fdt_begin_node(fdt, ""));
 	CHECK(fdt_property_string(fdt, "compatible", "test_tree1"));
+	CHECK(fdt_property(fdt, "prop-array", test_array, sizeof(test_array)));
 	CHECK(fdt_property_u32(fdt, "prop-int", TEST_VALUE_1));
 	CHECK(fdt_property_u64(fdt, "prop-int64", TEST_VALUE64_1));
 	CHECK(fdt_property_string(fdt, "prop-str", TEST_STRING_1));
diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
index 67ecfd0ea28f..b496ebfceeb2 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1.dts
@@ -5,6 +5,7 @@
 
 / {
 	compatible = "test_tree1";
+	prop-array = <0xdeadbeef 0xdeadbeef 0xdeadbeef>;
 	prop-int = <0xdeadbeef>;
 	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
 	prop-str = "hello world";
diff --git a/tests/test_tree1_label_noderef.dts b/tests/test_tree1_label_noderef.dts
index b2b194c6df64..5964f3fbd59e 100644
--- a/tests/test_tree1_label_noderef.dts
+++ b/tests/test_tree1_label_noderef.dts
@@ -5,6 +5,7 @@
 
 / {
 	compatible = "test_tree1";
+	prop-array = <0xdeadbeef 0xdeadbeef 0xdeadbeef>;
 	prop-int = <0xdeadbeef>;
 	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
 	prop-str = "hello world";
diff --git a/tests/test_tree1_merge.dts b/tests/test_tree1_merge.dts
index b100c12debb5..23fe9cf6584a 100644
--- a/tests/test_tree1_merge.dts
+++ b/tests/test_tree1_merge.dts
@@ -37,6 +37,7 @@
 / {
 	prop-int = <0xdeadbeef>;
 	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
+	prop-array = <0xdeadbeef 0xdeadbeef 0xdeadbeef>;
 	subnode@1 {
 		prop-int = [deadbeef];
 	};
diff --git a/tests/test_tree1_merge_labelled.dts b/tests/test_tree1_merge_labelled.dts
index fcf5dc45aeef..51f9c0c75228 100644
--- a/tests/test_tree1_merge_labelled.dts
+++ b/tests/test_tree1_merge_labelled.dts
@@ -7,6 +7,7 @@
 	compatible = "test_tree1";
 	prop-int = <0xdeadbeef>;
 	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
+	prop-array = <0xdeadbeef 0xdeadbeef 0xdeadbeef>;
 	prop-str = "hello world";
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/tests/test_tree1_merge_path.dts b/tests/test_tree1_merge_path.dts
index c2ad829727db..1700f8691b96 100644
--- a/tests/test_tree1_merge_path.dts
+++ b/tests/test_tree1_merge_path.dts
@@ -7,6 +7,7 @@
 	compatible = "test_tree1";
 	prop-int = <0xdeadbeef>;
 	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
+	prop-array = <0xdeadbeef 0xdeadbeef 0xdeadbeef>;
 	prop-str = "hello world";
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/tests/testdata.h b/tests/testdata.h
index 576974dddee8..31fd9b6ea6f4 100644
--- a/tests/testdata.h
+++ b/tests/testdata.h
@@ -27,6 +27,11 @@
 #define TEST_CHAR4	'\''
 #define TEST_CHAR5	'\xff'
 
+#define TEST_ARRAY_VAL_1	0xdeadbeef
+#define TEST_ARRAY_VAL_2	0xdeadbeef
+#define TEST_ARRAY_VAL_2_NEW	0
+#define TEST_ARRAY_VAL_3	0xdeadbeef
+
 #ifndef __ASSEMBLY__
 extern struct fdt_header _test_tree1;
 extern struct fdt_header _truncated_property;
diff --git a/tests/trees.S b/tests/trees.S
index 3d24aa2dcbc8..d44709b405f2 100644
--- a/tests/trees.S
+++ b/tests/trees.S
@@ -89,6 +89,13 @@ test_tree1_rsvmap_end:
 test_tree1_struct:
 	BEGIN_NODE("")
 	PROP_STR(test_tree1, compatible, "test_tree1")
+
+	# Create our property array by hand
+	PROPHDR(test_tree1, prop_array, 12)
+	FDTLONG(TEST_ARRAY_VAL_1)
+	FDTLONG(TEST_ARRAY_VAL_2)
+	FDTLONG(TEST_ARRAY_VAL_3)
+
 	PROP_INT(test_tree1, prop_int, TEST_VALUE_1)
 	PROP_INT64(test_tree1, prop_int64, TEST_VALUE64_1)
 	PROP_STR(test_tree1, prop_str, TEST_STRING_1)
@@ -135,6 +142,7 @@ test_tree1_struct_end:
 
 test_tree1_strings:
 	STRING(test_tree1, compatible, "compatible")
+	STRING(test_tree1, prop_array, "prop-array")
 	STRING(test_tree1, prop_int, "prop-int")
 	STRING(test_tree1, prop_int64, "prop-int64")
 	STRING(test_tree1, prop_str, "prop-str")
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
