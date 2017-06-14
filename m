From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] fdtoverlay: A tool that applies overlays
Date: Wed, 14 Jun 2017 17:51:11 +0300
Message-ID: <1497451872-15289-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1497451872-15289-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497451872-15289-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since libfdt support overlay application on FDT blobs, provide
a command line tool that applies an arbitrary number of
overlays, one after another to a base fdt blob and output
the result in the given file.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/manual.txt |  14 ++++
 Makefile                 |   5 ++
 Makefile.utils           |   6 ++
 fdtoverlay.c             | 168 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 193 insertions(+)
 create mode 100644 fdtoverlay.c

diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index d4e99e3..72403ac 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -679,3 +679,17 @@ The syntax of the fdtdump command line is:
 Where options are:
     -d,--debug          Dump debug information while decoding the file
     -s,--scan           Scan for an embedded fdt in given file
+
+3) fdtoverlay -- Flat Device Tree overlay applicator
+
+The fdtoverlay applies an arbitrary number of FDT overlays to a base FDT blob
+to a given output file.
+
+The syntax of the fdtoverlay command line is:
+
+    fdtoverlay -i <base-blob> -o <output-blob> <overlay-blob0> [<overlay-blob1> ...]
+
+Where options are:
+    -i, --input         Input base DT blob
+    -o, --output        Output DT blob
+    -v, --verbose       Verbose message output
diff --git a/Makefile b/Makefile
index 43957e6..fe482b9 100644
--- a/Makefile
+++ b/Makefile
@@ -120,6 +120,7 @@ BIN += dtc
 BIN += fdtdump
 BIN += fdtget
 BIN += fdtput
+BIN += fdtoverlay
 
 SCRIPTS = dtdiff
 
@@ -150,6 +151,7 @@ ifneq ($(DEPTARGETS),)
 -include $(FDTDUMP_OBJS:%.o=%.d)
 -include $(FDTGET_OBJS:%.o=%.d)
 -include $(FDTPUT_OBJS:%.o=%.d)
+-include $(FDTOVERLAY_OBJS:%.o=%.d)
 endif
 
 
@@ -226,6 +228,8 @@ fdtget:	$(FDTGET_OBJS) $(LIBFDT_archive)
 
 fdtput:	$(FDTPUT_OBJS) $(LIBFDT_archive)
 
+fdtoverlay: $(FDTOVERLAY_OBJS) $(LIBFDT_archive)
+
 dist:
 	git archive --format=tar --prefix=dtc-$(dtc_version)/ HEAD \
 		> ../dtc-$(dtc_version).tar
@@ -280,6 +284,7 @@ TESTS_BIN += convert-dtsv0
 TESTS_BIN += fdtput
 TESTS_BIN += fdtget
 TESTS_BIN += fdtdump
+TESTS_BIN += fdtoverlay
 ifeq ($(NO_PYTHON),)
 TESTS_PYLIBFDT += maybe_pylibfdt
 endif
diff --git a/Makefile.utils b/Makefile.utils
index 48ece49..e028922 100644
--- a/Makefile.utils
+++ b/Makefile.utils
@@ -22,3 +22,9 @@ FDTPUT_SRCS = \
 	util.c
 
 FDTPUT_OBJS = $(FDTPUT_SRCS:%.c=%.o)
