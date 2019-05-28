From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/1] arm64: dts: rockchip: add core dtsi file for RK3399Pro
 SoCs
Date: Tue, 28 May 2019 12:48:50 +0800
Message-ID: <20190528044850.23703-1-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangzj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds core dtsi file for Rockchip RK3399Pro SoCs,
include rk3399.dtsi. Also enable these nodes:
- dfi/dmc for ddr devfreq
- pcie/pcie_phy
- sdhci/sdio/emmc/sdmmc

Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi | 111 ++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
new file mode 100644
index 000000000000..62f67f857c45
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro.dtsi
@@ -0,0 +1,111 @@
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
+&dfi {
+	status = "okay";
+};
+
+&dmc {
+	status = "okay";
+	center-supply = <&vdd_log>;
+	upthreshold = <40>;
+	downdifferential = <20>;
+	system-status-freq = <
+		/*system status         freq(KHz)*/
+		SYS_STATUS_NORMAL       800000
+		SYS_STATUS_REBOOT       528000
+		SYS_STATUS_SUSPEND      200000
+		SYS_STATUS_VIDEO_1080P  200000
+		SYS_STATUS_VIDEO_4K     600000
+		SYS_STATUS_VIDEO_4K_10B 800000
+		SYS_STATUS_PERFORMANCE  800000
+		SYS_STATUS_BOOST        400000
+		SYS_STATUS_DUALVIEW     600000
+		SYS_STATUS_ISP          600000
+	>;
+	vop-pn-msch-readlatency = <
+	/* plane_number  readlatency */
+		0	0
+		4	0x20
+	>;
+	vop-bw-dmc-freq = <
+	/* min_bw(MB/s) max_bw(MB/s) freq(KHz) */
+		0       762      200000
+		763     1893     400000
+		1894    3012     528000
+		3013    99999    800000
+	>;
+	auto-min-freq = <200000>;
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
