From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 5/6] Add new fdtput utility to write values to fdt
Date: Wed,  7 Sep 2011 12:54:19 -0700
Message-ID: <1315425260-2711-6-git-send-email-sjg@chromium.org>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1315425260-2711-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This simple utility allows writing of values into a device tree from the
command line. It aimes to be the opposite of fdtget.

What is it for:
- Updating fdt values when a binary blob already exists
   (even though source may be available it might be easier to use this
    utility rather than sed, etc.)
- Writing machine-specific fdt values within a build system

To use it, specify the fdt binary file on command line followed by the node
and property to set. Then, provide a list of values to put into that
property. Often there will be just one, but fdtput also supports arrays and
string lists.

fdtput does not trit to guess the type of the property based on looking at
the arguments. Instead it always assumed that an integer is provided. To
indicate that you want to write a string, use -ts. You can also provide
hex values with -tx.

The command line arguments are joined together into a single value. For
strings, a nul terminator is placed between each string. To avoid this, pass
the string as a single parameter.

Usage:
	fdtput <options> <dt file> <<node> <property> [<value>...]
Options:
	-t [<type>][<format>]	Type of data
	-v		Verbose: display each value decoded from command line
	-h		Print this help

	<type>		One character (s=string, i=int, u=unsigned, b=byte)
	<format>	Optional format character (x=hex)

To read from stdin and write to stdout, use - as the file. So you can do:

cat somefile.dtb | fdtput -ts - /node prop "My string value" > newfile.dtb

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Separate arguments for node and property
- Remove limits on data size of property writting to fdt
- Remove use of getopt_long()

 .gitignore      |    1 +
 Makefile        |    6 ++
 Makefile.fdtput |   12 +++
 fdtput.c        |  217 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+), 0 deletions(-)
 create mode 100644 Makefile.fdtput
 create mode 100644 fdtput.c

diff --git a/.gitignore b/.gitignore
index 9f27f34..2c9a64e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -11,3 +11,4 @@ lex.yy.c
 /convert-dtsv0
 /version_gen.h
 /fdtget
+/fdtput
diff --git a/Makefile b/Makefile
index 3d460d7..c6b57d7 100644
--- a/Makefile
+++ b/Makefile
@@ -107,11 +107,13 @@ include Makefile.convert-dtsv0
 include Makefile.dtc
 include Makefile.ftdump
 include Makefile.fdtget
+include Makefile.fdtput
 
 BIN += convert-dtsv0
 BIN += dtc
 BIN += ftdump
 BIN += fdtget
+BIN += fdtput
 
 SCRIPTS = dtdiff
 
@@ -123,6 +125,7 @@ ifneq ($(DEPTARGETS),)
 -include $(CONVERT_OBJS:%.o=%.d)
 -include $(FTDUMP_OBJS:%.o=%.d)
 -include $(FDTGET_OBJS:%.o=%.d)
+-include $(FDTPUT_OBJS:%.o=%.d)
 endif
 
 
@@ -185,6 +188,9 @@ ftdump:	$(FTDUMP_OBJS) $(LIBFDT_archive)
 
 fdtget:	$(FDTGET_OBJS) $(LIBFDT_archive)
 
+fdtput:	$(FDTPUT_OBJS) $(LIBFDT_archive)
+
+
 #
 # Testsuite rules
 #
