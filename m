From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 13/13] ARM: dts: Add MIPI PHY node to exynos4.dtsi
Date: Mon, 01 Jul 2013 17:22:35 +0200
Message-ID: <1372692155-17653-14-git-send-email-s.nawrocki@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Add PHY provider node for the MIPI CSIS and MIPI DSIM PHYs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Acked-by: Felipe Balbi <balbi@ti.com>
---
 arch/arm/boot/dts/exynos4.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 752624f..e27eba8 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -49,6 +49,12 @@
 		reg = <0x10000000 0x100>;
 	};
 
+	mipi_phy: video-phy@10020710 {
+		compatible = "samsung,s5pv210-mipi-video-phy";
+		reg = <0x10020710 8>;
+		#phy-cells = <1>;
+	};
+
 	pd_mfc: mfc-power-domain@10023C40 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C40 0x20>;
@@ -157,6 +163,8 @@
 			clock-names = "csis", "sclk_csis";
 			bus-width = <4>;
 			samsung,power-domain = <&pd_cam>;
+			phys = <&mipi_phy 0>;
+			phy-names = "csis";
 			status = "disabled";
 		};
 
@@ -168,6 +176,8 @@
 			clock-names = "csis", "sclk_csis";
 			bus-width = <2>;
 			samsung,power-domain = <&pd_cam>;
+			phys = <&mipi_phy 2>;
+			phy-names = "csis";
 			status = "disabled";
 		};
 	};
-- 
1.7.9.5
