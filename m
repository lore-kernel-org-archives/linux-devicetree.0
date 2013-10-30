From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 3/3] Add fdtgrep to grep and subset FDTs
Date: Wed, 30 Oct 2013 14:15:53 -0600
Message-ID: <1383164153-14379-4-git-send-email-sjg@chromium.org>
References: <1383164153-14379-1-git-send-email-sjg@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383164153-14379-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

fdtgrep operates like a grep for device trees, working on binary .dtb
files.

fdtgrep can find nodes by name or compatible string. It can find properties
by name. Using a list of of nodes/properties/compatible strings to match,
fdtgrep creates either .dts text output containing just those matches, or
.dtb output. In the .dtb case, the output is a valid FDT which only includes
the selected nodes/properties. This is useful in resource-constrained systems
where a full FDT is too large to fit in available memory (e.g. U-Boot SPL).

fdtgrep also supports producing raw binary output, without the normal FDT
headers. This can be useful for hashing part of an FDT and making sure that
that part does not change, even if other parts do. This makes it possible to
detect an important change, while ignoring a change that is of no interest.

At its simplest fdtgrep can be used as follows;

   fdtgrep /holiday tests/grep.dtb

and it produces just that node (with a skeleton to hold it):

/ {
    holiday {
        compatible = "ixtapa", "mexico";
        weather = "sunny";
        status = "okay";
    };
};

The binary form of this is:

   fdtgrep -n /holiday -O dtb tests/grep.dtb

which produces a valid DTB file with just the above nodes.

Various options are provided to search for properties, to ensure that
nodes/properties are not present, and to search for nodes by compatible
string.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3:
- Adjust help and command line processing to follow new approach
- Rename -V to -I to avoid using -V for a different purpose to other tools
- Rename -s to -e since it only 'enters' the node and does not include it all
- Add -s option to include all subnodes
- Add -f option to display offset; make -a display an absolute file address
- Add documentation on fdtgrep

Changes in v2:
- Add local fdt_find_regions() function since libfdt no longer has it

 .gitignore               |   1 +
 Documentation/manual.txt |  87 +++++
 Makefile                 |   4 +
 Makefile.utils           |   7 +
 fdtgrep.c                | 873 +++++++++++++++++++++++++++++++++++++++++++++++
 tests/grep.dts           |  23 ++
 tests/run_tests.sh       | 356 ++++++++++++++++++-
 tests/tests.sh           |   1 +
 8 files changed, 1351 insertions(+), 1 deletion(-)
 create mode 100644 fdtgrep.c
 create mode 100644 tests/grep.dts

diff --git a/.gitignore b/.gitignore
index 545b899..9d3a550 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,6 +12,7 @@ lex.yy.c
 /convert-dtsv0
 /version_gen.h
 /fdtget
+/fdtgrep
 /fdtput
 /patches
 /.pc
diff --git a/Documentation/manual.txt b/Documentation/manual.txt
index 5f02426..77cbc38 100644
--- a/Documentation/manual.txt
+++ b/Documentation/manual.txt
@@ -696,3 +696,90 @@ the type options are the same as fdtget. You can use -c to create a node if
 it does not exist already, and -p to create all required nodes (like
 'mkdir -p' does with directories). Unfortunately fdtput does not support
 deleting nodes or properties.
+
+
+5) fdtgrep -- Extract portions of a Device Tree and output them
+
+Ths fdtgrep program allows you to 'grep' a Device Tree file in a structured
+way. The output of fdtgrep is either another Device Tree file or a text file,
+perhaps with some pieces omitted.
+
+This is useful in a few situations:
+
+    - Finding a node or property in a device tree and displaying it along
+      with its surrounding context. This is helpful since some files are
+      quite large.
+    - Creating a smaller device tree which omits some portions. For example
+      a full Linux kernel device tree may be cut down for use by a simple
+      boot loader (perhaps removing the pinmux information).
+
+The syntax of the fdtgrep commandline is described in the help (fdtgrep -h)
+and there are many options. Some common uses are as follows:
+
+    fdtgrep -s -n /node <DTB-file-name>
+        - Output just a node and its subnodes
+
+    fdtgrep -s -n /node -o out.dtb -O dtb <DTB-file-name>
+        - Same but output as a binary Device Tree
+
+    fdtgrep -s -N /node <DTB-file-name>
+        - Output everything except the given node
+
+    fdtgrep -a -n /compatible -n /aliases <DTB-file-name>
+        - Output compatible and alias nodes
+
+    fdtgrep -s /node -O bin <DTB-file-name> | sha1sum
+        - Take the sha1sum of just the portion of the Device Tree occupied
+          by the /node node. This could be compared with the same node from
+          another file perhaps, to see if they match.
+        - You can add -tme to produce a valid Device Tree including header,
+          memreserve table and string table.
+
+    fdtgrep -A /node <DTB-file-name>
+        - Output just a node and its subnodes
+
+    fdtgrep -f /chosen spi4 <DTB-file-name>
+        - Output nodes/properties/compatibles strings which match /chosen and
+          spi4. Add the hex offset on the left of each. Note that -g is the
+          default parameter type, so this equivalent to:
+               fdtgrep -f -g /chosen -g spi4 <DTB-file-name>
+
+    fdtgrep -a /chosen spi4 <DTB-file-name>
+        - Similar but use absolute file offset. This allows to to find nodes
+          and properties in a file with a hex dumper.
+
+    fdtgrep -a /chosen spi4 <DTB-file-name>
+        - Similar but use absolute file offset. This allows to to find nodes
+          and properties in a file with a hex dumper.
+
+    fdtgrep -A /chosen spi4 <DTB-file-name>
+        - Output everything, but colour the nodes and properties which match
+          /chosen and spi4 green, and everything else red.
+
+    fdtgrep -Ad /chosen spi4 <DTB-file-name>
+        - Similar but use + and - to indicate included and excluded lines.
+
+    fdtgrep -Adv /chosen spi4 <DTB-file-name>
+        - Invert the above (-v operates similarly to -v with standard grep)
+
+    fdtgrep -c google,cros-ec-keyb <DTB-file-name>
+        - Show the node with the given compatible string
+
+    fdtgrep -n x -p compatible <DTB-file-name>
+        - List all nodes and their compatible strings. The '-n x' drops all
+          nodes not called 'x', which his all of them. If you want to list
+          nodes without a compatible as well, then omit this.
+
+Note you can use:
+    -n/N to include/exclude nodes
+    -p/N to include/exclude properties
+    -c/C to include/exclude nodes which have a particular compatible string
+    -g/G to include/exclude any of the above (global search)
+
+    Note it is not permitted to use a positive/negative search of the same
+    type at the same time. You can do this in two steps, such as:
+
+       ./fdtgrep -n x -p compatible x -O dtb |./fdtgrep - -n /serial@12C10000
+
+    but it is hard to see why this would be useful. Unfortunately fdtgrep
+    does not support wildcard matching or regular expressions.
diff --git a/Makefile b/Makefile
index 962f94e..0342081 100644
--- a/Makefile
+++ b/Makefile
@@ -112,6 +112,7 @@ BIN += dtc
 BIN += fdtdump
 BIN += fdtget
 BIN += fdtput
