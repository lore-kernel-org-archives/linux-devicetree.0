From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] ARM: dts: rv1108-evb: enable eMMC support
Date: Tue,  9 Oct 2018 18:36:56 -0300
Message-ID: <20181009213656.27719-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Enable eMMC support for rv1108 evaluation board.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/rv1108-evb.dts |  8 ++++++++
 arch/arm/boot/dts/rv1108.dtsi    | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 70f0106d1252..f3c6f52c49e6 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -226,6 +226,14 @@
 	status = "okay";
 };
 
+&emmc {
+	cap-mmc-highspeed;
+	supports-emmc;
+	non-removable;
+	num-slots = <1>;
+	status = "okay";
+};
+
 &u2phy {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 76ea24636feb..f14a733d85f6 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -772,6 +772,35 @@
 			};
 		};
 
+		emmc {
+			emmc_clk: emmc-clk {
+				rockchip,pins = <2 RK_PB6 RK_FUNC_1 &pcfg_pull_none_drv_8ma>;
+			};
+
+			emmc_cmd: emmc-cmd {
+				rockchip,pins = <2 RK_PB4 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			};
+
+			emmc_pwren: emmc-pwren {
+				rockchip,pins = <2 RK_PC2 RK_FUNC_2 &pcfg_pull_none>;
+			};
+
+			emmc_bus1: emmc-bus1 {
+				rockchip,pins = <2 RK_PA0 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			};
+
+			emmc_bus8: emmc-bus8 {
+				rockchip,pins = <2 RK_PA0 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+						<2 RK_PA1 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+						<2 RK_PA2 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+						<2 RK_PA3 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+						<2 RK_PA4 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+						<2 RK_PA5 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+						<2 RK_PA6 RK_FUNC_2 &pcfg_pull_up_drv_8ma>,
+						<2 RK_PA7 RK_FUNC_2 &pcfg_pull_up_drv_8ma>;
+			};
+		};
+
 		sdmmc {
 			sdmmc_clk: sdmmc-clk {
 				rockchip,pins = <3 RK_PC4 RK_FUNC_1 &pcfg_pull_none_drv_4ma>;
-- 
2.19.0
