From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] libfdt: Use libfdt shared library for testcases
Date: Fri, 2 Jan 2009 08:21:13 -0500
Message-ID: <20090102132113.GC8954@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Link the testcases against the libfdt.so that is built and use
it for the testsuite verification.

Signed-off-by: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 tests/Makefile.tests |    9 +++++++--
 tests/tests.sh       |    1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 3a041ff..0b0ff70 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -35,9 +35,11 @@ TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
 .PHONY: tests
 tests:	$(TESTS) $(TESTS_TREES)
 
-$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o $(LIBFDT_archive)
+$(LIB_TESTS): LDFLAGS = -L$(LIBFDT_objdir) -lfdt
+$(LIB_TESTS): $(TESTS_PREFIX)testutils.o $(LIBFDT_lib)
 
-$(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o $(LIBFDT_archive)
+$(LIBTREE_TESTS): LDFLAGS = -L$(LIBFDT_objdir) -lfdt
+$(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o $(LIBFDT_lib)
 
 $(TESTS_PREFIX)dumptrees: $(TESTS_PREFIX)trees.o
 
@@ -45,6 +47,9 @@ $(TESTS_TREES): $(TESTS_PREFIX)dumptrees
 	@$(VECHO) DUMPTREES
 	cd $(TESTS_PREFIX); ./dumptrees >/dev/null
 
+$(TESTS_PREFIX)testutils.o: $(TESTS_PREFIX)testutils.c
+	$(CC) $(CPPFLAGS) $(CFLAGS) -L$(LIBFDT_objdir) -lfdt -o $@ -c $<
+
 tests_clean:
 	@$(VECHO) CLEAN "(tests)"
 	rm -f $(STD_CLEANFILES:%=$(TESTS_PREFIX)%)
diff --git a/tests/tests.sh b/tests/tests.sh
index 30ffead..6eb972b 100644
--- a/tests/tests.sh
+++ b/tests/tests.sh
@@ -11,6 +11,7 @@ FAIL () {
 }
 
 DTC=../dtc
+LD_LIBRARY_PATH=../libfdt
 
 verbose_run () {
     if [ -z "$QUIET_TEST" ]; then
-- 
1.6.0.6
