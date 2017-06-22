From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] vsprintf: Add %p extension "%pOF" for device tree
Date: Thu, 22 Jun 2017 15:44:45 -0500
Message-ID: <20170622204445.14930-1-robh@kernel.org>
References: <20170614203025.7581-4-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170614203025.7581-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

90% of the usage of device node's full_name is printing it out in a
kernel message. However, storing the full path for every node is
wasteful and redundant. With a custom format specifier, we can generate
the full path at run-time and eventually remove the full path from every
node.

For instance typical use is:
	pr_info("Frobbing node %s\n", node->full_name);

Which can be written now as:
	pr_info("Frobbing node %pOF\n", node);

More fine-grained control of formatting includes printing the name,
flags, path-spec name and others, explained in the documentation entry.

Originally written by Pantelis, but pretty much rewrote the core
function using existing string/number functions. The 2 passes were
unnecessary and have been removed. Also, updated the checkpatch.pl
check. The unittest code was written by Grant Likely.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
I missed some comments and changes Grant had done and incorporated them.

v2:
- Change subject
- Rewrite device_node_gen_full_name() to avoid recursion.
- Avoid using sprintf.
- Add unittests Grant L. wrote. 
- Drop ref count printing (from discussion 2 years ago).
- Remove fmtp local var.


 Documentation/printk-formats.txt             |  30 ++++++
 drivers/of/unittest-data/tests-platform.dtsi |   4 +-
 drivers/of/unittest.c                        |  58 +++++++++++
 lib/vsprintf.c                               | 140 +++++++++++++++++++++++++++
 scripts/checkpatch.pl                        |   2 +-
 5 files changed, 232 insertions(+), 2 deletions(-)

diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
index 5962949944fd..c7af38188f12 100644
--- a/Documentation/printk-formats.txt
+++ b/Documentation/printk-formats.txt
@@ -275,6 +275,36 @@ struct va_format:
 
 	Passed by reference.
 
+Device tree nodes:
+
+	%pOn[fnpPcCF]
+
+	For printing device tree nodes. The optional arguments are:
+	    f device node full_name
+	    n device node name
+	    p device node phandle
+	    P device node path spec (name + @unit)
+	    F device node flags
+	    c major compatible string
+	    C full compatible string
+	Without any arguments prints full_name (same as %pOFf)
+	The separator when using multiple arguments is ':'
+
+	Examples:
+
+	%pOn	/foo/bar@0			- Node full name
+	%pOnf	/foo/bar@0			- Same as above
+	%pOnfp	/foo/bar@0:10			- Node full name + phandle
+	%pOnfcF	/foo/bar@0:foo,device:--P-	- Node full name +
+	                                          major compatible string +
+						  node flags
+							D - dynamic
+							d - detached
+							P - Populated
+							B - Populated bus
+
+	Passed by reference.
+
 struct clk:
 
 	%pC	pll1
diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
index eb20eeb2b062..a0c93822aee3 100644
--- a/drivers/of/unittest-data/tests-platform.dtsi
+++ b/drivers/of/unittest-data/tests-platform.dtsi
@@ -26,7 +26,9 @@
 				#size-cells = <0>;
 
 				dev@100 {
-					compatible = "test-sub-device";
+					compatible = "test-sub-device",
+						     "test-compat2",
+						     "test-compat3";
 					reg = <0x100>;
 				};
 			};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 987a1530282a..8f611e9844db 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -239,6 +239,63 @@ static void __init of_unittest_check_tree_linkage(void)
 	pr_debug("allnodes list size (%i); sibling lists size (%i)\n", allnode_count, child_count);
 }
 
