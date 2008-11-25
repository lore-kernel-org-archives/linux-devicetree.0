From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] libfdt: Introduce libfdt shared library
Date: Tue, 25 Nov 2008 09:23:23 -0500
Message-ID: <20081125142323.GC2340@yoda.jdub.homelinux.org>
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
Cc: hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Build a libfdt shared library in addition to the existing .a that is
created.  Symbol versioning is used from the libfdt/version.lds script.

Signed-off-by: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 Makefile               |   12 ++++++++++--
 libfdt/Makefile.libfdt |    1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b3b85a5..bc6058e 100644
--- a/Makefile
+++ b/Makefile
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
@@ -215,6 +219,10 @@ clean: libfdt_clean tests_clean
 	@$(VECHO) AR $@
 	$(AR) $(ARFLAGS) $@ $^
 
+$(LIBFDT_lib):
+	@$(VECHO) LD $@
+	$(CC) $(LDFLAGS) -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,$(notdir $@) -shared -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).so $^
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
-- 
1.5.6.5
