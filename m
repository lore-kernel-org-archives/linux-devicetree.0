From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Exynos5420: Add dt support for gscaler
Date: Tue, 15 Oct 2013 16:50:54 +0530
Message-ID: <1381836054-6590-3-git-send-email-l.krishna@samsung.com>
References: <1381836054-6590-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1381836054-6590-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, prathyush.k@samsung.com, cpgs@samsung.com
List-Id: devicetree@vger.kernel.org

Adds G-Scaler devices to the DT device list

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 7f0296c..f86aeea 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -31,6 +31,8 @@
 		i2c1 = &i2c_1;
 		i2c2 = &i2c_2;
 		i2c3 = &i2c_3;
+		gsc0 = &gsc_0;
+		gsc1 = &gsc_1;
 	};
 
 	cpus {
@@ -313,4 +315,22 @@
 		clocks = <&clock 431>, <&clock 143>;
 		clock-names = "mixer", "sclk_hdmi";
 	};
+
+	gsc_0:  gsc@0x13e00000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e00000 0x1000>;
+		interrupts = <0 85 0>;
+		clocks = <&clock 465>;
+		clock-names = "gscl";
+		samsung,power-domain = <&gsc_pd>;
+	};
+
+	gsc_1:  gsc@0x13e10000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e10000 0x1000>;
+		interrupts = <0 86 0>;
+		clocks = <&clock 466>;
+		clock-names = "gscl";
+		samsung,power-domain = <&gsc_pd>;
+	};
 };
-- 
1.7.9.5
