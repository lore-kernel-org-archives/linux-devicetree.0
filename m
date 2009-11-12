From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Fix dtc bugs for 64-bit compile
Date: Thu, 12 Nov 2009 13:30:02 +1100
Message-ID: <20091112023002.GN3235@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

I've just tested building dtc as an x86_64 binary on a 32-bit i386
host by using:
	make CC="gcc -m64"
This patch fixes a handful of minor bugs thus discovered:

 * There is a printf() type mismatch on 64-bit in value-labels.c

 * For the tests which use libdl, we were using the GNU make feature
where it will find libdl.so given a dependency in the form '-ldl'.
But this built-in make logic doesn't know we're compiling 64-bit so
finds the 32-bit version of the library.  We avoid using this and
instead explicitly pass -ldl to CC, which being the 64-bit version
does know where to look.

 * To process dtc's asm output into .so files, run_tests.sh was
directly invoking the (default instance of) the assembler and linker.
Instead invoke these via the CC driver, and allow that to be overriden
from the make environment.

 * The x86_64 assembler doesn't 0 fill with the .balign directive
(presumably it is NOP filling).  That doesn't produce strictly
incorrect trees, but it is confusing and confounds are testcases which
do byte-by-byte comparison of the trees produced by asm output with
direct dtb output (which does 0 pad where necessary, of course).  This
patch uses the optional second argument to .balign to force gas to
zero-fill instead.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/value-labels.c
===================================================================
--- dtc.orig/tests/value-labels.c	2009-11-12 11:52:14.000000000 +1100
+++ dtc/tests/value-labels.c	2009-11-12 11:52:56.000000000 +1100
@@ -89,9 +89,9 @@ void check_prop_labels(void *sohandle, v
 			FAIL("Couldn't locate label symbol \"%s\"", name);
 
 		if ((p - prop->data) != off)
-			FAIL("Label \"%s\" points to offset %d instead of %d"
+			FAIL("Label \"%s\" points to offset %ld instead of %d"
 			     "in property \"%s\"", labels[i].labelname,
-			     p - prop->data, off, name);
+			     (long)(p - prop->data), off, name);
 	}
 }
 
Index: dtc/tests/Makefile.tests
===================================================================
--- dtc.orig/tests/Makefile.tests	2009-11-12 11:52:14.000000000 +1100
+++ dtc/tests/Makefile.tests	2009-11-12 11:52:56.000000000 +1100
@@ -41,7 +41,9 @@ tests:	$(TESTS) $(TESTS_TREES)
 
 $(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o $(LIBFDT_archive)
 
-$(DL_LIB_TESTS): %: $(TESTS_PREFIX)testutils.o $(LIBFDT_archive) -ldl
+$(DL_LIB_TESTS): %: %.o $(TESTS_PREFIX)testutils.o $(LIBFDT_archive)
+	@$(VECHO) LD [libdl] $@
+	$(LINK.c) -o $@ $^ -ldl
 
 $(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o $(LIBFDT_archive)
 
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2009-11-12 11:52:50.000000000 +1100
+++ dtc/tests/run_tests.sh	2009-11-12 11:52:56.000000000 +1100
@@ -2,6 +2,10 @@
 
 . ./tests.sh
 
+if [ -z "$CC" ]; then
+    CC=gcc
+fi
+
 export QUIET_TEST=1
 
 export VALGRIND=
@@ -72,8 +76,7 @@ run_dtc_test () {
 }
 
 asm_to_so () {
-    as -o $1.test.o data.S $1.test.s && \
-	ld -shared -o $1.test.so $1.test.o
+    $CC -shared -o $1.test.so data.S $1.test.s
 }
 
 asm_to_so_test () {
Index: dtc/flattree.c
===================================================================
--- dtc.orig/flattree.c	2009-11-12 11:52:14.000000000 +1100
+++ dtc/flattree.c	2009-11-12 11:52:56.000000000 +1100
@@ -166,7 +166,7 @@ static void asm_emit_align(void *e, int 
 {
 	FILE *f = e;
 
-	fprintf(f, "\t.balign\t%d\n", a);
+	fprintf(f, "\t.balign\t%d, 0\n", a);
 }
 
 static void asm_emit_data(void *e, struct data d)


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
