From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: dtc build failures on OS X
Date: Wed, 20 May 2009 09:46:11 +0200
Message-ID: <20090520074611.GW17539@game.jcrosoft.org>
References: <ed82fe3e0905191908v8c5fcdft953c4e1ba7969f2a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ed82fe3e0905191908v8c5fcdft953c4e1ba7969f2a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 21:08 Tue 19 May     , Timur Tabi wrote:
> I'm trying to build dtc on Mac OS X.  The compilation seems to go
> okay, but the linker dies.  First, it says this:
> 
> 	 LD libfdt/libfdt.so
> ld: unknown option: --version-script=libfdt/version.lds
> collect2: ld returned 1 exit status
> 
> A Google search suggested that I can just delete the --version-script
> option.  I did that, and now I get this error:
> 
> 	 LD libfdt/libfdt.so
> ld: unknown option: -soname
> collect2: ld returned 1 exit status
> 
> This web page: http://lists.apple.com/archives/unix-porting/2003/Oct/msg00032.html
> had some suggestions on how to fix that, so my Makefile now looks like
> this:
> 
> $(LIBFDT_lib):
>         @$(VECHO) LD $@
>         $(CC) $(LDFLAGS) -fPIC -Wl,-dylib_install_name -Wl,$(notdir
> $@) -shared -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).so $^
>         ln -s libfdt-$(DTC_VERSION).so $(LIBFDT_objdir)/libfdt.so
> 
> But now I get this error:
> 
> 	 LD libfdt/libfdt.so
> Undefined symbols:
>   "_main", referenced from:
>       start in crt1.10.5.o
> ld: symbol(s) not found
> collect2: ld returned 1 exit status
> 
> So now I'm stuck.  Has anyone tried this before?  Can anyone tell me
> how to fix this?
-shared is incorrect on mac os it's -dynamiclib
see attached patch

Best Regards,
J.

--lrZ03NoBR/3+SXJZ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-add-Mac-OS-X-support.patch"

>From 37a2ddc183fa381cc025adf8e9d9d143029fe159 Mon Sep 17 00:00:00 2001
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Date: Wed, 20 May 2009 09:50:31 +0200
Subject: [PATCH] add Mac OS X support

use dylib shared lib extention
allow to specifiy os specific shared lib link option
Mac OS use -dynamiclib instead of -shared, -install_name instead of -soname
and does not support --version-script

to buid on it do

make OSX=y

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
---
 Makefile |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index be0fc8b..d8b3353 100644
--- a/Makefile
+++ b/Makefile
@@ -28,6 +28,14 @@ BINDIR = $(PREFIX)/bin
 LIBDIR = $(PREFIX)/lib
 INCLUDEDIR = $(PREFIX)/include
 
+ifdef OSX
+SHAREDLIB_EXT=dylib
+SHAREDLIB_LINK_OPTIONS=-dynamiclib -Wl,-install_name -Wl,
+else
+SHAREDLIB_EXT=so
+SHAREDLIB_LINK_OPTIONS=-shared -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,
+endif
+
 #
 # Overall rules
 #
@@ -116,7 +124,7 @@ endif
 LIBFDT_objdir = libfdt
 LIBFDT_srcdir = libfdt
 LIBFDT_archive = $(LIBFDT_objdir)/libfdt.a
-LIBFDT_lib = $(LIBFDT_objdir)/libfdt.so
+LIBFDT_lib = $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
 LIBFDT_include = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_INCLUDES))
 LIBFDT_version = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_VERSION))
 
@@ -220,8 +228,8 @@ clean: libfdt_clean tests_clean
 
 $(LIBFDT_lib):
 	@$(VECHO) LD $@
-	$(CC) $(LDFLAGS) -fPIC -Wl,--version-script=$(LIBFDT_version) -Wl,-soname,$(notdir $@) -shared -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).so $^
-	ln -s libfdt-$(DTC_VERSION).so $(LIBFDT_objdir)/libfdt.so
+	$(CC) $(LDFLAGS) -fPIC $(SHAREDLIB_LINK_OPTIONS)$(notdir $@) -o $(LIBFDT_objdir)/libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT) $^
+	ln -sf libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT) $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
 
 %.lex.c: %.l
 	@$(VECHO) LEX $@
-- 
1.6.0.4


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--lrZ03NoBR/3+SXJZ--