diff --git a/Makefile.fdtput b/Makefile.fdtput
new file mode 100644
index 0000000..de1cfdf
--- /dev/null
+++ b/Makefile.fdtput
@@ -0,0 +1,12 @@
+#
+# This is not a complete Makefile.
+# Instead, it is designed to be easily embeddable
+# into other systems of Makefiles.
+#
+
+FDTPUT_SRCS = \
+	fdtput.c \
+	util.c \
+	utilfdt.c
+
+FDTPUT_OBJS = $(FDTPUT_SRCS:%.c=%.o)
diff --git a/fdtput.c b/fdtput.c
new file mode 100644
index 0000000..fd03d76
--- /dev/null
+++ b/fdtput.c
@@ -0,0 +1,217 @@
+/*
+ * Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
+ * Distributed under the terms of the GNU General Public License v2
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <libfdt.h>
+
+#include "util.h"
+#include "utilfdt.h"
+
+struct display_info {
+	int type;		/* data type (s/i/u/b or 0 for default) */
+	int format;		/* data format (x or 0 for default) */
+	int verbose;		/* verbose output */
+};
+
+static void report_error(const char *where, int err)
+{
+	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
+}
+
+/**
+ * Encode a series of arguments in a property value.
+ *
+ * @param disp		Display information / options
+ * @param arg		List of arguments from command line
+ * @param arg_count	Number of arguments (may be 0)
+ * @param valuep	Returns buffer containing value
+ * @param *value_len	Returns length of value encoded
+ */
+static int encode_value(struct display_info *disp, char **arg, int arg_count,
+			char **valuep, int *value_len)
+{
+	char *value = NULL;	/* holding area for value */
+	int value_size = 0;	/* size of holding area */
+	char *ptr;		/* pointer to current value position */
+	int len;		/* length of this cell/string/byte */
+	int ival;
+	int upto;	/* the number of bytes we have written to buf */
+
+	upto = 0;
+
+	if (disp->verbose)
+		fprintf(stderr, "Decoding value:\n");
+	for (; arg_count > 0; arg++, arg_count--, upto += len) {
+		/* assume integer unless told otherwise */
+		if (disp->type == 's')
+			len = strlen(*arg) + 1;
+		else
+			len = disp->type == 'b' ? 1 : 4;
+
+		/* enlarge our value buffer by a suitable margin if needed */
+		if (upto + len > value_size) {
+			value_size = (upto + len) + 500;
+			value = realloc(value, value_size);
+			if (!value) {
+				fprintf(stderr, "Out of mmory: cannot alloc "
+					"%d bytes\n", value_size);
+				return -1;
+			}
+		}
+
+		ptr = value + upto;
+		if (disp->type == 's') {
+			memcpy(ptr, *arg, len);
+			if (disp->verbose)
+				fprintf(stderr, "\tstring: '%s'\n", ptr);
+		} else {
+			int *iptr = (int *)ptr;
+
+			sscanf(*arg, disp->format == 'x' ? "%x" : "%d", &ival);
+			if (len == 4)
+				*iptr = cpu_to_fdt32(ival);
+			else
+				*ptr = (uint8_t)ival;
+			if (disp->verbose) {
+				fprintf(stderr, "\t%s: %d\n",
+					disp->type == 'b' ? "byte" : "int",
+					ival);
+			}
+		}
+	}
+	*value_len = upto;
+	*valuep = value;
+	if (disp->verbose)
+		fprintf(stderr, "Value size %d\n", upto);
+	return 0;
+}
+
+static int store_key_value(void *blob, const char *node_name,
+		const char *property, const char *buf, int len)
+{
+	int node;
+	int err;
+
+	node = fdt_path_offset(blob, node_name);
+	if (node < 0) {
+		report_error(node_name, node);
+		return -1;
+	}
+
+	err = fdt_setprop(blob, node, property, buf, len);
+	if (err) {
+		report_error(property, err);
+		return -1;
+	}
+	return 0;
+}
+
+static int do_fdtput(struct display_info *disp, const char *filename,
+		    char **arg, int arg_count)
+{
+	char *value;
+	char *blob;
+	int len, ret = 0;
+
+	blob = util_read_fdt(filename);
+	if (!blob)
+		return -1;
+
+	/* convert the arguments into a single binary value, then store */
+	assert(arg_count >= 2);
+	if (encode_value(disp, arg + 2, arg_count - 2, &value, &len) ||
+		store_key_value(blob, *arg, arg[1], value, len))
+		ret = -1;
+
+	if (!ret)
+		ret = util_write_fdt(blob, filename);
+
+	free(blob);
+	return ret;
+}
+
+static const char *usage_msg =
+	"fdtput - write a property value to a device tree\n"
+	"\n"
+	"The command line arguments are joined together into a single value.\n"
+	"\n"
+	"Usage:\n"
+	"	fdtput <options> <dt file> <<node> <property> [<value>...]\n"
+	"Options:\n"
+	"\t-t [<type>][<format>]\tType of data\n"
+	"\t-v\t\tVerbose: display each value decoded from command line\n"
+	"\t-h\t\tPrint this help\n\n"
+	"\t<type>\t\tOne character (s=string, i=int, u=unsigned, b=byte)\n"
+	"\t<format>\tOptional format character (x=hex)\n";
+
+static void usage(const char *msg)
+{
+	if (msg)
+		fprintf(stderr, "Error: %s\n\n", msg);
+
+	fprintf(stderr, "%s", usage_msg);
+	exit(2);
+}
+
+int main(int argc, char *argv[])
+{
+	struct display_info disp;
+	char *filename = NULL;
+
+	memset(&disp, '\0', sizeof(disp));
+	for (;;) {
+		int c = getopt(argc, argv, "ht:v");
+		if (c == -1)
+			break;
+
+		/*
+		 * TODO: add options to:
+		 * - delete property
+		 * - delete node (optionally recursively)
+		 * - rename node
+		 * - pack fdt before writing
+		 * - set amount of free space when writing
+		 * - expand fdt if value doesn't fit
+		 */
+		switch (c) {
+		case 'h':
+		case '?':
+			usage("");
+
+		case 't':
+			if (utilfdt_decode_type(optarg, &disp.type,
+					&disp.format))
+				usage("Invalid type string");
+			break;
+
+		case 'v':
+			disp.verbose = 1;
+			break;
+		}
+	}
+
+	if (optind < argc)
+		filename = argv[optind++];
+	if (!filename)
+		usage("Missing filename");
+
+	argv += optind;
+	argc -= optind;
+
+	if (argc < 1)
+		usage("Missing node");
+	if (argc < 2)
+		usage("Missing property");
+
+	if (do_fdtput(&disp, filename, argv, argc))
+		return 1;
+	return 0;
+}
-- 
1.7.3.1
