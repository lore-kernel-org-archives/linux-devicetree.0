From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v1 12/12] dts: hi3660: Add support for usb on Hikey960
Date: Mon, 3 Dec 2018 11:45:15 +0800
Message-ID: <20181203034515.91412-13-chenyu56@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181203034515.91412-1-chenyu56@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, suzhuangluan@hisilicon.com, Binghui Wang <wangbinghui@hisilicon.com>, Yu Chen <chenyu56@huawei.com>, kongfei@hisilicon.com, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds support for usb on Hikey960.

Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: John Stultz <john.stultz@linaro.org>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 56 ++++++++++++++++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 72 +++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index c98bcbc8dfba..066c558154ea 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/usb/pd.h>
 
 / {
 	model = "HiKey960";
@@ -196,6 +197,28 @@
 			method = "smc";
 		};
 	};
+
+	hisi_hikey_usb: hisi_hikey_usb {
+		compatible = "hisilicon,hikey960_usb";
+		typec-vbus-gpios = <&gpio25 2 0>;
+		typc-vbus-enable-val = <1>;
+		otg-switch-gpios = <&gpio25 6 0>;
+		hub-vdd33-en-gpios = <&gpio5 6 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbhub5734_pmx_func>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hikey_usb_ep: endpoint@0 {
+				reg = <0>;
+				device_type = "usb-role-switch";
+				remote-endpoint = <&dwc3_role_switch_notify>;
+			};
+		};
+	};
+
 };
 
 /*
@@ -526,6 +549,39 @@
 &i2c1 {
 	status = "okay";
 
+	rt1711h: rt1711h@4e {
+		compatible = "richtek,rt1711h";
+		reg = <0x4e>;
+		status = "ok";
+		interrupt-parent = <&gpio27>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_cfg_func>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)
+				PDO_VAR(5000, 5000, 1000)>;
+			op-sink-microwatt = <10000000>;
+		};
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			rt1711h_ep: endpoint@0 {
+				reg = <0>;
+				device_type = "usb-role-switch";
+				remote-endpoint = <&dwc3_role_switch>;
+			};
+		};
+	};
+
 	adv7533: adv7533@39 {
 		status = "ok";
 		compatible = "adi,adv7533";
diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index f432b0a88c65..e6583bd7efdb 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -349,6 +349,12 @@
 			#clock-cells = <1>;
 		};
 
+		pmctrl: pmctrl@fff31000 {
+			compatible = "hisilicon,hi3660-pmctrl", "syscon";
+			reg = <0x0 0xfff31000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		pmuctrl: crg_ctrl@fff34000 {
 			compatible = "hisilicon,hi3660-pmuctrl", "syscon";
 			reg = <0x0 0xfff34000 0x0 0x1000>;
@@ -1122,5 +1128,71 @@
 				};
 			};
 		};
+
+		usb3_otg_bc: usb3_otg_bc@ff200000 {
+			compatible = "syscon";
+			reg = <0x0 0xff200000 0x0 0x1000>;
+		};
+
+		usb_phy: usb-phy {
+			compatible = "hisilicon,hi3660-usb-phy";
+			#phy-cells = <0>;
+			hisilicon,pericrg-syscon = <&crg_ctrl>;
+			hisilicon,pctrl-syscon = <&pctrl>;
+			hisilicon,usb3-otg-bc-syscon = <&usb3_otg_bc>;
+			hisilicon,eye-diagram-param = <0x22466e4>;
+		};
+
+		usb3: hisi_dwc3 {
+			compatible = "hisilicon,hi3660-dwc3";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&crg_ctrl HI3660_CLK_ABB_USB>,
+				 <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
+			clock-names = "clk_usb3phy_ref", "aclk_usb3otg";
+
+			assigned-clocks = <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
+			assigned-clock-rates = <229000000>;
+			resets = <&crg_rst 0x90 8>,
+				 <&crg_rst 0x90 7>,
+				 <&crg_rst 0x90 6>,
+				 <&crg_rst 0x90 5>;
+
+			dwc3: dwc3@ff100000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff100000 0x0 0x100000>;
+				interrupts = <0 159 4>, <0 161 4>;
+				phys = <&usb_phy>;
+				phy-names = "usb3-phy";
+				dr_mode = "otg";
+				maximum-speed = "super-speed";
+				phy_type = "utmi";
+				snps,dis-del-phy-power-chg-quirk;
+				snps,lfps_filter_quirk;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,tx_de_emphasis_quirk;
+				snps,tx_de_emphasis = <1>;
+				snps,dis_enblslpm_quirk;
+				snps,gctl-reset-quirk;
+
+				port {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dwc3_role_switch: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&rt1711h_ep>;
+					};
+
+					dwc3_role_switch_notify: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&hikey_usb_ep>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.15.0-rc2
