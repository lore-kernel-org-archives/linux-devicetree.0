From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 09/13] ARM: dts: Add camera device nodes for Exynos4210 SoCs
Date: Mon, 01 Jul 2013 17:22:31 +0200
Message-ID: <1372692155-17653-10-git-send-email-s.nawrocki@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Add common camera node and detailed properties for
the Exynos4210 FIMC devices.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index b7f358a..ef8c2a5 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -125,4 +125,34 @@
 		clock-names = "sclk_fimg2d", "fimg2d";
 		status = "disabled";
 	};
+
+	camera {
+		clocks = <&clock 132>, <&clock 133>, <&clock 351>, <&clock 352>;
+		clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0", "pxl_async1";
+
+		fimc_0: fimc@11800000 {
+			samsung,pix-limits = <4224 8192 1920 4224>;
+			samsung,mainscaler-ext;
+			samsung,cam-if;
+		};
+
+		fimc_1: fimc@11810000 {
+			samsung,pix-limits = <4224 8192 1920 4224>;
+			samsung,mainscaler-ext;
+			samsung,cam-if;
+		};
+
+		fimc_2: fimc@11820000 {
+			samsung,pix-limits = <4224 8192 1920 4224>;
+			samsung,mainscaler-ext;
+			samsung,lcd-wb;
+		};
+
+		fimc_3: fimc@11830000 {
+			samsung,pix-limits = <1920 8192 1366 1920>;
+			samsung,rotators = <0>;
+			samsung,mainscaler-ext;
+			samsung,lcd-wb;
+		};
+	};
 };
-- 
1.7.9.5
