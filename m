From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 2/5] arm64: dts: exynos: Move the clock-frequency property
Date: Mon, 06 Feb 2017 11:19:41 +0900
Message-ID: <1486347584-6762-3-git-send-email-hoegeun.kwon@samsung.com>
References: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170206021951epcas1p365db9f08f22cc223ca45538b0dbc86d6@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: inki.dae@samsung.com, robh+dt@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: devicetree@vger.kernel.org

The OF graph is not needed because the panel is a child of dsi. So
removed the ports and moved burst, esc clock-frequency property to the
top.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 6ce93a3..77ba238 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -298,23 +298,11 @@
 	status = "okay";
 	vddcore-supply = <&ldo6_reg>;
 	vddio-supply = <&ldo7_reg>;
+	samsung,burst-clock-frequency = <512000000>;
+	samsung,esc-clock-frequency = <16000000>;
 	samsung,pll-clock-frequency = <24000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&te_irq>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@1 {
-			reg = <1>;
-
-			dsi_out: endpoint {
-				samsung,burst-clock-frequency = <512000000>;
-				samsung,esc-clock-frequency = <16000000>;
-			};
-		};
-	};
 };
 
 &hdmi {
-- 
1.9.1
