From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH V2] add Mac OS X support
Date: Tue, 26 May 2009 20:07:26 +0200
Message-ID: <1243361246-1743-1-git-send-email-plagnioj@jcrosoft.com>
References: <ed82fe3e0905252037r574e56ecjd8689b800c74561f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <ed82fe3e0905252037r574e56ecjd8689b800c74561f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

use dylib shared lib extention
allow to specifiy os specific shared lib link option
Mac OS use -dynamiclib instead of -shared, -install_name instead of -soname
and does not support --version-script

add HOSTOS macro to detect the current os you are

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
---
V2
detect dynamicly the host OS
 Makefile |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index be0fc8b..d7549b2 100644
--- a/Makefile
+++ b/Makefile
@@ -28,6 +28,17 @@ BINDIR = $(PREFIX)/bin
 LIBDIR = $(PREFIX)/lib
 INCLUDEDIR = $(PREFIX)/include
 
+HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
+	    sed -e 's/\(cygwin\).*/cygwin/')
+
+ifeq ($(HOSTOS),darwin)
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
@@ -116,7 +127,7 @@ endif
 LIBFDT_objdir = libfdt
 LIBFDT_srcdir = libfdt
 LIBFDT_archive = $(LIBFDT_objdir)/libfdt.a
-LIBFDT_lib = $(LIBFDT_objdir)/libfdt.so
+LIBFDT_lib = $(LIBFDT_objdir)/libfdt.$(SHAREDLIB_EXT)
 LIBFDT_include = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_INCLUDES))
 LIBFDT_version = $(addprefix $(LIBFDT_srcdir)/,$(LIBFDT_VERSION))
 
@@ -220,8 +231,8 @@ clean: libfdt_clean tests_clean
 
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
