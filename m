From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 6/8] Add fdtgrep to grep and subset FDTs
Date: Mon, 21 Jan 2013 12:59:20 -0800
Message-ID: <1358801962-21707-7-git-send-email-sjg@chromium.org>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358801962-21707-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
 .gitignore         |    1 +
 Makefile           |    4 +
 Makefile.utils     |    7 +
 fdtgrep.c          |  775 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/grep.dts     |   23 ++
 tests/run_tests.sh |  348 +++++++++++++++++++++++-
 tests/tests.sh     |    1 +
 7 files changed, 1158 insertions(+), 1 deletions(-)
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
diff --git a/Makefile b/Makefile
index 1169e6c..96e0488 100644
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
index 0000000..bb08f12
--- /dev/null
+++ b/fdtgrep.c
@@ -0,0 +1,775 @@
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
+	int show_offset;	/* Show address / offset */
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
+		if (disp->show_offset && tag != FDT_END)
+			fprintf(f, "%4x: ", file_ofs);
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
+
+		for (offset = 0; offset < fdt_size_dt_strings(blob);
+				offset += strlen(str) + 1) {
+			str = fdt_string(blob, offset);
+			int len = strlen(str) + 1;
+			int show;
+
+			/* Only print strings that are in the region */
+			file_ofs = fdt_off_dt_strings(blob) + offset;
+			in_region = reg < reg_end &&
+					file_ofs >= reg->offset &&
+					file_ofs + len < reg->offset +
+						reg->size;
+			show = in_region || disp->all;
+			if (show && disp->diff)
+				printf("%c", in_region ? '+' : '-');
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
+/**
+ * h_include() - Include handler function for fdt_find_regions()
+ *
+ * This function decides whether to include or exclude a node, property or
+ * compatible string. The function is defined by fdt_find_regions().
+ *
+ * The algorithm is documented in the code - disp->invert is 0 for normal
+ * operation, and 1 to invert the sense of all matches.
+ */
+static int h_include(void *priv, int type, const char *data, int size)
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
+		if (match && val->include) {
+			debug("   - match inc %s\n", val->string);
+			return !disp->invert;
+		}
+		if (match)
+			none_match &= ~val->type;
+	}
+
+	/*
+	 * If this is an exclusive condition, and nothing matches, then we
+	 * should return 1
+	 */
+	if ((type & disp->types_exc) && (none_match & type)) {
+		/*
+		 * Allow FDT_IS_COMPAT to make the final decision in the
+		 * case where there is no specific type
+		 */
+		if (type == FDT_IS_NODE && disp->types_exc == FDT_IS_ANY) {
+			debug("   - supressed exc node\n");
+			return -1;
+		}
+		debug("   - match exc\n");
+		return !disp->invert;
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
+	return disp->invert;
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
+static const char *usage_msg =
+	"fdtgrep - extract portions from device tree\n"
+	"\n"
+	"Usage:\n"
+	"	fdtgrep <options> [<match nodes/prop/compat>...] <dt file>|-\n"
+	"Options:\n"
+	"\t-a\tDisplay address / offset\n"
+	"\t-A\tShow all nodes/tags, colour those that match\n"
+	"\t-c/-C <node>\tCompatible nodes to include/exclude in grep\n"
+	"\t-d\tDiff: Mark matching nodes with +, others with -\n"
+	"\t-g/-G <node>\tNode/property/compatible string to include/exclude\n"
+	"\t-H\tOutput a header\n"
+	"\t-l\tOutput a region list\n"
+	"\t-L\tList strings in string table\n"
+	"\t-m\tInclude mem_rsvmap section in binary output\n"
+	"\t-n/-N <node>\tNode to include/exclude in grep\n"
+	"\t-p/-P <node>\tProperty to include/exclude in grep\n"
+	"\t-s\tInclude direct subnode names of matching nodes\n"
+	"\t-S\tDon't include supernodes of matching nodes\n"
+	"\t-t\tInclude string table in binary output\n"
+	"\t-o <output file>\n"
+	"\t-O <output format>\n"
+	"\t\tOutput formats are:\n"
+	"\t\t\tdts - device tree source text\n"
+	"\t\t\tdtb - device tree blob (sets -Hmt automatically)\n"
+	"\t\t\tbin - device tree fragment (may not be a valid .dtb)\n"
+	"\t-v\tInvert the sense of matching, to select non-matching lines\n"
+	"\t-V\tPut \"/dts-v1/;\" on first line of dts output\n"
+	"\t-h\t\tPrint this help\n\n"
+	USAGE_TYPE_MSG;
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
+static void scan_args(struct display_info *disp, int argc, char *argv[])
+{
+	for (;;) {
+		int c = getopt(argc, argv,
+			       "haAc:C:dg:G:HlLmn:N:o:O:p:P:sStvV");
+		int type = 0;
+		int inc = 1;
+
+		if (c == -1)
+			break;
+
+		switch (c) {
+		case 'h':
+		case '?':
+			usage(NULL);
+		case 'a':
+			disp->show_offset = 1;
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
+			disp->flags |= FDT_REG_DIRECT_SUBNODES;
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
+		case 'V':
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
+		disp.flags |= FDT_REG_SUPERNODES;
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
index 59b6055..19c6264 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -584,6 +584,349 @@ utilfdt_tests () {
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
+    ./region_tree 0 1000 ${orig}
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
+    args="-n /images/kernel@1 -s"
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
+    run_wrap_test check_lines ${all_lines} $DTGREP -Vm $dtb
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
+    run_wrap_test check_contains 1 memreserve $DTGREP -Vm $dtb
+    run_wrap_test check_contains 0 memreserve $DTGREP -V $dtb
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
+    run_wrap_test check_lines 6 $DTGREP -s -p none -n / $dtb
+    run_wrap_test check_lines 2 $DTGREP -S -p none -n /holiday $dtb
+    run_wrap_test check_lines 4 $DTGREP  -p none -n /holiday $dtb
+    run_wrap_test check_lines 8 $DTGREP -s -p none -n /holiday $dtb
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
+    # Check that the -V flag works
+    run_wrap_test check_contains 1 dts-v1 $DTGREP -V $dtb
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
@@ -599,7 +942,7 @@ while getopts "vt:m" ARG ; do
 done
 
 if [ -z "$TESTSETS" ]; then
-    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput"
+    TESTSETS="libfdt utilfdt dtc dtbs_equal fdtget fdtput fdtgrep"
 fi
 
 # Make sure we don't have stale blobs lying around
@@ -625,6 +968,9 @@ for set in $TESTSETS; do
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
1.7.7.3
