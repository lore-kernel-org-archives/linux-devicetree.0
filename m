From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: include version number in soname
Date: Tue, 26 Apr 2011 20:45:27 +1000
Message-ID: <20110426104527.GC6263@yookeroo>
References: <1303380829-16965-1-git-send-email-pbonzini@redhat.com>
	<20110425030733.GA6263@yookeroo> <4DB5B8D0.90802@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4DB5B8D0.90802-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2011 at 08:09:20PM +0200, Paolo Bonzini wrote:
> On 04/25/2011 05:07 AM, David Gibson wrote:
> > it sets the SONAME containing the whole of the dtc version, which
> > means even minor version updates will cause a change of soname and
> > will therefore be seen as incompatible changes.
> 
> Squashing this in should be enough:

Minimally, yes.  But I think we can do a bit better.  In particular
I'd prefer not to tie the soname directly to the dtc version at all.
Updates to dtc are only vaguely in sync with libfdt updates, and since
we are symbol versioning in libfdt, even pretty significant changes in
libfdt won't break backwards compatibility if we do things right.

So here's my patch version instead.  Jon, please apply.

libfdt: include version number in soname

From: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

The libfdt shared library is only installed by its unversioned name.
Including it properly in a distribution requires installation of both
the versioned name (used in the binary-only package) and the unversioned
name (used in the development package).  The latter is just a symbolic
link, so you need to change the soname in turn to include the version.

While at it, use Makefile variables to shorten some lines and avoid
cut-and-paste typos; and clean up remnants of when shared libraries were
not supported on Darwin.

Signed-off-by: Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
---

Index: dtc/Makefile
===================================================================
--- dtc.orig/Makefile	2011-04-11 13:47:41.196663143 +1000
+++ dtc/Makefile	2011-04-26 20:39:18.679649937 +1000
@@ -130,7 +130,7 @@ endif
 LIBFDT_objdir = libfdt
 LIBFDT_srcdir = libfdt
 LIBFDT_archive = $(LIBFDT_objdir)/libfdt.a
-LIBFDT_lib = $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
+LIBFDT_lib = $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
 LIBFDT_include = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_INCLUDES))
 LIBFDT_version = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_VERSION))
 
@@ -162,6 +162,8 @@ install: all $(SCRIPTS)
 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
+	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
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
@@ -234,8 +236,7 @@ clean: libfdt_clean tests_clean
 
 $(LIBFDT_lib):
 	@$(VECHO) LD $@
-	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(notdir $@) -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT) $^
-	ln -sf libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT) $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
+	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(LIBFDT_SONAME) -o $(LIBFDT_lib) $^
 
 %.lex.c: %.l
 	@$(VECHO) LEX $@
Index: dtc/libfdt/Makefile.libfdt
===================================================================
--- dtc.orig/libfdt/Makefile.libfdt	2011-04-25 13:08:15.102770001 +1000
+++ dtc/libfdt/Makefile.libfdt	2011-04-25 13:09:42.778770001 +1000
@@ -3,6 +3,7 @@
 # This is not a complete Makefile of itself.  Instead, it is designed to
 # be easily embeddable into other systems of Makefiles.
 #
+LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h
 LIBFDT_VERSION = version.lds
 LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
