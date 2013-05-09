From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] exynos4-is: Fix example dts in .../bindings/samsung-fimc.txt
Date: Thu, 09 May 2013 14:45:17 +0200
Message-ID: <1368103517-16710-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: a.hajda@samsung.com, hj210.choi@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

The s5c73m3 sensor node should be off an I2C bus controller node.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/media/samsung-fimc.txt     |   26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index 51c776b..96312f6 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -127,22 +127,22 @@ Example:
 				};
 			};
 		};
-	};
 
-	/* MIPI CSI-2 bus IF sensor */
-	s5c73m3: sensor@0x1a {
-		compatible = "samsung,s5c73m3";
-		reg = <0x1a>;
-		vddio-supply = <...>;
+		/* MIPI CSI-2 bus IF sensor */
+		s5c73m3: sensor@0x1a {
+			compatible = "samsung,s5c73m3";
+			reg = <0x1a>;
+			vddio-supply = <...>;
 
-		clock-frequency = <24000000>;
-		clocks = <...>;
-		clock-names = "mclk";
+			clock-frequency = <24000000>;
+			clocks = <...>;
+			clock-names = "mclk";
 
-		port {
-			s5c73m3_1: endpoint {
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&csis0_ep>;
+			port {
+				s5c73m3_1: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csis0_ep>;
+				};
 			};
 		};
 	};
-- 
1.7.9.5