+static void __init of_unittest_printf_one(struct device_node *np, const char *fmt,
+					  const char *expected)
+{
+	char buf[strlen(expected)+10];
+	int size, i;
+
+	/* Baseline; check conversion with a large size limit */
+	memset(buf, 0xff, sizeof(buf));
+	size = snprintf(buf, sizeof(buf) - 2, fmt, np);
+
+	/* use strcmp() instead of strncmp() here to be absolutely sure strings match */
+	unittest((strcmp(buf, expected) == 0) && (buf[size+1] == 0xff),
+		"sprintf failed; fmt='%s' expected='%s' rslt='%s'\n",
+		fmt, expected, buf);
+
+	/* Make sure length limits work */
+	size++;
+	for (i = 0; i < 2; i++, size--) {
+		/* Clear the buffer, and make sure it works correctly still */
+		memset(buf, 0xff, sizeof(buf));
+		snprintf(buf, size+1, fmt, np);
+		unittest(strncmp(buf, expected, size) == 0 && (buf[size+1] == 0xff),
+			"snprintf failed; size=%i fmt='%s' expected='%s' rslt='%s'\n",
+			size, fmt, expected, buf);
+	}
+}
+
+static void __init of_unittest_printf(void)
+{
+	struct device_node *np;
+	const char *full_name = "/testcase-data/platform-tests/test-device@1/dev@100";
+	char phandle_str[16] = "";
+
+	np = of_find_node_by_path(full_name);
+	if (!np) {
+		unittest(np, "testcase data missing\n");
+		return;
+	}
+
+	num_to_str(phandle_str, sizeof(phandle_str), np->phandle);
+
+	of_unittest_printf_one(np, "%pOF",  full_name);
+	of_unittest_printf_one(np, "%pOFf", full_name);
+	of_unittest_printf_one(np, "%pOFp", phandle_str);
+	of_unittest_printf_one(np, "%pOFP", "dev@100");
+	of_unittest_printf_one(np, "ABC %pOFP ABC", "ABC dev@100 ABC");
+	of_unittest_printf_one(np, "%10pOFP", "   dev@100");
+	of_unittest_printf_one(np, "%-10pOFP", "dev@100   ");
+	of_unittest_printf_one(of_root, "%pOFP", "/");
+	of_unittest_printf_one(np, "%pOFF", "----");
+	of_unittest_printf_one(np, "%pOFPF", "dev@100:----");
+	of_unittest_printf_one(np, "%pOFPFPc", "dev@100:----:dev@100:test-sub-device");
+	of_unittest_printf_one(np, "%pOFc", "test-sub-device");
+	of_unittest_printf_one(np, "%pOFC",
+			"\"test-sub-device\",\"test-compat2\",\"test-compat3\"");
+}
+
 struct node_hash {
 	struct hlist_node node;
 	struct device_node *np;
@@ -2269,6 +2326,7 @@ static int __init of_unittest(void)
 	of_unittest_find_node_by_name();
 	of_unittest_dynamic();
 	of_unittest_parse_phandle_with_args();
+	of_unittest_printf();
 	of_unittest_property_string();
 	of_unittest_property_copy();
 	of_unittest_changeset();
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 2d41de3f98a1..2343b2ca47c5 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -31,6 +31,7 @@
 #include <linux/dcache.h>
 #include <linux/cred.h>
 #include <linux/uuid.h>
+#include <linux/of.h>
 #include <net/addrconf.h>
 #ifdef CONFIG_BLOCK
 #include <linux/blkdev.h>
@@ -1470,6 +1471,131 @@ char *flags_string(char *buf, char *end, void *flags_ptr, const char *fmt)
 	return format_flags(buf, end, flags, names);
 }
 
