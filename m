From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add missing PCIe pwr amd rst configuration
Date: Thu, 30 May 2019 12:58:37 +0000
Message-ID: <20190530125837.730-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia <ezequiel@collabora.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add missing PCIe gpio and pinctrl for power (#PCIE_PWR)
also add PCIe gpio and pinctrl for reset (#PCIE_PERST_L).

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Tested on Rock960 Model A
---
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index c7d48d41e184..f5bef6b0fe89 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -55,9 +55,10 @@
 
 	vcc3v3_pcie: vcc3v3-pcie-regulator {
 		compatible = "regulator-fixed";
+		gpio = <&gpio2 RK_PA2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pcie_drv>;
+		pinctrl-0 = <&pcie_drv &pcie_pwr>;
 		regulator-boot-on;
 		regulator-name = "vcc3v3_pcie";
 		regulator-min-microvolt = <3300000>;
@@ -381,9 +382,10 @@
 };
 
 &pcie0 {
+	ep-gpio = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
 	num-lanes = <4>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie_clkreqn_cpm>;
+	pinctrl-0 = <&pcie_clkreqn_cpm &pcie_perst_l>;
 	vpcie3v3-supply = <&vcc3v3_pcie>;
 	status = "okay";
 };
@@ -408,6 +410,16 @@
 		};
 	};
 
+	pcie {
+		pcie_pwr: pcie-pwr {
+			rockchip,pins = <2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie_perst_l:pcie-perst-l {
+			rockchip,pins = <2 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc_bus1: sdmmc-bus1 {
 			rockchip,pins =
-- 
2.21.0
