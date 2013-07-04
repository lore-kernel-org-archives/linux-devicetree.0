From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH dtc] Makefile: provide separate install targets
Date: Thu, 04 Jul 2013 09:58:23 +0800
Message-ID: <1372903103.469879.182716284455.1.gpush@pablo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently `make install` will install the binaries, libraries and
includes.

This change separates the install target into install-bin, install-lib
and install-includes, so we have more flexibility, particularly when
we're just using libfdt.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

---
 Makefile |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1169e6c..e64bf6b 100644
--- a/Makefile
+++ b/Makefile
@@ -160,18 +160,26 @@ endif
 # intermediate target and building them again "for real"
 .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
 
-install: all $(SCRIPTS)
-	@$(VECHO) INSTALL
+install-bin: all $(SCRIPTS)
+	@$(VECHO) INSTALL-BIN
 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
 	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
+
+install-lib: all
+	@$(VECHO) INSTALL-LIB
 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
 	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
 	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
 	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
+
+install-includes:
+	@$(VECHO) INSTALL-INC
 	$(INSTALL) -d $(DESTDIR)$(INCLUDEDIR)
 	$(INSTALL) -m 644 $(LIBFDT_include) $(DESTDIR)$(INCLUDEDIR)
 
+install: install-bin install-lib install-includes
+
 $(VERSION_FILE): Makefile FORCE
 	$(call filechk,version)
