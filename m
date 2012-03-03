From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/4] fdtget: Add -p to list the properties of a node
Date: Fri,  2 Mar 2012 17:12:08 -0800
Message-ID: <1330737130-29600-2-git-send-email-sjg@chromium.org>
References: <1330737130-29600-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330737130-29600-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

This option lists the properties of each node given as a parameter, one
property per line.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 fdtget.c |   66 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/fdtget.c b/fdtget.c
index 9783e04..874bcbf 100644
--- a/fdtget.c
+++ b/fdtget.c
@@ -1,6 +1,12 @@
 /*
  * Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
  *
+ * Portions from U-Boot cmd_fdt.c (C) Copyright 2007
+ * Gerald Van Baren, Custom IDEAS, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
+ * Based on code written by:
+ *   Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> and
+ *   Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
+ *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
  * published by the Free Software Foundation; either version 2 of
@@ -17,6 +23,7 @@
  * MA 02111-1307 USA
  */
 
+#include <assert.h>
 #include <ctype.h>
 #include <getopt.h>
 #include <stdio.h>
@@ -27,10 +34,16 @@
 
 #include "util.h"
 
+enum display_mode {
+	MODE_SHOW_VALUE,	/* show values for node properties */
+	MODE_LIST_PROPS,	/* list the properties for a node */
+};
+
 /* Holds information which controls our output and options */
 struct display_info {
 	int type;		/* data type (s/i/u/x or 0 for default) */
 	int size;		/* data size (1/2/4) */
+	enum display_mode mode;	/* display mode that we are using */
 };
 
 static void report_error(const char *where, int err)
@@ -98,6 +111,32 @@ static int show_data(struct display_info *disp, const char *data, int len)
 }
 
 /**
+ * List all properties in a node, one per line.
+ *
+ * @param blob		FDT blob
+ * @param node		Node to display
+ * @return 0 if ok, or FDT_ERR... if not.
+ */
+static int list_properties(const void *blob, int node)
+{
+	const struct fdt_property *data;
+	const char *name;
+	int prop;
+
+	prop = fdt_first_property_offset(blob, node);
+	do {
+		/* Stop silently when there are no more properties */
+		if (prop < 0)
+			return prop == -FDT_ERR_NOTFOUND ? 0 : prop;
+		data = fdt_get_property_by_offset(blob, prop, NULL);
+		name = fdt_string(blob, fdt32_to_cpu(data->nameoff));
+		if (name)
+			puts(name);
+		prop = fdt_next_property_offset(blob, prop);
+	} while (1);
+}
+
+/**
  * Show the data for a given node (and perhaps property) according to the
  * display option provided.
  *
@@ -113,6 +152,10 @@ static int show_data_for_item(const void *blob, struct display_info *disp,
 	const void *value = NULL;
 	int len, err = 0;
 
+	if (disp->mode == MODE_LIST_PROPS)
+		return list_properties(blob, node);
+
+	assert(property);
 	value = fdt_getprop(blob, node, property, &len);
 	if (value) {
 		if (show_data(disp, value, len))
@@ -136,23 +179,25 @@ static int show_data_for_item(const void *blob, struct display_info *disp,
  * @param return 0 if ok, -ve on error
  */
 static int do_fdtget(struct display_info *disp, const char *filename,
-		     char **arg, int arg_count)
+		     char **arg, int arg_count, int args_per_step)
 {
 	char *blob;
+	const char *prop;
 	int i, node;
 
 	blob = utilfdt_read(filename);
 	if (!blob)
 		return -1;
 
-	for (i = 0; i + 2 <= arg_count; i += 2) {
+	for (i = 0; i + args_per_step <= arg_count; i += args_per_step) {
 		node = fdt_path_offset(blob, arg[i]);
 		if (node < 0) {
 			report_error(arg[i], node);
 			return -1;
 		}
+		prop = args_per_step == 1 ? NULL : arg[i + 1];
 
-		if (show_data_for_item(blob, disp, node, arg[i + 1]))
+		if (show_data_for_item(blob, disp, node, prop))
 			return -1;
 	}
 	return 0;
@@ -164,8 +209,10 @@ static const char *usage_msg =
 	"Each value is printed on a new line.\n\n"
 	"Usage:\n"
 	"	fdtget <options> <dt file> [<node> <property>]...\n"
+	"	fdtget -p <options> <dt file> [<node> ]...\n"
 	"Options:\n"
 	"\t-t <type>\tType of data\n"
+	"\t-p\t\tList properties for each node\n"
 	"\t-h\t\tPrint this help\n\n"
 	USAGE_TYPE_MSG;
 
@@ -182,12 +229,14 @@ int main(int argc, char *argv[])
 {
 	char *filename = NULL;
 	struct display_info disp;
+	int args_per_step = 2;
 
 	/* set defaults */
 	memset(&disp, '\0', sizeof(disp));
 	disp.size = -1;
+	disp.mode = MODE_SHOW_VALUE;
 	for (;;) {
-		int c = getopt(argc, argv, "ht:");
+		int c = getopt(argc, argv, "hpt:");
 		if (c == -1)
 			break;
 
@@ -201,6 +250,11 @@ int main(int argc, char *argv[])
 					&disp.size))
 				usage("Invalid type string");
 			break;
+
+		case 'p':
+			disp.mode = MODE_LIST_PROPS;
+			args_per_step = 1;
+			break;
 		}
 	}
 
@@ -217,10 +271,10 @@ int main(int argc, char *argv[])
 		return 0;
 
 	/* Check for node, property arguments */
-	if (argc % 2)
+	if (args_per_step == 2 && (argc % 2))
 		usage("Must have an even number of arguments");
 
-	if (do_fdtget(&disp, filename, argv, argc))
+	if (do_fdtget(&disp, filename, argv, argc, args_per_step))
 		return 1;
 	return 0;
 }
-- 
1.7.7.3
