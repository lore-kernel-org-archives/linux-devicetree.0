From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 5/7] ARM: EXYNOS5: add device tree based discovery support for
 FIMD
Date: Mon, 16 Jul 2012 17:41:24 +0530
Message-ID: <1342440686-21860-6-git-send-email-l.krishna@samsung.com>
References: <1342440686-21860-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1342440686-21860-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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

From: Leela Krishna <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch adds support for device tree based discovery for Samsung's
display controller. Adds DRM-Fimd plat data for smdk5250
evt1 to the corresponding dts file

Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   16 ++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |    7 +++++++
 arch/arm/mach-exynos/include/mach/map.h   |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    2 ++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 49945cc..781f836 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -71,4 +71,20 @@
 	i2c@12CD0000 {
 		status = "disabled";
 	};
+
+	lcd_fimd0: lcd_panel0 {
+			lcd-htiming = <4 4 4 1280>;
+			lcd-vtiming = <4 4 4 800>;
+			supports-mipi-panel;
+	};
+
+	fimd {
+		samsung,fimd-display = <&lcd_fimd0>;
+		samsung,fimd-vidout-rgb;
+		samsung,fimd-inv-vclk;
+		samsung,fimd-frame-rate = <60>;
+		samsung,default-window = <0>;
+		samsung,fimd-win-bpp = <32>;
+	};
+
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4272b29..f9954fe 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -424,4 +424,11 @@
 			#gpio-cells = <4>;
 		};
 	};
+
+	fimd {
+		compatible = "samsung,exynos5-drm";
+		interrupt-parent = <&combiner>;
+		reg = <0x14400000 0x40000>;
+		interrupts = <18 5>, <18 4>, <18 6>;
+	};
 };
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index ca4aa89..731b56e 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -167,6 +167,7 @@
 #define EXYNOS4_PA_MIPI_CSIS1		0x11890000
 
 #define EXYNOS4_PA_FIMD0		0x11C00000
+#define EXYNOS5_PA_FIMD1		0x14400000
 
 #define EXYNOS4_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 #define EXYNOS4_PA_DWMCI		0x12550000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index a91c928..9d5bccc 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -154,6 +154,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-drm", EXYNOS5_PA_FIMD1,
+				"exynos5-fb", NULL),
 	{},
 };
 
-- 
1.7.0.4