+
+FDTOVERLAY_SRCS = \
+	fdtoverlay.c \
+	util.c
+
+FDTOVERLAY_OBJS = $(FDTOVERLAY_SRCS:%.c=%.o)
diff --git a/fdtoverlay.c b/fdtoverlay.c
new file mode 100644
index 0000000..9c5618c
--- /dev/null
+++ b/fdtoverlay.c
@@ -0,0 +1,168 @@
+/*
+ * Copyright (c) 2017 Konsulko Group Inc. All rights reserved.
+ *
+ * Author:
+ *	 Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#include <assert.h>
+#include <ctype.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <alloca.h>
+
+#include <libfdt.h>
+
+#include "util.h"
+
+/* Usage related data. */
+static const char usage_synopsis[] =
+	"apply a number of overlays to a base blob\n"
+	"	fdtoverlay <options> [<overlay.dtbo> [<overlay.dtbo>]]\n"
+	"\n"
+	USAGE_TYPE_MSG;
+static const char usage_short_opts[] = "i:o:v" USAGE_COMMON_SHORT_OPTS;
+static struct option const usage_long_opts[] = {
+	{"input",            required_argument, NULL, 'i'},
+	{"output",	     required_argument, NULL, 'o'},
+	{"verbose",	           no_argument, NULL, 'v'},
+	USAGE_COMMON_LONG_OPTS,
+};
+static const char * const usage_opts_help[] = {
+	"Input base DT blob",
+	"Output DT blob",
+	"Verbose messages",
+	USAGE_COMMON_OPTS_HELP
+};
+
+int verbose = 0;
+
+static int do_fdtoverlay(const char *input_filename,
+			 const char *output_filename,
+			 int argc, char *argv[])
+{
+	char *blob = NULL;
+	char **ovblob = NULL;
+	off_t blob_len, ov_len, total_len;
+	int i, ret = -1;
+
+	blob = utilfdt_read_len(input_filename, &blob_len);
+	if (!blob) {
+		fprintf(stderr, "\nFailed to read base blob %s\n",
+				input_filename);
+		goto out_err;
+	}
+	ret = 0;
+
+	/* allocate blob pointer array */
+	ovblob = alloca(sizeof(*ovblob) * argc);
+	memset(ovblob, 0, sizeof(*ovblob) * argc);
+
+	/* read and keep track of the overlay blobs */
+	total_len = 0;
+	for (i = 0; i < argc; i++) {
+		ovblob[i] = utilfdt_read_len(argv[i], &ov_len);
+		if (!ovblob[i]) {
+			fprintf(stderr, "\nFailed to read overlay %s\n",
+					argv[i]);
+			goto out_err;
+		}
+		total_len += ov_len;
+	}
+
+	/* grow the blob to worst case */
+	blob_len = fdt_totalsize(blob) + total_len;
+	blob = xrealloc(blob, blob_len);
+	fdt_open_into(blob, blob, blob_len);
+
+	/* apply the overlays in sequence */
+	for (i = 0; i < argc; i++) {
+		ret = fdt_overlay_apply(blob, ovblob[i]);
+		if (ret) {
+			fprintf(stderr, "\nFailed to apply %s (%d)\n",
+					argv[i], ret);
+			goto out_err;
+		}
+	}
+
+	fdt_pack(blob);
+	ret = utilfdt_write(output_filename, blob);
+	if (ret)
+		fprintf(stderr, "\nFailed to write output blob %s\n",
+				output_filename);
+
+out_err:
+	if (ovblob) {
+		for (i = 0; i < argc; i++) {
+			if (ovblob[i])
+				free(ovblob[i]);
+		}
+	}
+	free(blob);
+
+	return ret;
+}
+
+int main(int argc, char *argv[])
+{
+	int opt, i;
+	char *input_filename = NULL;
+	char *output_filename = NULL;
+
+	while ((opt = util_getopt_long()) != EOF) {
+		switch (opt) {
+		case_USAGE_COMMON_FLAGS
+
+		case 'i':
+			input_filename = optarg;
+			break;
+		case 'o':
+			output_filename = optarg;
+			break;
+		case 'v':
+			verbose = 1;
+			break;
+		}
+	}
+
+	if (!input_filename)
+		usage("missing input file");
+
+	if (!output_filename)
+		usage("missing output file");
+
+	argv += optind;
+	argc -= optind;
+
+	if (argc <= 0)
+		usage("missing overlay file(s)");
+
+	if (verbose) {
+		printf("input  = %s\n", input_filename);
+		printf("output = %s\n", output_filename);
+		for (i = 0; i < argc; i++)
+			printf("overlay[%d] = %s\n", i, argv[i]);
+	}
+
+	if (do_fdtoverlay(input_filename, output_filename, argc, argv))
+		return 1;
+
+	return 0;
+}
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
