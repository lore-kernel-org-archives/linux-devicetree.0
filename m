From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCH v2 RESEND] ARM: Build dtb files in all target
Date: Mon,  3 Sep 2012 18:58:07 +0200
Message-ID: <1346691487-17534-1-git-send-email-andrew@lunn.ch>
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
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Tools like kisskb are good at finding build regressions in the kernel
sources. However, regressions in the DT desscriptions are not found,
because generally these build systems don't build the DT binary blobs.

Extend the ARM all target to build all enabled DTB files.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Reviewed-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/Makefile |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 30eae87..0457ef4 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -268,7 +268,12 @@ else
 KBUILD_IMAGE := zImage
 endif
 
-all:	$(KBUILD_IMAGE)
+# Build the DT binary blobs if we have OF configured
+ifeq ($(CONFIG_USE_OF),y)
+KBUILD_DTBS := dtbs
+endif
+
+all:	$(KBUILD_IMAGE) $(KBUILD_DTBS)
 
 boot := arch/arm/boot
 
@@ -306,7 +311,7 @@ define archhelp
   echo  '  uImage        - U-Boot wrapped zImage'
   echo  '  bootpImage    - Combined zImage and initial RAM disk' 
   echo  '                  (supply initrd image via make variable INITRD=<path>)'
-  echo  '  dtbs          - Build device tree blobs for enabled boards'
+  echo  '* dtbs          - Build device tree blobs for enabled boards'
   echo  '  install       - Install uncompressed kernel'
   echo  '  zinstall      - Install compressed kernel'
   echo  '  uinstall      - Install U-Boot wrapped compressed kernel'
-- 
1.7.10.4
