From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 1/1] arm64: dts: rockchip: add core dtsi file for RK3399Pro SoCs
Date: Wed, 29 May 2019 15:47:52 +0800
Message-ID: <20190529074752.19388-1-jay.xu@rock-chips.com>
References: <20190528044850.23703-1-jay.xu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528044850.23703-1-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jay.xu@rock-chips.com, heiko@sntech.de, mark.rutland@arm.com, robh+dt@kernel.org
Cc: zhangzj@rock-chips.com, manivannan.sadhasivam@linaro.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds core dtsi file for Rockchip RK3399Pro SoCs,
include rk3399.dtsi. Also enable these nodes:
- pcie/pcie_phy
- sdhci/sdio/emmc/sdmmc

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
changes since v1:
- remove dfi and dmc

 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi | 74 +++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
new file mode 100644
index 000000000000..b6d433ffa67d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2019 Fuzhou Rockchip Electronics Co., Ltd.
+
+#include "rk3399.dtsi"
+
+/ {
+	compatible = "rockchip,rk3399pro";
+
+	xin32k: xin32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+		#clock-cells = <0>;
+	};
+};
+
+&emmc_phy {
+	status = "okay";
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
+&pcie0 {
+	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+	num-lanes = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_clkreqn_cpm>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	supports-emmc;
+	non-removable;
+	keep-power-in-suspend;
+	mmc-hs400-enhanced-strobe;
+	status = "okay";
+};
+
+&sdio0 {
+	clock-frequency = <150000000>;
+	clock-freq-min-max = <200000 150000000>;
+	supports-sdio;
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	non-removable;
+	num-slots = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&sdmmc {
+	clock-frequency = <150000000>;
+	clock-freq-min-max = <400000 150000000>;
+	supports-sd;
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	num-slots = <1>;
+	vqmmc-supply = <&vccio_sd>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
+	status = "okay";
+};
-- 
2.17.1