+BIN += fdtgrep
 
 SCRIPTS = dtdiff
 
@@ -124,6 +125,7 @@ ifneq ($(DEPTARGETS),)
 -include $(FDTDUMP_OBJS:%.o=%.d)
 -include $(FDTGET_OBJS:%.o=%.d)
 -include $(FDTPUT_OBJS:%.o=%.d)
+-include $(FDTGREP_OBJS:%.o=%.d)
 endif
 
 
@@ -188,6 +190,7 @@ fdtget:	$(FDTGET_OBJS) $(LIBFDT_archive)
 
 fdtput:	$(FDTPUT_OBJS) $(LIBFDT_archive)
 
+fdtgrep:	$(FDTGREP_OBJS) $(LIBFDT_archive)
 
 #
 # Testsuite rules
@@ -198,6 +201,7 @@ TESTS_BIN += dtc
 TESTS_BIN += convert-dtsv0
 TESTS_BIN += fdtput
 TESTS_BIN += fdtget
+TESTS_BIN += fdtgrep
 
 include tests/Makefile.tests
 
diff --git a/Makefile.utils b/Makefile.utils
index 48ece49..f2a7001 100644
--- a/Makefile.utils
+++ b/Makefile.utils
@@ -22,3 +22,10 @@ FDTPUT_SRCS = \
 	util.c
 
 FDTPUT_OBJS = $(FDTPUT_SRCS:%.c=%.o)
