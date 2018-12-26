From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 07/97] ARM: dts: imx7d-pico: Describe the Wifi clock
Date: Wed, 26 Dec 2018 17:34:27 -0500
Message-ID: <20181226223557.149329-7-sashal@kernel.org>
References: <20181226223557.149329-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181226223557.149329-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

[ Upstream commit c3b9ab5db11d8098ca7674175f12ab21cdce1bbb ]

The Wifi chip should be clocked by a 32kHz clock coming from i.MX7D
CLKO2 output pin, so describe the pinmux and clock hierarchy in the
device tree to allow the Wifi chip to be properly clocked.

Managed to successfully test Wifi with such change. Used the standard
nvram.txt file provided by TechNexion, which selects an external 32kHz
clock for the Wifi chip by default.

Fixes: 99a52450c707 ("ARM: dts: imx7d-pico: Add Wifi support")
Suggested-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Tested-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/imx7d-pico.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7d-pico.dtsi b/arch/arm/boot/dts/imx7d-pico.dtsi
index 21973eb55671..f27b3849d3ff 100644
--- a/arch/arm/boot/dts/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/imx7d-pico.dtsi
@@ -100,6 +100,19 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	usdhc2_pwrseq: usdhc2_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&clks IMX7D_CLKO2_ROOT_DIV>;
+		clock-names = "ext_clock";
+	};
+};
+
+&clks {
+	assigned-clocks = <&clks IMX7D_CLKO2_ROOT_SRC>,
+			  <&clks IMX7D_CLKO2_ROOT_DIV>;
+	assigned-clock-parents = <&clks IMX7D_CKIL>;
+	assigned-clock-rates = <0>, <32768>;
 };
 
 &i2c4 {
@@ -199,12 +212,13 @@
 
 &usdhc2 { /* Wifi SDIO */
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-0 = <&pinctrl_usdhc2 &pinctrl_wifi_clk>;
 	no-1-8-v;
 	non-removable;
 	keep-power-in-suspend;
 	wakeup-source;
 	vmmc-supply = <&reg_ap6212>;
+	mmc-pwrseq = <&usdhc2_pwrseq>;
 	status = "okay";
 };
 
@@ -301,6 +315,12 @@
 };
 
 &iomuxc_lpsr {
+	pinctrl_wifi_clk: wificlkgrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO03__CCM_CLKO2	0x7d
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x74
-- 
2.19.1