+static int device_node_calc_depth(const struct device_node *np)
+{
+	int d;
+
+	for (d = 0; np; d++)
+		np = np->parent;
+
+	return d;
+}
+
+static noinline_for_stack
+char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
+{
+	int i;
+	int depth = device_node_calc_depth(np);
+	static const struct printf_spec strspec = {
+		.field_width = -1,
+		.precision = -1,
+	};
+	const struct device_node *nodes[depth];
+
+	if (!depth)
+		return buf;
+	/* special case for root node */
+	if (depth == 1)
+		return string(buf, end, "/", strspec);
+
+	depth--;
+	for (i = depth - 1; i >= 0; i--) {
+		nodes[i] = np;
+		np = np->parent;
+	}
+	for (i = 0; i < depth; i++) {
+		buf = string(buf, end, "/", strspec);
+		buf = string(buf, end, kbasename(nodes[i]->full_name), strspec);
+	}
+	return buf;
+}
+
+static noinline_for_stack
+char *device_node_string(char *buf, char *end, struct device_node *dn,
+			 struct printf_spec spec, const char *fmt)
+{
+	char tbuf[sizeof("xxxx") + 1];
+	const char *p;
+	int ret;
+	char *buf_start = buf;
+	struct property *prop;
+	bool has_mult, pass;
+	static const struct printf_spec num_spec = {
+		.flags = SMALL,
+		.field_width = -1,
+		.precision = -1,
+		.base = 10,
+	};
+
+	struct printf_spec str_spec = spec;
+	str_spec.field_width = -1;
+
+	if (!IS_ENABLED(CONFIG_OF))
+		return string(buf, end, "(!OF)", spec);
+
+	if ((unsigned long)dn < PAGE_SIZE)
+		return string(buf, end, "(null)", spec);
+
+	/* simple case without anything any more format specifiers */
+	fmt++;
+	if (fmt[0] == '\0' || strcspn(fmt,"fnpPFcC") > 0)
+		fmt = "f";
+
+	for (pass = false; strspn(fmt,"fnpPFcC"); fmt++, pass = true) {
+		if (pass) {
+			if (buf < end)
+				*buf = ':';
+			buf++;
+		}
+
+		switch (*fmt) {
+		case 'f':	/* full_name */
+			buf = device_node_gen_full_name(dn, buf, end);
+			break;
+		case 'n':	/* name */
+			buf = string(buf, end, dn->name, str_spec);
+			break;
+		case 'p':	/* phandle */
+			buf = number(buf, end, (unsigned int)dn->phandle, num_spec);
+			break;
+		case 'P':	/* path-spec */
+			p = kbasename(of_node_full_name(dn));
+			if (!p[1])
+				p = "/";
+			buf = string(buf, end, p, str_spec);
+			break;
+		case 'F':	/* flags */
+			tbuf[0] = of_node_check_flag(dn, OF_DYNAMIC) ? 'D' : '-';
+			tbuf[1] = of_node_check_flag(dn, OF_DETACHED) ? 'd' : '-';
+			tbuf[2] = of_node_check_flag(dn, OF_POPULATED) ? 'P' : '-';
+			tbuf[3] = of_node_check_flag(dn, OF_POPULATED_BUS) ? 'B' : '-';
+			buf = string(buf, end, tbuf, str_spec);
+			break;
+		case 'c':	/* major compatible string */
+			ret = of_property_read_string(dn, "compatible", &p);
+			if (!ret)
+				buf = string(buf, end, p, str_spec);
+			break;
+		case 'C':	/* full compatible string */
+			has_mult = false;
+			of_property_for_each_string(dn, "compatible", prop, p) {
+				if (has_mult)
+					buf = string(buf, end, ",", str_spec);
+				buf = string(buf, end, "\"", str_spec);
+				buf = string(buf, end, p, str_spec);
+				buf = string(buf, end, "\"", str_spec);
+
+				has_mult = true;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return widen_string(buf, buf - buf_start, end, spec);
+}
+
 int kptr_restrict __read_mostly;
 
 /*
@@ -1566,6 +1692,15 @@ int kptr_restrict __read_mostly;
  *       p page flags (see struct page) given as pointer to unsigned long
  *       g gfp flags (GFP_* and __GFP_*) given as pointer to gfp_t
  *       v vma flags (VM_*) given as pointer to unsigned long
+ * - 'OF[fnpPcCF]'  For a device tree object
+ *                  Without any optional arguments prints the full_name
+ *                  f device node full_name
+ *                  n device node name
+ *                  p device node phandle
+ *                  P device node path spec (name + @unit)
+ *                  F device node flags
+ *                  c major compatible string
+ *                  C full compatible string
  *
  * ** Please update also Documentation/printk-formats.txt when making changes **
  *
@@ -1721,6 +1856,11 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 
 	case 'G':
 		return flags_string(buf, end, ptr, fmt);
+	case 'O':
+		switch (fmt[1]) {
+		case 'F':
+			return device_node_string(buf, end, ptr, spec, fmt + 1);
+		}
 	}
 	spec.flags |= SMALL;
 	if (spec.field_width == -1) {
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4b9569fa931b..411f2098fa6b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5709,7 +5709,7 @@ sub process {
 		        for (my $count = $linenr; $count <= $lc; $count++) {
 				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
 				$fmt =~ s/%%//g;
-				if ($fmt =~ /(\%[\*\d\.]*p(?![\WFfSsBKRraEhMmIiUDdgVCbGN]).)/) {
+				if ($fmt =~ /(\%[\*\d\.]*p(?![\WFfSsBKRraEhMmIiUDdgVCbGNO]).)/) {
 					$bad_extension = $1;
 					last;
 				}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
