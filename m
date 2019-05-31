From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: Add missing configuration pwr amd
 rst for PCIe
Date: Fri, 31 May 2019 20:19:13 +0000
Message-ID: <20190531201913.1122-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia <ezequiel@collabora.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Vicente Bergas <vicencb@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch add missing PCIe gpio pin (#PCIE_PWR) for vcc3v3_pcie power
regulator node also add missing reset pinctrl (#PCIE_PERST_L) for PCIe node.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
using schematics: thanks for suggested by Manivannan
[1] https://dl.vamrs.com/products/rock960/docs/hw/rock960_sch_v12_20180314.pdf

Changes from prevoius patch:
[2] https://patchwork.kernel.org/patch/10968695/

Fix the suject and commit message and corrected the PWR and PERST configuration
as per shematics and dts nodes.
---
 arch/arm64/boot/dts/rockchip/rk3399-ficus.dts    | 7 +++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dts  | 7 +++++++
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 3 +--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts b/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
index 6b059bd7a04f..94e2a59bc1c7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-ficus.dts
@@ -89,6 +89,8 @@
 
 &pcie0 {
 	ep-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_clkreqn_cpm &pcie_perst_l>;
 };
 
 &pinctrl {
@@ -104,6 +106,11 @@
 			rockchip,pins =
 				<1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
+
+		pcie_perst_l: pcie-perst-l {
+			rockchip,pins =
+				<4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	usb2 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
index 12285c51cceb..665fe09c7c74 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dts
@@ -64,6 +64,8 @@
 
 &pcie0 {
 	ep-gpios = <&gpio2 RK_PA2 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_clkreqn_cpm &pcie_perst_l>;
 };
 
 &pinctrl {
@@ -104,6 +106,11 @@
 			rockchip,pins =
 				<2 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
+
+		pcie_perst_l: pcie-perst-l {
+			rockchip,pins =
+				<2 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	usb2 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index c7d48d41e184..3df0cd67b4b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -55,6 +55,7 @@
 
 	vcc3v3_pcie: vcc3v3-pcie-regulator {
 		compatible = "regulator-fixed";
+		gpio = <&gpio2 RK_PA5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_drv>;
@@ -382,8 +383,6 @@
 
 &pcie0 {
 	num-lanes = <4>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie_clkreqn_cpm>;
 	vpcie3v3-supply = <&vcc3v3_pcie>;
 	status = "okay";
 };
-- 
2.21.0
