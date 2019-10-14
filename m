From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: remove some tabs and spaces from dtsi files
Date: Mon, 14 Oct 2019 20:00:45 +0200
Message-ID: <20191014180045.11804-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Cleanup the Rockchip dtsi files a little bit
by removing some tabs and spaces.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3036.dtsi           |  4 ++--
 arch/arm/boot/dts/rk3288-rock2-som.dtsi |  2 +-
 arch/arm/boot/dts/rk3288-tinker.dtsi    | 14 +++++---------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index c776321b2..c70182c5a 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -696,8 +696,8 @@
 
 		hdmi {
 			hdmi_ctl: hdmi-ctl {
-				rockchip,pins = <1 RK_PB0  1 &pcfg_pull_none>,
-						<1 RK_PB1  1 &pcfg_pull_none>,
+				rockchip,pins = <1 RK_PB0 1 &pcfg_pull_none>,
+						<1 RK_PB1 1 &pcfg_pull_none>,
 						<1 RK_PB2 1 &pcfg_pull_none>,
 						<1 RK_PB3 1 &pcfg_pull_none>;
 			};
diff --git a/arch/arm/boot/dts/rk3288-rock2-som.dtsi b/arch/arm/boot/dts/rk3288-rock2-som.dtsi
index 9f9e2bfd1..14aebd447 100644
--- a/arch/arm/boot/dts/rk3288-rock2-som.dtsi
+++ b/arch/arm/boot/dts/rk3288-rock2-som.dtsi
@@ -237,7 +237,7 @@
 
 	gmac {
 		phy_rst: phy-rst {
-			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO  &pcfg_output_high>;
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_output_high>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index 81e4e953d..0aeef23ca 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -382,18 +382,15 @@
 
 	pmic {
 		pmic_int: pmic-int {
-			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO \
-					&pcfg_pull_up>;
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		dvs_1: dvs-1 {
-			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO \
-					&pcfg_pull_down>;
+			rockchip,pins = <0 RK_PB3 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 
 		dvs_2: dvs-2 {
-			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO \
-					&pcfg_pull_down>;
+			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 
@@ -406,8 +403,7 @@
 		};
 
 		sdmmc_clk: sdmmc-clk {
-			rockchip,pins = <6 RK_PC4 1 \
-					&pcfg_pull_none_drv_8ma>;
+			rockchip,pins = <6 RK_PC4 1 &pcfg_pull_none_drv_8ma>;
 		};
 
 		sdmmc_cmd: sdmmc-cmd {
@@ -432,7 +428,7 @@
 	sdio {
 		wifi_enable: wifi-enable {
 			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>,
-				<4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+					<4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 };
-- 
2.11.0
