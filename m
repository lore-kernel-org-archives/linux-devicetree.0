From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC v2 14/15] ARM: dts: Add camera pinctrl nodes for Exynos4x12
 SoCs
Date: Mon, 31 Dec 2012 17:03:12 +0100
Message-ID: <1356969793-27268-15-git-send-email-s.nawrocki@samsung.com>
References: <1356969793-27268-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1356969793-27268-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: g.liakhovetski@gmx.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Add separate nodes for the CAMCLK pin and turn off pull-up on camera
port A. Default driver strength for CAMCLK pin is increased to maximum.
The driver strength change can be moved to board specific part if it
is considered more appropriate.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   33 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 56f4669..e3225d0 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -401,15 +401,28 @@
 			samsung,pin-drv = <0>;
 		};
 
-		cam_port_a: cam-port-a {
+		cam_port_a_io: cam-port-a-io {
 			samsung,pins = "gpj0-0", "gpj0-1", "gpj0-2", "gpj0-3",
 					"gpj0-4", "gpj0-5", "gpj0-6", "gpj0-7",
-					"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-3",
-					"gpj1-4";
+					"gpj1-0", "gpj1-1", "gpj1-2", "gpj1-4";
 			samsung,pin-function = <2>;
-			samsung,pin-pud = <3>;
+			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
+
+		cam_port_a_clk_active: cam-port-a-clk-active {
+			samsung,pins = "gpj1-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
+
+		cam_port_a_clk_idle: cam-port-a-clk-idle {
+			samsung,pins = "gpj1-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <3>;
+		};
 	};
 
 	pinctrl@11000000 {
@@ -834,11 +847,17 @@
 			samsung,pin-drv = <0>;
 		};
 
-		cam_port_b: cam-port-b {
+		cam_port_b_io: cam-port-b-io {
 			samsung,pins = "gpm0-0", "gpm0-1", "gpm0-2", "gpm0-3",
 					"gpm0-4", "gpm0-5", "gpm0-6", "gpm0-7",
-					"gpm1-0", "gpm1-1", "gpm2-0", "gpm2-1",
-					"gpm2-2";
+					"gpm1-0", "gpm1-1", "gpm2-0", "gpm2-1";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <3>;
+			samsung,pin-drv = <0>;
+		};
+
+		cam_port_b_clk: cam-port-b-clk {
+			samsung,pins = "gpm2-2";
 			samsung,pin-function = <3>;
 			samsung,pin-pud = <3>;
 			samsung,pin-drv = <0>;
-- 
1.7.9.5
