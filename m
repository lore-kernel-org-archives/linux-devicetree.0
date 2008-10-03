From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: [PATCH] Rearrange ftdump and convert-dtsv0 into sub-Makefiles.
Date: Fri,  3 Oct 2008 12:13:36 -0500
Message-ID: <1223054016-22290-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
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

Follows the model of the existing sub-Makefiles for dtc.

Adjust $(BIN) definition to represent installable bin programs
and use it as the list of installed programs rather than using
an enumerated list in the install target.

Adjust the tests/Makefile to clean up properly still.

Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Makefile               |   70 +++++++++++++++++++++++++----------------------
 Makefile.convert-dtsv0 |   12 ++++++++
 Makefile.ftdump        |   12 ++++++++
 tests/Makefile.tests   |    5 +--
 4 files changed, 63 insertions(+), 36 deletions(-)
 create mode 100644 Makefile.convert-dtsv0
 create mode 100644 Makefile.ftdump

diff --git a/Makefile b/Makefile
index 558e10c..b3b85a5 100644
--- a/Makefile
+++ b/Makefile
@@ -46,18 +46,6 @@ else
 DEPTARGETS = $(filter-out $(NODEPTARGETS),$(MAKECMDGOALS))
 endif
 
-all: dtc ftdump convert-dtsv0 libfdt
-
-install: all
-	@$(VECHO) INSTALL
-	$(INSTALL) -d $(DESTDIR)$(BINDIR)
-	$(INSTALL) -m 755 dtc $(DESTDIR)$(BINDIR)
-	$(INSTALL) -m 755 convert-dtsv0 $(DESTDIR)$(BINDIR)
-	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
-	$(INSTALL) -m 644 $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
-	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
-	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
-
 #
 # Rules for versioning
 #
@@ -101,40 +89,27 @@ define filechk
 	fi;
 endef
 
-$(VERSION_FILE): Makefile FORCE
-	$(call filechk,version)
 
-#
-# Rules for dtc proper
-#
+include Makefile.convert-dtsv0
 include Makefile.dtc
+include Makefile.ftdump
 
+BIN += convert-dtsv0
 BIN += dtc
+BIN += ftdump
 
-# This stops make from generating the lex and bison output during
-# auto-dependency computation, but throwing them away as an
-# intermediate target and building them again "for real"
-.SECONDARY: $(DTC_GEN_SRCS)
 
-dtc: $(DTC_OBJS)
+all: $(BIN) libfdt
+
 
 ifneq ($(DEPTARGETS),)
 -include $(DTC_OBJS:%.o=%.d)
+-include $(CONVERT_OBJS:%.o=%.d)
+-include $(FTDUMP_OBJS:%.o=%.d)
 endif
-#
-# Rules for ftdump & convert-dtsv0
-#
-BIN += ftdump convert-dtsv0
 
-ftdump:	ftdump.o
 
-convert-dtsv0: convert-dtsv0-lexer.lex.o srcpos.o
-	@$(VECHO) LD $@
-	$(LINK.c) -o $@ $^
 
-ifneq ($(DEPTARGETS),)
--include ftdump.d
-endif
 #
 # Rules for libfdt
 #
@@ -158,6 +133,35 @@ ifneq ($(DEPTARGETS),)
 -include $(LIBFDT_OBJS:%.o=$(LIBFDT_objdir)/%.d)
 endif
 
+# This stops make from generating the lex and bison output during
+# auto-dependency computation, but throwing them away as an
+# intermediate target and building them again "for real"
+.SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
+
+
+
+install: all
+	@$(VECHO) INSTALL
+	$(INSTALL) -d $(DESTDIR)$(BINDIR)
+	$(INSTALL) -m 755 $(BIN) $(DESTDIR)$(BINDIR)
+	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
+	$(INSTALL) -m 644 $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
+	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
+
+$(VERSION_FILE): Makefile FORCE
+	$(call filechk,version)
+
+
+dtc: $(DTC_OBJS)
+
+convert-dtsv0: $(CONVERT_OBJS)
+	@$(VECHO) LD $@
+	$(LINK.c) -o $@ $^
+
+ftdump:	$(FTDUMP_OBJS)
+
+
 #
 # Testsuite rules
 #
diff --git a/Makefile.convert-dtsv0 b/Makefile.convert-dtsv0
new file mode 100644
index 0000000..a3f74c9
--- /dev/null
+++ b/Makefile.convert-dtsv0
@@ -0,0 +1,12 @@
+#
+# This is not a complete Makefile of itself.
+# Instead, it is designed to be easily embeddable
+# into other systems of Makefiles.
+#
+
+CONVERT_SRCS = \
+	srcpos.c
+
+CONVERT_GEN_SRCS = convert-dtsv0-lexer.lex.c
+
+CONVERT_OBJS = $(CONVERT_SRCS:%.c=%.o) $(CONVERT_GEN_SRCS:%.c=%.o)
diff --git a/Makefile.ftdump b/Makefile.ftdump
new file mode 100644
index 0000000..b70905a
--- /dev/null
+++ b/Makefile.ftdump
@@ -0,0 +1,12 @@
+#
+# This is not a complete Makefile of itself.
+# Instead, it is designed to be easily embeddable
+# into other systems of Makefiles.
+#
+
+FTDUMP_SRCS = \
+	ftdump.c
+
+FTDUMP_GEN_SRCS =
+
+FTDUMP_OBJS = $(FTDUMP_SRCS:%.c=%.o) $(FTDUMP_GEN_SRCS:%.c=%.o)
diff --git a/tests/Makefile.tests b/tests/Makefile.tests
index 5fd4d28..21a311e 100644
--- a/tests/Makefile.tests
+++ b/tests/Makefile.tests
@@ -29,9 +29,8 @@ TESTS_DEPFILES = $(TESTS:%=%.d) \
 	$(addprefix $(TESTS_PREFIX),testutils.d trees.d dumptrees.d)
 
 TESTS_CLEANFILES_L =  *.output vglog.* vgcore.* *.dtb *.test.dts *.dtsv1 tmp.*
-TESTS_CLEANFILES = $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
-
-BIN += $(TESTS) $(TESTS_PREFIX)dumptrees
+TESTS_CLEANFILES_L += dumptrees
+TESTS_CLEANFILES = $(TESTS) $(TESTS_CLEANFILES_L:%=$(TESTS_PREFIX)%)
 
 .PHONY: tests
 tests:	$(TESTS) $(TESTS_TREES)
-- 
1.6.0.90.g436ed
