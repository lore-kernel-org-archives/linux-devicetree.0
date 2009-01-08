From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [1/2] dtc: Make asm output more portable and add testcases
Date: Thu, 8 Jan 2009 11:47:55 +1100
Message-ID: <20090108004755.GC25270@yookeroo.seuss>
References: <20090108004645.GB25270@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090108004645.GB25270-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds some testcases for dtc's -Oasm mode.  Specifically it
checks that building the asm will result in the same device tree blob
in memory as -Odtb mode would produce, for a variety of trees.  This
test uncovered two difficulties with our current -Oasm output, both of
which are addressed in this patch as well.

First, -Oasm output would only be correct if assembled for a
big-endian target.  Usually that would be the case, when building
device trees into a firmware or similar.  However this makes life
inconvenient for testing on a little-endian target, and one can think
up use cases where a program running on a little endian host might
want to embed a device tree for a big-endian target.  This patch
therefore changes -Oasm output to use .byte directives instead of
.long throughout in order to generate byte-for-byte identical trees
regardless of the endianness of the assembler target.

Second, -Oasm output emitted several #define statements which were
then used in the innards of the output - i.e. it assumed the output
would be processed by cpp before being assembled.  That may not be
convenient in all build environments, and in any case doesn't work
well with the above fix.  So, -Oasm output no longer needs to be
preprocessed before assembling.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2009-01-05 10:40:50.000000000 +1100
+++ dtc/tests/run_tests.sh	2009-01-05 10:47:51.000000000 +1100
@@ -71,6 +71,15 @@ run_dtc_test () {
     base_run_test wrap_test $VALGRIND $DTC "$@"
 }
 
