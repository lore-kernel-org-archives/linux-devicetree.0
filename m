From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] exynos_g2d: Add Bindings for exynos G2D driver
Date: Thu, 03 Jan 2013 08:03:34 -0500
Message-ID: <1357218214-3706-1-git-send-email-ajaykumar.rs@samsung.com>
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
To: jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation for the DT bindings in exynos G2D driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/drm/exynos/g2d.txt         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/g2d.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/g2d.txt b/Documentation/devicetree/bindings/drm/exynos/g2d.txt
new file mode 100644
index 0000000..1eb124d
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/g2d.txt
@@ -0,0 +1,22 @@
+Samsung 2D Graphic Accelerator using DRM frame work
+
+Samsung FIMG2D is a graphics 2D accelerator which supports Bit Block Transfer.
+We set the drawing-context registers for configuring rendering parameters and
+then start rendering.
+This driver is for SOCs which contain G2D IPs with version 4.1.
+
+Required properties:
+	-compatible:
+		should be "samsung,exynos-g2d-41".
+	-reg:
+		physical base address of the controller and length
+		of memory mapped region.
+	-interrupts:
+		interrupt combiner values.
+
+Example:
+	g2d {
+		compatible = "samsung,exynos-g2d-41";
+		reg = <0x10850000 0x1000>;
+		interrupts = <0 91 0>;
+	};
-- 
1.8.0
