From: Hans Ole Hatzel <hohatzel@jusst.de>
Subject: [PATCH 2/4] ARM: dts: imx7d: cl-som-imx7: WiLink8 WLAN support
Date: Tue,  4 Dec 2018 12:07:39 +0100
Message-ID: <20181204110741.6943-3-hohatzel@jusst.de>
References: <20181204110741.6943-1-hohatzel@jusst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204110741.6943-1-hohatzel@jusst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, ilya@compulab.co.il, devicetree@vger.kernel.org, linux-imx@nxp.com, fabio.estevam@nxp.com, shawnguo@kernel.org
Cc: Julian Scheel <jscheel@jusst.de>, Hans Ole Hatzel <hohatzel@jusst.de>
List-Id: devicetree@vger.kernel.org

Add support for WiLink8 module which is connected via USDHC 2.

Signed-off-by: Hans Ole Hatzel <hohatzel@jusst.de>
Signed-off-by: Julian Scheel <jscheel@jusst.de>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 64 +++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 11bd713b540f..e77e0cc7de39 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -30,6 +30,28 @@
 		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	rf_pwr_en_reg: regulator-rf-pwr-en {
+		compatible = "regulator-fixed";
+		regulator-name = "rf-pwr-en-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca9555 9 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <70000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	wlan_en_reg: regulator-wlan-en {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca9555 0 GPIO_ACTIVE_HIGH>;
+		/* WLAN card specific delay */
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
 };
 
 &cpu0 {
@@ -199,6 +221,28 @@
 	status = "okay";
 };
 
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	cd-gpios = <>;
+	wp-gpios = <>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	enable-sdio-wakeup;
+	vmmc-supply = <&wlan_en_reg>;
+	non-removable;
+	cap-power-off-card;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@0 {
+		compatible = "ti,wl1835";
+		reg = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
@@ -211,6 +255,15 @@
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO15__GPIO1_IO15			0x34 /* WLAN IRQ */
+		>;
+	};
+
 	pinctrl_enet1: enet1grp {
 		fsl,pins = <
 			MX7D_PAD_SD2_CD_B__ENET1_MDIO			0x30
@@ -261,6 +314,17 @@
 		>;
 	};
 
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX7D_PAD_SD2_CMD__SD2_CMD			0x59
+			MX7D_PAD_SD2_CLK__SD2_CLK			0x19
+			MX7D_PAD_SD2_DATA0__SD2_DATA0			0x59
+			MX7D_PAD_SD2_DATA1__SD2_DATA1			0x59
+			MX7D_PAD_SD2_DATA2__SD2_DATA2			0x59
+			MX7D_PAD_SD2_DATA3__SD2_DATA3			0x59
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
-- 
2.19.2
