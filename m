From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/4] of: Custom printk format specifier for device node
Date: Wed, 14 Jun 2017 15:30:24 -0500
Message-ID: <20170614203025.7581-4-robh@kernel.org>
References: <20170614203025.7581-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170614203025.7581-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Joe Perches <joe@perches.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>

90% of the usage of device node's full_name is printing it out
in a kernel message. Preparing for the eventual delayed allocation
introduce a custom printk format specifier that is both more
compact and more pleasant to the eye.

For instance typical use is:
	pr_info("Frobbing node %s\n", node->full_name);

Which can be written now as:
	pr_info("Frobbing node %pOF\n", node);

More fine-grained control of formatting includes printing the name,
flag, path-spec name, reference count and others, explained in the
documentation entry.

Originally written by Pantelis, but pretty much rewrote the core
function using existing string/number functions. The 2 passes were
unnecessary and have been removed. Also, updated the checkpatch.pl
check.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/printk-formats.txt |  31 +++++++++
 lib/vsprintf.c                   | 135 ++++++++++++++++++++++++++++++++++++++-
 scripts/checkpatch.pl            |   2 +-
 3 files changed, 166 insertions(+), 2 deletions(-)

diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
index 5962949944fd..07bc088ba5f5 100644
--- a/Documentation/printk-formats.txt
+++ b/Documentation/printk-formats.txt
@@ -275,6 +275,37 @@ struct va_format:
 
 	Passed by reference.
 
+Device tree nodes:
+
+	%pOF[fnpPcCFr]
+
+	For printing device tree nodes. The optional arguments are:
+            f device node full_name
+            n device node name
+            p device node phandle
+            P device node path spec (name + @unit)
+            F device node flags
+            c major compatible string
+            C full compatible string
+            r node reference count
+	Without any arguments prints full_name (same as %pOf)
+	The separator when using multiple arguments is '|'
+
+	Examples:
+
+	%pOF	/foo/bar@0			- Node full name
+	%pOFf	/foo/bar@0			- Same as above
+	%pOFfp	/foo/bar@0|10			- Node full name + phandle
+	%pOFfcF	/foo/bar@0|foo,device|--P-	- Node full name +
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
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 2d41de3f98a1..80b3e237f8d1 100644
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
@@ -650,7 +651,7 @@ char *bdev_name(char *buf, char *end, struct block_device *bdev,
 		struct printf_spec spec, const char *fmt)
 {
 	struct gendisk *hd = bdev->bd_disk;
-	
+
 	buf = string(buf, end, hd->disk_name, spec);
 	if (bdev->bd_part->partno) {
 		if (isdigit(hd->disk_name[strlen(hd->disk_name)-1])) {
@@ -1470,6 +1471,123 @@ char *flags_string(char *buf, char *end, void *flags_ptr, const char *fmt)
 	return format_flags(buf, end, flags, names);
 }
 
+static noinline_for_stack
+char *device_node_gen_full_name(const struct device_node *np, char *buf, char *end)
+{
+	int len, ret;
+
+	if (!np || !np->parent)
+		return buf;
+
+	buf = device_node_gen_full_name(np->parent, buf, end);
+
+	if (buf < end)
+		len = end - buf;
+	else
+		len = 0;
+	ret = snprintf(buf, len, "/%s", kbasename(np->full_name));
+	if (ret <= 0)
+		return buf;
+	else if (len == 0 || ret < len)
+		return buf + ret;
+	return buf + len;
+}
+
+static noinline_for_stack
+char *device_node_string(char *buf, char *end, struct device_node *dn,
+			 struct printf_spec spec, const char *fmt)
+{
+	char tbuf[sizeof("xxxxxxxxxx") + 1];
+	const char *fmtp, *p;
+	int ret;
+	char *buf_start = buf;
+	struct property *prop;
+	bool has_mult, pass;
+	const struct printf_spec num_spec = {
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
+	if (fmt[1] == '\0' || strcspn(fmt + 1,"fnpPFcCr") > 0)
+		fmt = "Ff";
+
+	for (fmtp = fmt + 1, pass = false; strspn(fmtp,"fnpPFcCr"); fmtp++, pass = true) {
+		if (pass && (*fmtp != 'f')) {
+			if (buf < end)
+				*buf = '|';
+			buf++;
+		}
+
+		switch (*fmtp) {
+		case 'f':	/* full_name */
+			if (pass) {
+				if (buf < end)
+					*buf = ':';
+				buf++;
+			}
+			buf = device_node_gen_full_name(dn, buf, end);
+			break;
+		case 'n':	/* name */
+			buf = string(buf, end, dn->name, str_spec);
+			break;
+		case 'p':	/* phandle */
+			buf = number(buf, end, (unsigned int)dn->phandle, num_spec);
+			break;
+		case 'P':	/* path-spec */
+			buf = string(buf, end, kbasename(of_node_full_name(dn)), str_spec);
+			break;
+		case 'F':	/* flags */
+			snprintf(tbuf, sizeof(tbuf), "%c%c%c%c",
+				of_node_check_flag(dn, OF_DYNAMIC) ?
+					'D' : '-',
+				of_node_check_flag(dn, OF_DETACHED) ?
+					'd' : '-',
+				of_node_check_flag(dn, OF_POPULATED) ?
+					'P' : '-',
+				of_node_check_flag(dn,
+					OF_POPULATED_BUS) ?  'B' : '-');
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
+		case 'r':	/* node reference count */
+			buf = number(buf, end, refcount_read(&dn->kobj.kref.refcount), num_spec);
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
@@ -1566,6 +1684,16 @@ int kptr_restrict __read_mostly;
  *       p page flags (see struct page) given as pointer to unsigned long
  *       g gfp flags (GFP_* and __GFP_*) given as pointer to gfp_t
  *       v vma flags (VM_*) given as pointer to unsigned long
+ * - 'OF[fnpPcCFr]' For an DT device node
+ *                  Without any optional arguments prints the full_name
+ *                  f device node full_name
+ *                  n device node name
+ *                  p device node phandle
+ *                  P device node path spec (name + @unit)
+ *                  F device node flags
+ *                  c major compatible string
+ *                  C full compatible string
+ *                  r node reference count
  *
  * ** Please update also Documentation/printk-formats.txt when making changes **
  *
@@ -1721,6 +1849,11 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 
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
