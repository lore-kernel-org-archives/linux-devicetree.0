From: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] libfdt: include version number in soname
Date: Thu, 21 Apr 2011 12:13:49 +0200
Message-ID: <1303380829-16965-1-git-send-email-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The libfdt shared library is only installed by its unversioned name.
Including it properly in a distribution requires installation of both
the versioned name (used in the binary-only package) and the unversioned
name (used in the development package).  The latter is just a symbolic
link, so you need to change the soname in turn to include the version.

While at it, use Makefile variables to shorten some lines and avoid
cut-and-paste typos; and clean up remnants of when shared libraries were
not supported on Darwin.

Signed-off-by: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Makefile |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index a07648c..1db9f30 100644
--- a/Makefile
+++ b/Makefile
@@ -131,9 +131,10 @@ LIBFDT_objdir = libfdt
 LIBFDT_srcdir = libfdt
 LIBFDT_archive = $(LIBFDT_objdir)/libfdt.a
 LIBFDT_lib = $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
+LIBFDT_lib_VERSIONED = $(subst .$(SHAREDLIB_EXT),-$(DTC_VERSION).$(SHAREDLIB_EXT),$(LIBFDT_lib))
+LIBFDT_lib_SONAME = $(notdir $(LIBFDT_lib_VERSIONED))
 LIBFDT_include = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_INCLUDES))
 LIBFDT_version = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_VERSION))
-
 include $(LIBFDT_srcdir)/Makefile.libfdt
 
 .PHONY: libfdt
@@ -145,7 +146,7 @@ $(LIBFDT_lib): $(addprefix $(LIBFDT_objdir)/,$(LIBFDT_OBJS))
 libfdt_clean:
 	@$(VECHO) CLEAN "(libfdt)"
 	rm -f $(addprefix $(LIBFDT_objdir)/,$(STD_CLEANFILES))
-	rm -f $(LIBFDT_objdir)/*.so
+	rm -f $(LIBFDT_objdir)/*.$(SHAREDLIB_EXT)
 
 ifneq ($(DEPTARGETS),)
 -include $(LIBFDT_OBJS:%.o=$(LIBFDT_objdir)/%.d)
@@ -161,7 +162,8 @@ install: all $(SCRIPTS)
 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
-	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+	$(INSTALL) $(LIBFDT_lib_VERSIONED) $(DESTDIR)$(LIBDIR)
+	ln -sf $(notdir $(LIBFDT_lib_VERSIONED)) $(DESTDIR)$(LIBDIR)/$(notdir $(LIBFDT_lib))
 	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
 	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
 	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
@@ -188,7 +190,7 @@ include tests/Makefile.tests
 #
 # Clean rules
 #
-STD_CLEANFILES = *~ *.o *.so *.d *.a *.i *.s core a.out vgcore.* \
+STD_CLEANFILES = *~ *.o *.$(SHAREDLIB_EXT) *.d *.a *.i *.s core a.out vgcore.* \
 	*.tab.[ch] *.lex.c *.output
 
 clean: libfdt_clean tests_clean
@@ -234,8 +236,8 @@ clean: libfdt_clean tests_clean
 
 $(LIBFDT_lib):
 	@$(VECHO) LD $@
-	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(notdir $@) -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT) $^
-	ln -sf libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT) $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
+	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_lib_SONAME) -o $(LIBFDT_lib_VERSIONED) $^
+	ln -sf $(notdir $(LIBFDT_lib_VERSIONED)) $(LIBFDT_lib)
 
 %.lex.c: %.l
 	@$(VECHO) LEX $@
-- 
1.7.4.4
