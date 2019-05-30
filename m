From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v3 1/1] arm64: dts: rockchip: add core dtsi file for RK3399Pro SoCs
Date: Thu, 30 May 2019 08:08:48 +0800
Message-ID: <20190530000848.28106-1-jay.xu@rock-chips.com>
References: <20190529074752.19388-1-jay.xu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529074752.19388-1-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jay.xu@rock-chips.com, heiko@sntech.de, mark.rutland@arm.com, robh+dt@kernel.org
Cc: zhangzj@rock-chips.com, manivannan.sadhasivam@linaro.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds core dtsi file for Rockchip RK3399Pro SoCs,
include rk3399.dtsi. Also enable pciei0/pcie_phy for AP to
talk to NPU part inside SoC.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
changes since v2:
- only enable pcie0 and pcie_phy nodes, thanks for Heiko and manivannan

changes since v1:
- remove dfi and dmc

 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
new file mode 100644
index 000000000000..bb5ebf6608b9
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2019 Fuzhou Rockchip Electronics Co., Ltd.
+
+#include "rk3399.dtsi"
+
+/ {
+	compatible = "rockchip,rk3399pro";
+};
+
+/* Default to enabled since AP talk to NPU part over pcie */
+&pcie_phy {
+	status = "okay";
+};
+
+/* Default to enabled since AP talk to NPU part over pcie */
+&pcie0 {
+	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+	num-lanes = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_clkreqn_cpm>;
+	status = "okay";
+};
-- 
2.17.1
