From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2] libfdt: Introduce libfdt shared library
Date: Fri, 2 Jan 2009 08:20:34 -0500
Message-ID: <20090102132034.GB8954@zod.rchland.ibm.com>
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

Build a libfdt shared library in addition to the existing .a that is
created.  Symbol versioning is used from the libfdt/version.lds script.

Signed-off-by: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 Makefile               |   15 ++++++++++++---
 libfdt/Makefile.libfdt |    1 +
 tests/Makefile.tests   |    4 ++--
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index b3b85a5..8d5b929 100644
--- a/Makefile
+++ b/Makefile
@@ -16,7 +16,7 @@ LOCAL_VERSION =
 CONFIG_LOCALVERSION =
 
 CPPFLAGS = -I libfdt
-CFLAGS = -Wall -g -Os -Wpointer-arith -Wcast-qual
+CFLAGS = -Wall -g -Os -fPIC -Wpointer-arith -Wcast-qual
 
 BISON = bison
 LEX = flex
@@ -115,19 +115,23 @@ endif
 #
 LIBFDT_objdir = libfdt
 LIBFDT_srcdir = libfdt
-LIBFDT_lib = $(LIBFDT_objdir)/libfdt.a
+LIBFDT_archive = $(LIBFDT_objdir)/libfdt.a
+LIBFDT_lib = $(LIBFDT_objdir)/libfdt.so
 LIBFDT_include = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_INCLUDES))
+LIBFDT_version = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_VERSION))
 
 include $(LIBFDT_srcdir)/Makefile.libfdt
 
 .PHONY: libfdt
-libfdt: $(LIBFDT_lib)
+libfdt: $(LIBFDT_archive) $(LIBFDT_lib)
 
+$(LIBFDT_archive): $(addprefix $(LIBFDT_objdir)/,$(LIBFDT_OBJS))
 $(LIBFDT_lib): $(addprefix $(LIBFDT_objdir)/,$(LIBFDT_OBJS))
 
 libfdt_clean:
 	@$(VECHO) CLEAN "(libfdt)"
 	rm -f $(addprefix $(LIBFDT_objdir)/,$(STD_CLEANFILES))
+	rm -f $(LIBFDT_objdir)/*.so
 
 ifneq ($(DEPTARGETS),)
 -include $(LIBFDT_OBJS:%.o=$(LIBFDT_objdir)/%.d)
@@ -215,6 +219,11 @@ clean: libfdt_clean tests_clean
 	@$(VECHO) AR $@
 	$(AR) $(ARFLAGS) $@ $^
 
+$(LIBFDT_lib):
+	@$(VECHO) LD $@
+	$(CC) $(LDFLAGS) -fPIC -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,$(notdir $@) -shared -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).so $^
+	ln -s libfdt-$(DTC_VERSION).so $(LIBFDT_objdir)/libfdt.so
+
 %.lex.c: %.l
 	@$(VECHO) LEX $@
 	$(LEX) -o$@ $<
diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
index 6c42acf..341c803 100644
--- a/libfdt/Makefile.libfdt
+++ b/libfdt/Makefile.libfdt
@@ -4,5 +4,6 @@
 # be easily embeddable into other systems of Makefiles.
 #
 LIBFDT_INCLUDES = fdt.h libfdt.h
+LIBFDT_VERSION = version.lds
 LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 21a311e..3a041ff 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -35,9 +35,9 @@ TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
 .PHONY: tests
 tests:	$(TESTS) $(TESTS_TREES)
 
-$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o $(LIBFDT_lib)
+$(LIB_TESTS): %: $(TESTS_PREFIX)testutils.o $(LIBFDT_archive)
 
-$(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o $(LIBFDT_lib)
+$(LIBTREE_TESTS): %: $(TESTS_PREFIX)testutils.o $(TESTS_PREFIX)trees.o $(LIBFDT_archive)
 
 $(TESTS_PREFIX)dumptrees: $(TESTS_PREFIX)trees.o
 
-- 
1.6.0.6