+asm_to_so () {
+    as -o $1.test.o data.S $1.test.s && \
+	ld -shared -o $1.test.so $1.test.o
+}
+
+asm_to_so_test () {
+    run_wrap_test asm_to_so "$@"
+}
+
 tree1_tests () {
     TREE=$1
 
@@ -228,6 +237,16 @@ dtc_tests () {
     run_dtc_test -I dtb -O dtb -o boot_cpuid_preserved_test_tree1.test.dtb boot_cpuid_test_tree1.test.dtb
     run_test dtbs_equal_ordered boot_cpuid_preserved_test_tree1.test.dtb boot_cpuid_test_tree1.test.dtb
 
+    # Check -Oasm mode
+    for tree in test_tree1.dts escapes.dts references.dts path-references.dts \
+	comments.dts aliases.dts include0.dts incbin.dts ; do
+	run_dtc_test -I dts -O asm -o oasm_$tree.test.s $tree
+	asm_to_so_test oasm_$tree
+	run_dtc_test -I dts -O dtb -o $tree.test.dtb $tree
+	run_test asm_tree_dump ./oasm_$tree.test.so oasm_$tree.test.dtb
+	run_wrap_test cmp oasm_$tree.test.dtb $tree.test.dtb
+    done
+
     # Check -Odts mode preserve all dtb information
     for tree in test_tree1.dtb dtc_tree1.test.dtb dtc_escapes.test.dtb \
 	dtc_references.test.dtb; do
Index: dtc/Makefile
===================================================================
--- dtc.orig/Makefile	2009-01-05 10:41:08.000000000 +1100
+++ dtc/Makefile	2009-01-05 10:47:51.000000000 +1100
@@ -175,7 +175,7 @@ include tests/Makefile.tests
 #
 # Clean rules
 #
-STD_CLEANFILES = *~ *.o *.d *.a *.i *.s core a.out vgcore.* \
+STD_CLEANFILES = *~ *.o *.so *.d *.a *.i *.s core a.out vgcore.* \
 	*.tab.[ch] *.lex.c *.output
 
 clean: libfdt_clean tests_clean
Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2009-01-05 10:41:08.000000000 +1100
+++ dtc/tests/Makefile.tests	2009-01-05 10:48:30.000000000 +1100
@@ -18,7 +18,10 @@ LIB_TESTS = $(LIB_TESTS_L:%=$(TESTS_PREF
 LIBTREE_TESTS_L = truncated_property
 LIBTREE_TESTS = $(LIBTREE_TESTS_L:%=$(TESTS_PREFIX)%)
 
-TESTS = $(LIB_TESTS) $(LIBTREE_TESTS)
+DL_LIB_TESTS_L = asm_tree_dump
+DL_LIB_TESTS = $(DL_LIB_TESTS_L:%=$(TESTS_PREFIX)%)
+
+TESTS = $(LIB_TESTS) $(LIBTREE_TESTS) $(DL_LIB_TESTS)
 
 TESTS_TREES_L = test_tree1.dtb
 TESTS_TREES = $(TESTS_TREES_L:%=$(TESTS_PREFIX)%)
@@ -37,6 +40,8 @@ tests:	$(TESTS) $(TESTS_TREES)
 
 $(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o $(LIBFDT_archive)
 
+$(DL_LIB_TESTS): %: $(TESTS_PREFIX)testutils.o $(LIBFDT_archive) -ldl
+
 $(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o $(LIBFDT_archive)
 
 $(TESTS_PREFIX)dumptrees: $(TESTS_PREFIX)trees.o
Index: dtc/flattree.c
===================================================================
--- dtc.orig/flattree.c	2009-01-05 10:40:50.000000000 +1100
+++ dtc/flattree.c	2009-01-05 10:47:51.000000000 +1100
@@ -127,11 +127,21 @@ static void emit_offset_label(FILE *f, c
 	fprintf(f, "%s\t= . + %d\n", label, offset);
 }
 
+#define ASM_EMIT_BELONG(f, fmt, ...) \
+	{ \
+		fprintf((f), "\t.byte\t((" fmt ") >> 24) & 0xff\n", __VA_ARGS__); \
+		fprintf((f), "\t.byte\t((" fmt ") >> 16) & 0xff\n", __VA_ARGS__); \
+		fprintf((f), "\t.byte\t((" fmt ") >> 8) & 0xff\n", __VA_ARGS__); \
+		fprintf((f), "\t.byte\t(" fmt ") & 0xff\n", __VA_ARGS__); \
+	}
+
 static void asm_emit_cell(void *e, cell_t val)
 {
 	FILE *f = e;
 
-	fprintf(f, "\t.long\t0x%x\n", val);
+	fprintf(f, "\t.byte 0x%02x; .byte 0x%02x; .byte 0x%02x; .byte 0x%02x\n",
+		(val >> 24) & 0xff, (val >> 16) & 0xff,
+		(val >> 8) & 0xff, val & 0xff);
 }
 
 static void asm_emit_string(void *e, char *str, int len)
@@ -169,8 +179,7 @@ static void asm_emit_data(void *e, struc
 		emit_offset_label(f, m->ref, m->offset);
 
 	while ((d.len - off) >= sizeof(uint32_t)) {
-		fprintf(f, "\t.long\t0x%x\n",
-			fdt32_to_cpu(*((uint32_t *)(d.val+off))));
+		asm_emit_cell(e, fdt32_to_cpu(*((uint32_t *)(d.val+off))));
 		off += sizeof(uint32_t);
 	}
 
@@ -190,14 +199,16 @@ static void asm_emit_beginnode(void *e, 
 		fprintf(f, "\t.globl\t%s\n", label);
 		fprintf(f, "%s:\n", label);
 	}
-	fprintf(f, "\t.long\tFDT_BEGIN_NODE\n");
+	fprintf(f, "\t/* FDT_BEGIN_NODE */\n");
+	asm_emit_cell(e, FDT_BEGIN_NODE);
 }
 
 static void asm_emit_endnode(void *e, const char *label)
 {
 	FILE *f = e;
 
-	fprintf(f, "\t.long\tFDT_END_NODE\n");
+	fprintf(f, "\t/* FDT_END_NODE */\n");
+	asm_emit_cell(e, FDT_END_NODE);
 	if (label) {
 		fprintf(f, "\t.globl\t%s_end\n", label);
 		fprintf(f, "%s_end:\n", label);
@@ -212,7 +223,8 @@ static void asm_emit_property(void *e, c
 		fprintf(f, "\t.globl\t%s\n", label);
 		fprintf(f, "%s:\n", label);
 	}
-	fprintf(f, "\t.long\tFDT_PROP\n");
+	fprintf(f, "\t/* FDT_PROP */\n");
+	asm_emit_cell(e, FDT_PROP);
 }
 
 static struct emitter asm_emitter = {
@@ -458,39 +470,44 @@ void dt_to_asm(FILE *f, struct boot_info
 		die("Unknown device tree blob version %d\n", version);
 
 	fprintf(f, "/* autogenerated by dtc, do not edit */\n\n");
-	fprintf(f, "#define FDT_MAGIC 0x%x\n", FDT_MAGIC);
-	fprintf(f, "#define FDT_BEGIN_NODE 0x%x\n", FDT_BEGIN_NODE);
-	fprintf(f, "#define FDT_END_NODE 0x%x\n", FDT_END_NODE);
-	fprintf(f, "#define FDT_PROP 0x%x\n", FDT_PROP);
-	fprintf(f, "#define FDT_END 0x%x\n", FDT_END);
-	fprintf(f, "\n");
 
 	emit_label(f, symprefix, "blob_start");
 	emit_label(f, symprefix, "header");
-	fprintf(f, "\t.long\tFDT_MAGIC\t\t\t\t/* magic */\n");
-	fprintf(f, "\t.long\t_%s_blob_abs_end - _%s_blob_start\t/* totalsize */\n",
-		symprefix, symprefix);
-	fprintf(f, "\t.long\t_%s_struct_start - _%s_blob_start\t/* off_dt_struct */\n",
+	fprintf(f, "\t/* magic */\n");
+	asm_emit_cell(f, FDT_MAGIC);
+	fprintf(f, "\t/* totalsize */\n");
+	ASM_EMIT_BELONG(f, "_%s_blob_abs_end - _%s_blob_start",
+			symprefix, symprefix);
+	fprintf(f, "\t/* off_dt_struct */\n");
+	ASM_EMIT_BELONG(f, "_%s_struct_start - _%s_blob_start",
 		symprefix, symprefix);
-	fprintf(f, "\t.long\t_%s_strings_start - _%s_blob_start\t/* off_dt_strings */\n",
+	fprintf(f, "\t/* off_dt_strings */\n");
+	ASM_EMIT_BELONG(f, "_%s_strings_start - _%s_blob_start",
 		symprefix, symprefix);
-	fprintf(f, "\t.long\t_%s_reserve_map - _%s_blob_start\t/* off_dt_strings */\n",
+	fprintf(f, "\t/* off_mem_rsvmap */\n");
+	ASM_EMIT_BELONG(f, "_%s_reserve_map - _%s_blob_start",
 		symprefix, symprefix);
-	fprintf(f, "\t.long\t%d\t\t\t\t\t/* version */\n", vi->version);
-	fprintf(f, "\t.long\t%d\t\t\t\t\t/* last_comp_version */\n",
-		vi->last_comp_version);
+	fprintf(f, "\t/* version */\n");
+	asm_emit_cell(f, vi->version);
+	fprintf(f, "\t/* last_comp_version */\n");
+	asm_emit_cell(f, vi->last_comp_version);
 
-	if (vi->flags & FTF_BOOTCPUID)
-		fprintf(f, "\t.long\t%i\t\t\t\t\t/* boot_cpuid_phys */\n",
-			bi->boot_cpuid_phys);
+	if (vi->flags & FTF_BOOTCPUID) {
+		fprintf(f, "\t/* boot_cpuid_phys */\n");
+		asm_emit_cell(f, bi->boot_cpuid_phys);
+	}
 
-	if (vi->flags & FTF_STRTABSIZE)
-		fprintf(f, "\t.long\t_%s_strings_end - _%s_strings_start\t/* size_dt_strings */\n",
-			symprefix, symprefix);
+	if (vi->flags & FTF_STRTABSIZE) {
+		fprintf(f, "\t/* size_dt_strings */\n");
+		ASM_EMIT_BELONG(f, "_%s_strings_end - _%s_strings_start",
+				symprefix, symprefix);
+	}
 
-	if (vi->flags & FTF_STRUCTSIZE)
-		fprintf(f, "\t.long\t_%s_struct_end - _%s_struct_start\t/* size_dt_struct */\n",
+	if (vi->flags & FTF_STRUCTSIZE) {
+		fprintf(f, "\t/* size_dt_struct */\n");
+		ASM_EMIT_BELONG(f, "_%s_struct_end - _%s_struct_start",
 			symprefix, symprefix);
+	}
 
 	/*
 	 * Reserve map entries.
@@ -512,12 +529,11 @@ void dt_to_asm(FILE *f, struct boot_info
 			fprintf(f, "\t.globl\t%s\n", re->label);
 			fprintf(f, "%s:\n", re->label);
 		}
-		fprintf(f, "\t.long\t0x%08x, 0x%08x\n",
-			(unsigned int)(re->re.address >> 32),
-			(unsigned int)(re->re.address & 0xffffffff));
-		fprintf(f, "\t.long\t0x%08x, 0x%08x\n",
-			(unsigned int)(re->re.size >> 32),
-			(unsigned int)(re->re.size & 0xffffffff));
+		ASM_EMIT_BELONG(f, "0x%08x", (unsigned int)(re->re.address >> 32));
+		ASM_EMIT_BELONG(f, "0x%08x",
+				(unsigned int)(re->re.address & 0xffffffff));
+		ASM_EMIT_BELONG(f, "0x%08x", (unsigned int)(re->re.size >> 32));
+		ASM_EMIT_BELONG(f, "0x%08x", (unsigned int)(re->re.size & 0xffffffff));
 	}
 	for (i = 0; i < reservenum; i++) {
 		fprintf(f, "\t.long\t0, 0\n\t.long\t0, 0\n");
@@ -527,7 +543,9 @@ void dt_to_asm(FILE *f, struct boot_info
 
 	emit_label(f, symprefix, "struct_start");
 	flatten_tree(bi->dt, &asm_emitter, f, &strbuf, vi);
-	fprintf(f, "\t.long\tFDT_END\n");
+
+	fprintf(f, "\t/* FDT_END */\n");
+	asm_emit_cell(f, FDT_END);
 	emit_label(f, symprefix, "struct_end");
 
 	emit_label(f, symprefix, "strings_start");
Index: dtc/tests/asm_tree_dump.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/asm_tree_dump.c	2009-01-05 10:47:51.000000000 +1100
@@ -0,0 +1,62 @@
+/*
+ * libfdt - Flat Device Tree manipulation
+ *	Tests if an asm tree built into a shared object matches a given dtb
+ * Copyright (C) 2008 David Gibson, IBM Corporation.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public License
+ * as published by the Free Software Foundation; either version 2.1 of
+ * the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+#include <errno.h>
+
+#include <dlfcn.h>
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "tests.h"
+#include "testdata.h"
+
+int main(int argc, char *argv[])
+{
+	void *sohandle;
+	void *fdt;
+	int err;
+
+	test_init(argc, argv);
+	if (argc != 3)
+		CONFIG("Usage: %s <so file> <dtb file>", argv[0]);
+
+	sohandle = dlopen(argv[1], RTLD_NOW);
+	if (!sohandle)
+		FAIL("Couldn't dlopen() %s", argv[1]);
+
+	fdt = dlsym(sohandle, "dt_blob_start");
+	if (!fdt)
+		FAIL("Couldn't locate \"dt_blob_start\" symbol in %s",
+		     argv[1]);
+
+	err = fdt_check_header(fdt);
+	if (err != 0)
+		FAIL("%s contains invalid tree: %s", argv[1],
+		     fdt_strerror(err));
+
+	save_blob(argv[2], fdt);
+
+	PASS();
+}
Index: dtc/tests/data.S
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/data.S	2009-01-05 10:47:51.000000000 +1100
@@ -0,0 +1,3 @@
+/* Used in combination with dtc -Oasm output to embed
+ * a device tree in the data section of a .o */
+	.data


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