+
+
+FDTGREP_SRCS = \
+	fdtgrep.c \
+	util.c
+
+FDTGREP_OBJS = $(FDTGREP_SRCS:%.c=%.o)
diff --git a/fdtgrep.c b/fdtgrep.c
new file mode 100644
index 0000000..010b715
--- /dev/null
+++ b/fdtgrep.c
@@ -0,0 +1,873 @@
+/*
+ * Copyright (c) 2013, Google Inc.
+ *
+ * Perform a grep of an FDT either displaying the source subset or producing
+ * a new .dtb subset which can be used as required.
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
+#include <unistd.h>
+
+#include <libfdt.h>
+#include <libfdt_internal.h>
+#include "util.h"
+
+/* Define DEBUG to get some debugging output on stderr */
+#ifdef DEBUG
+#define debug(a, b...) fprintf(stderr, a, ## b)
+#else
+#define debug(a, b...)
+#endif
+
+/* A linked list of values we are grepping for */
+struct value_node {
+	int type;		/* Types this value matches (FDT_IS... mask) */
+	int include;		/* 1 to include matches, 0 to exclude */
+	const char *string;	/* String to match */
+	struct value_node *next;	/* Pointer to next node, or NULL */
+};
+
+/* Output formats we support */
+enum output_t {
+	OUT_DTS,		/* Device tree source */
+	OUT_DTB,		/* Valid device tree binary */
+	OUT_BIN,		/* Fragment of .dtb, for hashing */
+};
+
+/* Holds information which controls our output and options */
+struct display_info {
+	enum output_t output;	/* Output format */
+	int all;		/* Display all properties/nodes */
+	int colour;		/* Display output in ANSI colour */
+	int region_list;	/* Output a region list */
+	int flags;		/* Flags (FDT_REG_...) */
+	int list_strings;	/* List strings in string table */
+	int show_offset;	/* Show offset */
+	int show_addr;		/* Show address */
+	int header;		/* Output an FDT header */
+	int diff;		/* Show +/- diff markers */
+	int show_dts_version;	/* Put '/dts-v1/;' on the first line */
+	int types_inc;		/* Mask of types that we include (FDT_IS...) */
+	int types_exc;		/* Mask of types that we exclude (FDT_IS...) */
+	int invert;		/* Invert polarity of match */
+	struct value_node *value_head;	/* List of values to match */
+	const char *output_fname;	/* Output filename */
+	FILE *fout;		/* File to write dts/dtb output */
+};
+
+static void report_error(const char *where, int err)
+{
+	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
+}
+
+/* Supported ANSI colours */
+enum {
+	COL_BLACK,
+	COL_RED,
+	COL_GREEN,
+	COL_YELLOW,
+	COL_BLUE,
+	COL_MAGENTA,
+	COL_CYAN,
+	COL_WHITE,
+
+	COL_NONE = -1,
+};
+
+/**
+ * print_ansi_colour() - Print out the ANSI sequence for a colour
+ *
+ * @fout:	Output file
+ * @col:	Colour to output (COL_...), or COL_NONE to reset colour
+ */
+static void print_ansi_colour(FILE *fout, int col)
+{
+	if (col == COL_NONE)
+		fprintf(fout, "\033[0m");
+	else
+		fprintf(fout, "\033[1;%dm", col + 30);
+}
+
+
+/**
+ * value_add() - Add a new value to our list of things to grep for
+ *
+ * @disp:	Display structure, holding info about our options
+ * @headp:	Pointer to header pointer of list
+ * @type:	Type of this value (FDT_IS_...)
+ * @include:	1 if we want to include matches, 0 to exclude
+ * @str:	String value to match
+ */
+static int value_add(struct display_info *disp, struct value_node **headp,
+		     int type, int include, const char *str)
+{
+	struct value_node *node;
+
+	/*
+	 * Keep track of which types we are excluding/including. We don't
+	 * allow both including and excluding things, because it doesn't make
+	 * sense. 'Including' means that everything not mentioned is
+	 * excluded. 'Excluding' means that everything not mentioned is
+	 * included. So using the two together would be meaningless.
+	 */
+	if (include)
+		disp->types_inc |= type;
+	else
+		disp->types_exc |= type;
+	if (disp->types_inc & disp->types_exc & type) {
+		fprintf(stderr, "Cannot use both include and exclude"
+			" for '%s'\n", str);
+		return -1;
+	}
+
+	str = strdup(str);
+	node = malloc(sizeof(*node));
+	if (!str || !node) {
+		fprintf(stderr, "Out of memory\n");
+		return -1;
+	}
+	node->next = *headp;
+	node->type = type;
+	node->include = include;
+	node->string = str;
+	*headp = node;
+
+	return 0;
+}
+
+/**
+ * display_fdt_by_regions() - Display regions of an FDT source
+ *
+ * This dumps an FDT as source, but only certain regions of it. This is the
+ * final stage of the grep - we have a list of regions we want to display,
+ * and this function displays them.
+ *
+ * @disp:	Display structure, holding info about our options
+ * @blob:	FDT blob to display
+ * @region:	List of regions to display
+ * @count:	Number of regions
+ */
+static int display_fdt_by_regions(struct display_info *disp, const void *blob,
+		struct fdt_region region[], int count)
+{
+	struct fdt_region *reg = region, *reg_end = region + count;
+	uint32_t off_mem_rsvmap = fdt_off_mem_rsvmap(blob);
+	int base = fdt_off_dt_struct(blob);
+	int version = fdt_version(blob);
+	int offset, nextoffset;
+	int tag, depth, shift;
+	FILE *f = disp->fout;
+	uint64_t addr, size;
+	int in_region;
+	int file_ofs;
+	int i;
+
+	if (disp->show_dts_version)
+		fprintf(f, "/dts-v1/;\n");
+
+	if (disp->header) {
+		fprintf(f, "// magic:\t\t0x%x\n", fdt_magic(blob));
+		fprintf(f, "// totalsize:\t\t0x%x (%d)\n", fdt_totalsize(blob),
+		       fdt_totalsize(blob));
+		fprintf(f, "// off_dt_struct:\t0x%x\n",
+			fdt_off_dt_struct(blob));
+		fprintf(f, "// off_dt_strings:\t0x%x\n",
+			fdt_off_dt_strings(blob));
+		fprintf(f, "// off_mem_rsvmap:\t0x%x\n", off_mem_rsvmap);
+		fprintf(f, "// version:\t\t%d\n", version);
+		fprintf(f, "// last_comp_version:\t%d\n",
+		       fdt_last_comp_version(blob));
+		if (version >= 2) {
+			fprintf(f, "// boot_cpuid_phys:\t0x%x\n",
+			       fdt_boot_cpuid_phys(blob));
+		}
+		if (version >= 3) {
+			fprintf(f, "// size_dt_strings:\t0x%x\n",
+			       fdt_size_dt_strings(blob));
+		}
+		if (version >= 17) {
+			fprintf(f, "// size_dt_struct:\t0x%x\n",
+			       fdt_size_dt_struct(blob));
+		}
+		fprintf(f, "\n");
+	}
+
+	if (disp->flags & FDT_REG_ADD_MEM_RSVMAP) {
+		const struct fdt_reserve_entry *p_rsvmap;
+
+		p_rsvmap = (const struct fdt_reserve_entry *)
+				((const char *)blob + off_mem_rsvmap);
+		for (i = 0; ; i++) {
+			addr = fdt64_to_cpu(p_rsvmap[i].address);
+			size = fdt64_to_cpu(p_rsvmap[i].size);
+			if (addr == 0 && size == 0)
+				break;
+
+			fprintf(f, "/memreserve/ %llx %llx;\n",
+			(unsigned long long)addr, (unsigned long long)size);
+		}
+	}
+
+	depth = nextoffset = 0;
+	shift = 4;	/* 4 spaces per indent */
+	do {
+		const struct fdt_property *prop;
+		const char *name;
+		int show;
+		int len;
+
+		offset = nextoffset;
+
+		/*
+		 * Work out the file offset of this offset, and decide
+		 * whether it is in the region list or not
+		 */
+		file_ofs = base + offset;
+		if (reg < reg_end && file_ofs >= reg->offset + reg->size)
+			reg++;
+		in_region = reg < reg_end && file_ofs >= reg->offset &&
+				file_ofs < reg->offset + reg->size;
+		tag = fdt_next_tag(blob, offset, &nextoffset);
+
+		if (tag == FDT_END)
+			break;
+		show = in_region || disp->all;
+		if (show && disp->diff)
+			fprintf(f, "%c", in_region ? '+' : '-');
+
+		if (!show) {
+			/* Do this here to avoid 'if (show)' in every 'case' */
+			if (tag == FDT_BEGIN_NODE)
+				depth++;
+			else if (tag == FDT_END_NODE)
+				depth--;
+			continue;
+		}
+		if (tag != FDT_END) {
+			if (disp->show_addr)
+				fprintf(f, "%4x: ", file_ofs);
+			if (disp->show_offset)
+				fprintf(f, "%4x: ", file_ofs - base);
+		}
+
+		/* Green means included, red means excluded */
+		if (disp->colour)
+			print_ansi_colour(f, in_region ? COL_GREEN : COL_RED);
+
+		switch (tag) {
+		case FDT_PROP:
+			prop = fdt_get_property_by_offset(blob, offset, NULL);
+			name = fdt_string(blob, fdt32_to_cpu(prop->nameoff));
+			fprintf(f, "%*s%s", depth * shift, "", name);
+			utilfdt_print_data(prop->data,
+					   fdt32_to_cpu(prop->len));
+			fprintf(f, ";");
+			break;
+
+		case FDT_NOP:
+			fprintf(f, "%*s// [NOP]", depth * shift, "");
+			break;
+
+		case FDT_BEGIN_NODE:
+			name = fdt_get_name(blob, offset, &len);
+			fprintf(f, "%*s%s {", depth++ * shift, "",
+			       *name ? name : "/");
+			break;
+
+		case FDT_END_NODE:
+			fprintf(f, "%*s};", --depth * shift, "");
+			break;
+		}
+
+		/* Reset colour back to normal before end of line */
+		if (disp->colour)
+			print_ansi_colour(f, COL_NONE);
+		fprintf(f, "\n");
+	} while (1);
+
+	/* Print a list of strings if requested */
+	if (disp->list_strings) {
+		const char *str;
+		int offset;
+		int str_base = fdt_off_dt_strings(blob);
+
+		for (offset = 0; offset < fdt_size_dt_strings(blob);
+				offset += strlen(str) + 1) {
+			str = fdt_string(blob, offset);
+			int len = strlen(str) + 1;
+			int show;
+
+			/* Only print strings that are in the region */
+			file_ofs = str_base + offset;
+			in_region = reg < reg_end &&
+					file_ofs >= reg->offset &&
+					file_ofs + len < reg->offset +
+						reg->size;
+			show = in_region || disp->all;
+			if (show && disp->diff)
+				printf("%c", in_region ? '+' : '-');
+			if (disp->show_addr)
+				printf("%4x: ", file_ofs);
+			if (disp->show_offset)
+				printf("%4x: ", offset);
+			printf("%s\n", str);
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * dump_fdt_regions() - Dump regions of an FDT as binary data
+ *
+ * This dumps an FDT as binary, but only certain regions of it. This is the
+ * final stage of the grep - we have a list of regions we want to dump,
+ * and this function dumps them.
+ *
+ * The output of this function may or may not be a valid FDT. To ensure it
+ * is, these disp->flags must be set:
+ *
+ *   FDT_REG_SUPERNODES: ensures that subnodes are preceeded by their
+ *		parents. Without this option, fragments of subnode data may be
+ *		output without the supernodes above them. This is useful for
+ *		hashing but cannot produce a valid FDT.
+ *   FDT_REG_ADD_STRING_TAB: Adds a string table to the end of the FDT.
+ *		Without this none of the properties will have names
+ *   FDT_REG_ADD_MEM_RSVMAP: Adds a mem_rsvmap table - an FDT is invalid
+ *		without this.
+ *
+ * @disp:	Display structure, holding info about our options
+ * @blob:	FDT blob to display
+ * @region:	List of regions to display
+ * @count:	Number of regions
+ */
+static int dump_fdt_regions(struct display_info *disp, const void *blob,
+		struct fdt_region region[], int count)
+{
+	struct fdt_header hdr, *fdt = &hdr;
+	int size, struct_start;
+	FILE *f = disp->fout;
+	int i;
+
+	/* Set up a basic header (even if we don't actually write it) */
+	memset(fdt, '\0', sizeof(*fdt));
+	fdt_set_magic(fdt, FDT_MAGIC);
+	struct_start = FDT_ALIGN(sizeof(struct fdt_header),
+					sizeof(struct fdt_reserve_entry));
+	fdt_set_off_mem_rsvmap(fdt, struct_start);
+	fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
+	fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
+
+	/*
+	 * Calculate the total size of the regions we are writing out. The
+	 * first will be the mem_rsvmap if the FDT_REG_ADD_MEM_RSVMAP flag
+	 * is set. The last will be the string table if FDT_REG_ADD_STRING_TAB
+	 * is set.
+	 */
+	for (i = size = 0; i < count; i++)
+		size += region[i].size;
+
+	/* Bring in the mem_rsvmap section from the old file if requested */
+	if (count > 0 && (disp->flags & FDT_REG_ADD_MEM_RSVMAP)) {
+		struct_start += region[0].size;
+		size -= region[0].size;
+	}
+	fdt_set_off_dt_struct(fdt, struct_start);
+
+	/* Update the header to have the correct offsets/sizes */
+	if (count >= 2 && (disp->flags & FDT_REG_ADD_STRING_TAB)) {
+		int str_size;
+
+		str_size = region[count - 1].size;
+		fdt_set_size_dt_struct(fdt, size - str_size);
+		fdt_set_off_dt_strings(fdt, struct_start + size - str_size);
+		fdt_set_size_dt_strings(fdt, str_size);
+		fdt_set_totalsize(fdt, struct_start + size);
+	}
+
+	/* Write the header if required */
+	if (disp->header) {
+		if (sizeof(hdr) != fwrite(fdt, 1, sizeof(hdr), f))
+			return -1;
+		for (i = sizeof(hdr); i < fdt_off_mem_rsvmap(&hdr); i++)
+			fputc('\0', f);
+	}
+
+	/* Output all the nodes including any mem_rsvmap/string table */
+	for (i = size = 0; i < count; i++) {
+		struct fdt_region *reg = &region[i];
+
+		if (reg->size != fwrite((const char *)blob + reg->offset, 1,
+				reg->size, f))
+			return -1;
+		size += reg->size;
+	}
+
+	return 0;
+}
+
+/**
+ * show_region_list() - Print out a list of regions
+ *
+ * The list includes the region offset (absolute offset from start of FDT
+ * blob in bytes) and size
+ *
+ * @reg:	List of regions to print
+ * @count:	Number of regions
+ */
+static void show_region_list(struct fdt_region *reg, int count)
+{
+	int i;
+
+	printf("Regions: %d\n", count);
+	for (i = 0; i < count; i++, reg++) {
+		printf("%d:  %-10x  %-10x\n", i, reg->offset,
+		       reg->offset + reg->size);
+	}
+}
+
+static int check_type_include(void *priv, int type, const char *data, int size)
+{
+	struct display_info *disp = priv;
+	struct value_node *val;
+	int match, none_match = FDT_IS_ANY;
+
+	/* If none of our conditions mention this type, we know nothing */
+	debug("type=%x, data=%s\n", type, data);
+	if (!((disp->types_inc | disp->types_exc) & type)) {
+		debug("   - not in any condition\n");
+		return -1;
+	}
+
+	/*
+	 * Go through the list of conditions. For inclusive conditions, we
+	 * return 1 at the first match. For exclusive conditions, we must
+	 * check that there are no matches.
+	 */
+	for (val = disp->value_head; val; val = val->next) {
+		if (!(type & val->type))
+			continue;
+		match = fdt_stringlist_contains(data, size, val->string);
+		debug("      - val->type=%x, str='%s', match=%d\n",
+		      val->type, val->string, match);
+		if (match && val->include) {
+			debug("   - match inc %s\n", val->string);
+			return 1;
+		}
+		if (match)
+			none_match &= ~val->type;
+	}
+
+	/*
+	 * If this is an exclusive condition, and nothing matches, then we
+	 * should return 1.
+	 */
+	if ((type & disp->types_exc) && (none_match & type)) {
+		debug("   - match exc\n");
+		/*
+		 * Allow FDT_IS_COMPAT to make the final decision in the
+		 * case where there is no specific type
+		 */
+		if (type == FDT_IS_NODE && disp->types_exc == FDT_IS_ANY) {
+			debug("   - supressed exc node\n");
+			return -1;
+		}
+		return 1;
+	}
+
+	/*
+	 * Allow FDT_IS_COMPAT to make the final decision in the
+	 * case where there is no specific type (inclusive)
+	 */
+	if (type == FDT_IS_NODE && disp->types_inc == FDT_IS_ANY)
+		return -1;
+
+	debug("   - no match, types_inc=%x, types_exc=%x, none_match=%x\n",
+	      disp->types_inc, disp->types_exc, none_match);
+
+	return 0;
+}
+
+/**
+ * h_include() - Include handler function for fdt_find_regions()
+ *
+ * This function decides whether to include or exclude a node, property or
+ * compatible string. The function is defined by fdt_find_regions().
+ *
+ * The algorithm is documented in the code - disp->invert is 0 for normal
+ * operation, and 1 to invert the sense of all matches.
+ *
+ * See
+ */
+static int h_include(void *priv, const void *fdt, int offset, int type,
+		     const char *data, int size)
+{
+	struct display_info *disp = priv;
+	int inc, len;
+
+	inc = check_type_include(priv, type, data, size);
+
+	/*
+	 * If the node name does not tell us anything, check the
+	 * compatible string
+	 */
+	if (inc == -1 && type == FDT_IS_NODE) {
+		debug("   - checking compatible2\n");
+		data = fdt_getprop(fdt, offset, "compatible", &len);
+		inc = check_type_include(priv, FDT_IS_COMPAT, data, len);
+	}
+
+	switch (inc) {
+	case 1:
+		inc = !disp->invert;
+		break;
+	case 0:
+		inc = disp->invert;
+		break;
+	}
+	debug("   - returning %d\n", inc);
+
+	return inc;
+}
+
+static int fdt_find_regions(const void *fdt,
+		int (*h_include)(void *priv, const void *fdt, int offset,
+				 int type, const char *data, int size),
+		struct display_info *disp, struct fdt_region *region,
+		int max_regions, char *path, int path_len, int flags)
+{
+	struct fdt_region_state state;
+	int count;
+	int ret;
+
+	count = 0;
+	ret = fdt_first_region(fdt, h_include, disp,
+			&region[count++], path, path_len,
+			disp->flags, &state);
+	while (ret == 0) {
+		ret = fdt_next_region(fdt, h_include, disp,
+				&region[count], path, path_len,
+				disp->flags, &state);
+		if (!ret)
+			count++;
+	}
+
+	if (ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	return count;
+}
+
+/**
+ * Run the main fdtgrep operation, given a filename and valid arguments
+ *
+ * @param disp		Display information / options
+ * @param filename	Filename of blob file
+ * @param return 0 if ok, -ve on error
+ */
+static int do_fdtgrep(struct display_info *disp, const char *filename)
+{
+	struct fdt_region *region;
+	int max_regions;
+	int count = 100;
+	char path[1024];
+	char *blob;
+	int i, ret;
+
+	blob = utilfdt_read(filename);
+	if (!blob)
+		return -1;
+	ret = fdt_check_header(blob);
+	if (ret) {
+		fprintf(stderr, "Error: %s\n", fdt_strerror(ret));
+		return ret;
+	}
+
+	/* Allow old files, but they are untested */
+	if (fdt_version(blob) < 17 && disp->value_head) {
+		fprintf(stderr, "Warning: fdtgrep does not fully support"
+			" version %d files\n", fdt_version(blob));
+	}
+
+	/*
+	 * We do two passes, since we don't know how many regions we need.
+	 * The first pass will count the regions, but if it is too many,
+	 * we do another pass to actually record them.
+	 */
+	for (i = 0; i < 2; i++) {
+		region = malloc(count * sizeof(struct fdt_region));
+		if (!region) {
+			fprintf(stderr, "Out of memory for %d regions\n",
+				count);
+			return -1;
+		}
+		max_regions = count;
+		count = fdt_find_regions(blob,
+				h_include, disp,
+				region, max_regions, path, sizeof(path),
+				disp->flags);
+		if (count < 0) {
+			report_error("fdt_find_regions", count);
+			return -1;
+		}
+		if (count <= max_regions)
+			break;
+		free(region);
+	}
+
+	/* Optionally print a list of regions */
+	if (disp->region_list)
+		show_region_list(region, count);
+
+	/* Output either source .dts or binary .dtb */
+	if (disp->output == OUT_DTS) {
+		ret = display_fdt_by_regions(disp, blob, region, count);
+	} else {
+		ret = dump_fdt_regions(disp, blob, region, count);
+		if (ret)
+			fprintf(stderr, "Write failure\n");
+	}
+
+	free(blob);
+	free(region);
+
+	return ret;
+}
+
+static const char usage_synopsis[] =
+	"fdtgrep - extract portions from device tree\n"
+	"\n"
+	"Usage:\n"
+	"	fdtgrep <options> <dt file>|-\n\n"
+	"Output formats are:\n"
+	"\tdts - device tree soure text\n"
+	"\tdtb - device tree blob (sets -Hmt automatically)\n"
+	"\tbin - device tree fragment (may not be a valid .dtb)";
+
+static const char usage_short_opts[] = "haAc:C:defg:G:HIlLmn:N:o:O:p:P:sStv"
+			USAGE_COMMON_SHORT_OPTS;
+static struct option const usage_long_opts[] = {
+	{"show-address",	no_argument, NULL, 'a'},
+	{"colour",		no_argument, NULL, 'A'},
+	{"include-compat",	a_argument, NULL, 'c'},
+	{"exclude-compat",	a_argument, NULL, 'C'},
+	{"diff",		no_argument, NULL, 'd'},
+	{"enter-node",		no_argument, NULL, 'e'},
+	{"show-offset",		no_argument, NULL, 'f'},
+	{"include-match",	a_argument, NULL, 'g'},
+	{"exclude-match",	a_argument, NULL, 'G'},
+	{"show-header",		no_argument, NULL, 'H'},
+	{"show-version",	no_argument, NULL, 'I'},
+	{"list-regions",	no_argument, NULL, 'l'},
+	{"list-strings",	no_argument, NULL, 'L'},
+	{"include-mem",		no_argument, NULL, 'm'},
+	{"include-node",	a_argument, NULL, 'n'},
+	{"exclude-node",	a_argument, NULL, 'N'},
+	{"include-prop",	a_argument, NULL, 'p'},
+	{"exclude-prop",	a_argument, NULL, 'P'},
+	{"show-subnodes",	no_argument, NULL, 's'},
+	{"skip-supernodes",	no_argument, NULL, 'S'},
+	{"show-stringtab",	no_argument, NULL, 't'},
+	{"out",			a_argument, NULL, 'o'},
+	{"out-format",		a_argument, NULL, 'O'},
+	{"invert-match",	no_argument, NULL, 'v'},
+	USAGE_COMMON_LONG_OPTS,
+};
+static const char * const usage_opts_help[] = {
+	"Display address",
+	"Show all nodes/tags, colour those that match",
+	"Compatible nodes to include in grep",
+	"Compatible nodes to exclude in grep",
+	"Diff: Mark matching nodes with +, others with -",
+	"Enter direct subnode names of matching nodes",
+	"Display offset",
+	"Node/property/compatible string to include in grep",
+	"Node/property/compatible string to exclude in grep",
+	"Output a header",
+	"Put \"/dts-v1/;\" on first line of dts output",
+	"Output a region list",
+	"List strings in string table",
+	"Include mem_rsvmap section in binary output",
+	"Node to include in grep",
+	"Node to exclude in grep",
+	"Property to include in grep",
+	"Property to exclude in grep",
+	"Show all subnodes matching nodes",
+	"Don't include supernodes of matching nodes",
+	"Include string table in binary output",
+	"-o <output file>",
+	"-O <output format>",
+	"Invert the sense of matching (select non-matching lines)",
+	USAGE_COMMON_OPTS_HELP
+};
+
+static void scan_args(struct display_info *disp, int argc, char *argv[])
+{
+	int opt;
+
+	while ((opt = util_getopt_long()) != EOF) {
+		int type = 0;
+		int inc = 1;
+
+		switch (opt) {
+		case_USAGE_COMMON_FLAGS
+		case 'a':
+			disp->show_addr = 1;
+			break;
+		case 'A':
+			disp->all = 1;
+			break;
+		case 'C':
+			inc = 0;
+			/* no break */
+		case 'c':
+			type = FDT_IS_COMPAT;
+			break;
+		case 'd':
+			disp->diff = 1;
+			break;
+		case 'e':
+			disp->flags |= FDT_REG_DIRECT_SUBNODES;
+			break;
+		case 'f':
+			disp->show_offset = 1;
+			break;
+		case 'G':
+			inc = 0;
+			/* no break */
+		case 'g':
+			type = FDT_IS_ANY;
+			break;
+		case 'H':
+			disp->header = 1;
+			break;
+		case 'l':
+			disp->region_list = 1;
+			break;
+		case 'L':
+			disp->list_strings = 1;
+			break;
+		case 'm':
+			disp->flags |= FDT_REG_ADD_MEM_RSVMAP;
+			break;
+		case 'N':
+			inc = 0;
+			/* no break */
+		case 'n':
+			type = FDT_IS_NODE;
+			break;
+		case 'o':
+			disp->output_fname = optarg;
+			break;
+		case 'O':
+			if (!strcmp(optarg, "dtb"))
+				disp->output = OUT_DTB;
+			else if (!strcmp(optarg, "dts"))
+				disp->output = OUT_DTS;
+			else if (!strcmp(optarg, "bin"))
+				disp->output = OUT_BIN;
+			else
+				usage("Unknown output format");
+			break;
+		case 'P':
+			inc = 0;
+			/* no break */
+		case 'p':
+			type = FDT_IS_PROP;
+			break;
+		case 's':
+			disp->flags |= FDT_REG_ALL_SUBNODES;
+			break;
+		case 'S':
+			disp->flags &= ~FDT_REG_SUPERNODES;
+			break;
+		case 't':
+			disp->flags |= FDT_REG_ADD_STRING_TAB;
+			break;
+		case 'v':
+			disp->invert = 1;
+			break;
+		case 'I':
+			disp->show_dts_version = 1;
+			break;
+		}
+
+		if (type && value_add(disp, &disp->value_head, type, inc,
+					optarg))
+			usage("Cannot add value");
+	}
+
+	if (disp->invert && disp->types_exc)
+		usage("-v has no meaning when used with 'exclude' conditions");
+}
+
+int main(int argc, char *argv[])
+{
+	char *filename = NULL;
+	struct display_info disp;
+	int ret;
+
+	/* set defaults */
+	memset(&disp, '\0', sizeof(disp));
+	disp.flags = FDT_REG_SUPERNODES;	/* Default flags */
+
+	scan_args(&disp, argc, argv);
+
+	/* Show matched lines in colour if we can */
+	disp.colour = disp.all && isatty(0);
+
+	/* Any additional arguments can match anything, just like -g */
+	while (optind < argc - 1) {
+		if (value_add(&disp, &disp.value_head, FDT_IS_ANY, 1,
+				argv[optind++]))
+			usage("Cannot add value");
+	}
+
+	if (optind < argc)
+		filename = argv[optind++];
+	if (!filename)
+		usage("Missing filename");
+
+	/* If a valid .dtb is required, set flags to ensure we get one */
+	if (disp.output == OUT_DTB) {
+		disp.header = 1;
+		disp.flags |= FDT_REG_ADD_MEM_RSVMAP | FDT_REG_ADD_STRING_TAB;
+	}
+
+	if (disp.output_fname) {
+		disp.fout = fopen(disp.output_fname, "w");
+		if (!disp.fout)
+			usage("Cannot open output file");
+	} else {
+		disp.fout = stdout;
+	}
+
+	/* Run the grep and output the results */
+	ret = do_fdtgrep(&disp, filename);
+	if (disp.output_fname)
+		fclose(disp.fout);
+	if (ret)
+		return 1;
+
+	return 0;
+}
diff --git a/tests/grep.dts b/tests/grep.dts
new file mode 100644
index 0000000..9600657
--- /dev/null
+++ b/tests/grep.dts
@@ -0,0 +1,23 @@
+/dts-v1/;
+/memreserve/ 1 2;
+/ {
+	model = "MyBoardName";
+	compatible = "MyBoardName", "MyBoardFamilyName";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	chosen {
+		bootargs = "root=/dev/sda2";
+		linux,platform = <0x600>;
+	};
+	holiday {
+		compatible = "ixtapa", "mexico";
+		weather = "sunny";
+		status = "okay";
+		flight@1 {
+			airline = "alaska";
+		};
+		flight@2 {
+			airline = "lan";
+		};
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 8757c11..31b5148 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -592,6 +592,357 @@ utilfdt_tests () {
     run_test utilfdt_test
 }
 
+# Add a property to a tree, then hash it and see if it changed
+# Args:
+#   $1: 0 if we expect it to stay the same, 1 if we expect a change
+#   $2: node to add a property to
+#   $3: arguments for fdtget
+#   $4: filename of device tree binary
+#   $5: hash of unchanged file (empty to calculate it)
+#   $6: node to add a property to ("testing" by default if empty)
+check_hash () {
+    local changed="$1"
+    local node="$2"
+    local args="$3"
+    local tree="$4"
+    local base="$5"
+    local nodename="$6"
+
+    if [ -z "$nodename" ]; then
+	nodename=testing
+    fi
+    if [ -z "$base" ]; then
+	base=$($DTGREP ${args} -O bin $tree | sha1sum)
+    fi
+    $DTPUT $tree $node $nodename 1
+    hash=$($DTGREP ${args} -O bin $tree | sha1sum)
+    if [ "$base" == "$hash" ]; then
+	if [ "$changed" == 1 ]; then
+	    echo "$test: Hash should have changed"
+	    echo base $base
+	    echo hash $hash
+	    false
+	fi
+    else
+	if [ "$changed" == 0 ]; then
+	    echo "$test: Base hash is $base but it was changed to $hash"
+	    false
+	fi
+    fi
+}
+
+# Check the number of lines generated matches what we expect
+# Args:
+#   $1: Expected number of lines
+#   $2...: Command line to run to generate output
+check_lines () {
+    local base="$1"
+
+    shift
+    lines=$($@ | wc -l)
+    if [ "$base" != "$lines" ]; then
+	echo "Expected $base lines but got $lines lines"
+	false
+    fi
+}
+
+# Check the number of bytes generated matches what we expect
+# Args:
+#   $1: Expected number of bytes
+#   $2...: Command line to run to generate output
+check_bytes () {
+    local base="$1"
+
+    shift
+    bytes=$($@ | wc -c)
+    if [ "$base" != "$bytes" ]; then
+	echo "Expected $base bytes but got $bytes bytes"
+	false
+    fi
+}
+
+# Check whether a command generates output which contains a string
+# Args:
+#   $1: 0 to expect the string to be absent, 1 to expect it to be present
+#   $2: text to grep for
+#   $3...: Command to execute
+check_contains () {
+    contains="$1"
+    text="$2"
+
+    shift 2
+    if $@ | grep -q $text; then
+	if [ $contains -ne 1 ]; then
+	    echo "Did not expect to find $text in output"
+	    false
+	fi
+    else
+	if [ $contains -ne 0 ]; then
+	    echo "Expected to find $text in output"
+	    false
+	fi
+    fi
+}
+
+# Check that $2 and $3 are equal. $1 is the test name to display
+equal_test () {
+    echo -n "$1:	"
+    if [ "$2" == "$3" ]; then
+	PASS
+    else
+	FAIL "$2 != $3"
+    fi
+}
+
+fdtgrep_tests () {
+    local addr
+    local all_lines        # Total source lines in .dts file
+    local base
+    local dt_start
+    local lines
+    local node_lines       # Number of lines of 'struct' output
+    local orig
+    local string_size
+    local tmp
+    local tree
+
+    tmp=/tmp/tests.$$
+    orig=region_tree.test.dtb
+    run_wrap_test ./region_tree 0 1000 ${orig}
+
+    # Hash of partial tree
+    # - modify tree in various ways and check that hash is unaffected
+    tree=region_tree.mod.dtb
+    cp $orig $tree
+    args="-n /images/kernel@1"
+    run_wrap_test check_hash 0 /images "$args" $tree
+    run_wrap_test check_hash 0 /images/kernel@1/hash@1 "$args" $tree
+    run_wrap_test check_hash 0 / "$args" $tree
+    $DTPUT -c $tree /images/kernel@1/newnode
+    run_wrap_test check_hash 0 / "$args" $tree
+    run_wrap_test check_hash 1 /images/kernel@1 "$args" $tree
+
+    # Now hash immediate subnodes so we detect a new subnode added
+    cp $orig $tree
+    args="-n /images/kernel@1 -e"
+    run_wrap_test check_hash 0 /images "$args" $tree
+    run_wrap_test check_hash 0 /images/kernel@1/hash@1 "$args" $tree
+    run_wrap_test check_hash 0 / "$args" $tree
+    base=$($DTGREP $args -O bin $tree | sha1sum)
+    $DTPUT -c $tree /images/kernel@1/newnode
+    run_wrap_test check_hash 1 / "$args" $tree "$base"
+    cp $orig $tree
+    run_wrap_test check_hash 1 /images/kernel@1 "$args" $tree
+
+    # Hash the string table, which should change if we add a new property name
+    # (Adding an existing property name will just reuse that string)
+    cp $orig $tree
+    args="-t -n /images/kernel@1"
+    run_wrap_test check_hash 0 /images "$args" $tree "" data
+    run_wrap_test check_hash 1 /images/kernel@1 "$args" $tree
+
+    dts=grep.dts
+    dtb=grep.dtb
+    run_dtc_test -O dtb -p 0x1000 -o $dtb $dts
+
+    # Tests for each argument are roughly in alphabetical order
+    #
+    # First a sanity check that we can get back the source from the .dtb
+    all_lines=$(cat $dts | wc -l)
+    run_wrap_test check_lines ${all_lines} $DTGREP -Im $dtb
+    node_lines=$(($all_lines - 2))
+
+    # Get the offset of the dt_struct start (also tests -H somewhat)
+    dt_start=$($DTGREP -H $dtb | awk '/off_dt_struct:/ {print $3}')
+    dt_size=$($DTGREP -H $dtb | awk '/size_dt_struct:/ {print $3}')
+
+    # Check -a: the first line should contain the offset of the dt_start
+    addr=$($DTGREP -a $dtb | head -1 | tr -d : | awk '{print $1}')
+    run_wrap_test equal_test "-a offset first" "$dt_start" "0x$addr"
+
+    # Last line should be 8 bytes less than the size (NODE, END tags)
+    addr=$($DTGREP -a $dtb | tail -1 | tr -d : | awk '{print $1}')
+    last=$(printf "%#x" $(($dt_start + $dt_size - 8)))
+    run_wrap_test equal_test "-a offset last" "$last" "0x$addr"
+
+    # Check the offset option in a similar way. The first offset should be 0
+    # and the last one should be the size of the struct area.
+    addr=$($DTGREP -f $dtb | head -1 | tr -d : | awk '{print $1}')
+    run_wrap_test equal_test "-o offset first" "0x0" "0x$addr"
+    addr=$($DTGREP -f $dtb | tail -1 | tr -d : | awk '{print $1}')
+    last=$(printf "%#x" $(($dt_size - 8)))
+    run_wrap_test equal_test "-f offset last" "$last" "0x$addr"
+
+    # Check that -A controls display of all lines
+    # The 'chosen' node should only have four output lines
+    run_wrap_test check_lines $node_lines $DTGREP -S -A -n /chosen $dtb
+    run_wrap_test check_lines 4 $DTGREP -S -n /chosen $dtb
+
+    # Check that -c picks out nodes
+    run_wrap_test check_lines 5 $DTGREP -S -c ixtapa $dtb
+    run_wrap_test check_lines $(($node_lines - 5)) $DTGREP -S -C ixtapa $dtb
+
+    # -d marks selected lines with +
+    run_wrap_test check_lines $node_lines $DTGREP -S -Ad -n /chosen $dtb
+    run_wrap_test check_lines 4 $DTGREP -S -Ad -n /chosen $dtb |grep +
+
+    # -g should find a node, property or compatible string
+    run_wrap_test check_lines 2 $DTGREP -S -g / $dtb
+    run_wrap_test check_lines 2 $DTGREP -S -g /chosen $dtb
+    run_wrap_test check_lines $(($node_lines - 2)) $DTGREP -S -G /chosen $dtb
+
+    run_wrap_test check_lines 1 $DTGREP -S -g bootargs $dtb
+    run_wrap_test check_lines $(($node_lines - 1)) $DTGREP -S -G bootargs $dtb
+
+    # We should find the /holiday node, so 1 line for 'holiday {', one for '}'
+    run_wrap_test check_lines 2 $DTGREP -S -g ixtapa $dtb
+    run_wrap_test check_lines $(($node_lines - 2)) $DTGREP -S -G ixtapa $dtb
+
+    run_wrap_test check_lines 3 $DTGREP -S -g ixtapa -g bootargs $dtb
+    run_wrap_test check_lines $(($node_lines - 3)) $DTGREP -S -G ixtapa \
+	-G bootargs $dtb
+
+    # -l outputs a,list of regions - here we should get 3: one for the header,
+    # one for the node and one for the 'end' tag.
+    run_wrap_test check_lines 3 $DTGREP -S -l -n /chosen $dtb -o $tmp
+
+    # -L outputs all the strings in the string table
+    cat >$tmp <<END
+	#address-cells
+	airline
+	bootargs
+	compatible
+	linux,platform
+	model
+	#size-cells
+	status
+	weather
+END
+    lines=$(cat $tmp | wc -l)
+    run_wrap_test check_lines $lines $DTGREP -S -L -n // $dtb
+
+    # Check that the -m flag works
+    run_wrap_test check_contains 1 memreserve $DTGREP -Im $dtb
+    run_wrap_test check_contains 0 memreserve $DTGREP -I $dtb
+
+    # Test -n
+    run_wrap_test check_lines 0 $DTGREP -S -n // $dtb
+    run_wrap_test check_lines 0 $DTGREP -S -n chosen $dtb
+    run_wrap_test check_lines 0 $DTGREP -S -n holiday $dtb
+    run_wrap_test check_lines 0 $DTGREP -S -n \"\" $dtb
+    run_wrap_test check_lines 4 $DTGREP -S -n /chosen $dtb
+    run_wrap_test check_lines 5 $DTGREP -S -n /holiday $dtb
+    run_wrap_test check_lines 9 $DTGREP -S -n /chosen -n /holiday $dtb
+
+    # Test -N which should list everything except matching nodes
+    run_wrap_test check_lines $node_lines $DTGREP -S -N // $dtb
+    run_wrap_test check_lines $node_lines $DTGREP -S -N chosen $dtb
+    run_wrap_test check_lines $(($node_lines - 4)) $DTGREP -S -N /chosen $dtb
+    run_wrap_test check_lines $(($node_lines - 5)) $DTGREP -S -N /holiday $dtb
+    run_wrap_test check_lines $(($node_lines - 9)) $DTGREP -S -N /chosen \
+	-N /holiday $dtb
+
+    # Using -n and -N together is undefined, so we don't have tests for that
+    # The same applies for -p/-P and -c/-C.
+    run_wrap_error_test $DTGREP -n chosen -N holiday $dtb
+    run_wrap_error_test $DTGREP -c chosen -C holiday $dtb
+    run_wrap_error_test $DTGREP -p chosen -P holiday $dtb
+
+    # Test -o: this should output just the .dts file to a file
+    # Where there is non-dts output it should go to stdout
+    rm -f $tmp
+    run_wrap_test check_lines 0 $DTGREP $dtb -o $tmp
+    run_wrap_test check_lines $node_lines cat $tmp
+
+    # Here we expect a region list with a single entry, plus a header line
+    # on stdout
+    run_wrap_test check_lines 2 $DTGREP $dtb -o $tmp -l
+    run_wrap_test check_lines $node_lines cat $tmp
+
+    # Here we expect a list of strings on stdout
+    run_wrap_test check_lines ${lines} $DTGREP $dtb -o $tmp -L
+    run_wrap_test check_lines $node_lines cat $tmp
+
+    # Test -p: with -S we only get the compatible lines themselves
+    run_wrap_test check_lines 2 $DTGREP -S -p compatible -n // $dtb
+    run_wrap_test check_lines 1 $DTGREP -S -p bootargs -n // $dtb
+
+    # Without -S we also get the node containing these properties
+    run_wrap_test check_lines 6 $DTGREP -p compatible -n // $dtb
+    run_wrap_test check_lines 5 $DTGREP -p bootargs -n // $dtb
+
+    # Now similar tests for -P
+    # First get the number of property lines (containing '=')
+    lines=$(grep "=" $dts |wc -l)
+    run_wrap_test check_lines $(($lines - 2)) $DTGREP -S -P compatible \
+	-n // $dtb
+    run_wrap_test check_lines $(($lines - 1)) $DTGREP -S -P bootargs \
+	-n // $dtb
+    run_wrap_test check_lines $(($lines - 3)) $DTGREP -S -P compatible \
+	-P bootargs -n // $dtb
+
+    # Without -S we also get the node containing these properties
+    run_wrap_test check_lines $(($node_lines - 2)) $DTGREP -P compatible \
+	-n // $dtb
+    run_wrap_test check_lines $(($node_lines - 1)) $DTGREP -P bootargs \
+	-n // $dtb
+    run_wrap_test check_lines $(($node_lines - 3)) $DTGREP -P compatible \
+	-P bootargs -n // $dtb
+
+    # -s should bring in all sub-nodes
+    run_wrap_test check_lines 2 $DTGREP -p none -n / $dtb
+    run_wrap_test check_lines 6 $DTGREP -e -p none -n / $dtb
+    run_wrap_test check_lines 2 $DTGREP -S -p none -n /holiday $dtb
+    run_wrap_test check_lines 4 $DTGREP  -p none -n /holiday $dtb
+    run_wrap_test check_lines 8 $DTGREP -e -p none -n /holiday $dtb
+
+    # -v inverts the polarity of any condition
+    run_wrap_test check_lines $(($node_lines - 2)) $DTGREP -Sv -p none \
+	-n / $dtb
+    run_wrap_test check_lines $(($node_lines - 2)) $DTGREP -Sv -p compatible \
+	-n // $dtb
+    run_wrap_test check_lines $(($node_lines - 2)) $DTGREP -Sv -g /chosen \
+	$dtb
+    run_wrap_test check_lines $node_lines $DTGREP -Sv -n // $dtb
+    run_wrap_test check_lines $node_lines $DTGREP -Sv -n chosen $dtb
+    run_wrap_error_test $DTGREP -v -N holiday $dtb
+
+    # Check that the -I flag works
+    run_wrap_test check_contains 1 dts-v1 $DTGREP -I $dtb
+    run_wrap_test check_contains 0 dts-v1 $DTGREP $dtb
+
+    # Now some dtb tests. The dts tests above have tested the basic grepping
+    # features so we only need to concern ourselves with things that are
+    # different about dtb/bin output.
+
+    # An empty node list should just give us the FDT_END tag
+    run_wrap_test check_bytes 4 $DTGREP -n // -O bin $dtb
+
+    # The mem_rsvmap is two entries of 16 bytes each
+    run_wrap_test check_bytes $((4 + 32)) $DTGREP -m -n // -O bin $dtb
+
+    # Check we can add the string table
+    string_size=$($DTGREP -H $dtb | awk '/size_dt_strings:/ {print $3}')
+    run_wrap_test check_bytes $((4 + $string_size)) $DTGREP -t -n // -O bin \
+	$dtb
+    run_wrap_test check_bytes $((4 + 32 + $string_size)) $DTGREP -tm \
+	-n // -O bin $dtb
+
+    # Check that a pass-through works ok. fdtgrep aligns the mem_rsvmap table
+    # to a 16-bytes boundary, but dtc uses 8 bytes so we expect the size to
+    # increase by 8 bytes...
+    run_dtc_test -O dtb -o $dtb $dts
+    base=$(stat -c %s $dtb)
+    run_wrap_test check_bytes $(($base + 8)) $DTGREP -O dtb $dtb
+
+    # ...but we should get the same output from fdtgrep in a second pass
+    run_wrap_test check_bytes 0 $DTGREP -O dtb $dtb -o $tmp
+    base=$(stat -c %s $tmp)
+    run_wrap_test check_bytes $base $DTGREP -O dtb $tmp
+
+    rm -f $tmp
+}
+
 while getopts "vt:m" ARG ; do
     case $ARG in
 	"v")
@@ -607,7 +958,7 @@ while getopts "vt:m" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtgrep"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -633,6 +984,9 @@ for set in $TESTSETS; do
 	"fdtput")
 	    fdtput_tests
 	    ;;
+	"fdtgrep")
+	    fdtgrep_tests
+	    ;;
     esac
 done
 
diff --git a/tests/tests.sh b/tests/tests.sh
index 31530d5..8e4b65b 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -21,6 +21,7 @@ FAIL_IF_SIGNAL () {
 DTC=../dtc
 DTGET=../fdtget
 DTPUT=../fdtput
+DTGREP=../fdtgrep
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
1.8.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
