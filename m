From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/1] Revert "of/exynos_g2d: Add Bindings for exynos G2D driver"
Date: Mon,  8 Apr 2013 12:12:19 +0530
Message-ID: <1365403339-28171-1-git-send-email-sachin.kamat@linaro.org>
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
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 09495dda6a62c74b13412a63528093910ef80edd.
The description is incomplete and the location of this file
is incorrect. Based on discussion with the Samsung media and DRM subsystem
maintainers, the documentaion of Samsung G2D bindings has been placed at:
Documentation/devicetree/bindings/gpu/samsung-g2d.txt

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/drm/exynos/g2d.txt         |   22 --------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/drm/exynos/g2d.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/g2d.txt b/Documentation/devicetree/bindings/drm/exynos/g2d.txt
deleted file mode 100644
index 1eb124d..0000000
--- a/Documentation/devicetree/bindings/drm/exynos/g2d.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Samsung 2D Graphic Accelerator using DRM frame work
-
-Samsung FIMG2D is a graphics 2D accelerator which supports Bit Block Transfer.
-We set the drawing-context registers for configuring rendering parameters and
-then start rendering.
-This driver is for SOCs which contain G2D IPs with version 4.1.
-
-Required properties:
-	-compatible:
-		should be "samsung,exynos-g2d-41".
-	-reg:
-		physical base address of the controller and length
-		of memory mapped region.
-	-interrupts:
-		interrupt combiner values.
-
-Example:
-	g2d {
-		compatible = "samsung,exynos-g2d-41";
-		reg = <0x10850000 0x1000>;
-		interrupts = <0 91 0>;
-	};
-- 
1.7.9.5
