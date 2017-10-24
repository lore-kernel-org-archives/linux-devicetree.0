From: Yu Chen <chenyu56@huawei.com>
Subject: [RFC 3/3] arm64: dts: Modify device tree for support Hikey960
Date: Tue, 24 Oct 2017 14:06:10 +0800
Message-ID: <20171024060610.10712-4-chenyu56@huawei.com>
References: <20171024060610.10712-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171024060610.10712-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: chenyu56@huawei.com, xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, arnd@arndb.de, olof@lixom.net, timur@codeaurora.org, khilman@baylibre.com, gregory.clement@free-electrons.com, narmstrong@baylibre.com, yamada.masahiro@socionext.com, robh@kernel.org, heiko@sntech.de, damm+renesas@opensource.se, krzk@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: wangbinghui@hisilicon.com, suzhuangluan@hisilicon.com
List-Id: devicetree@vger.kernel.org

Add dts for usb module of Hikey960.

Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: Ning Fan <fanning4@hisilicon.com>
Signed-off-by: Di Yang <yangdi10@hisilicon.com>
Signed-off-by: Rui Li <lirui39@hisilicon.com>

---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index b7a90d632959..dff3e68c5e38 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -324,6 +324,18 @@
 			status = "disabled";
 		};
 
+		hubv2: gpio_hubv2 {
+			compatible = "hisilicon,gpio_hubv2";
+			typc_vbus_int_gpio,typec-gpios = <&gpio25 2 0>;
+			typc_vbus_enable_val = <1>;
+			otg_gpio = <&gpio25 6 0>;
+			hub_vdd12_en_gpio = <&gpio2 1 0>;
+			hub_vdd33_en_gpio = <&gpio5 6 0>;
+			hub_reset_en_gpio = <&gpio4 4 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&usbhub5734_pmx_func>;
+		};
+
 		i2c3: i2c@fdf0c000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0xfdf0c000 0x0 0x1000>;
@@ -978,5 +990,32 @@
 			clocks = <&crg_ctrl HI3660_OSC32K>;
 			clock-names = "apb_pclk";
 		};
+
+		hisi_usb@ff200000 {
+			#address-cells = <2>;
+			#size-cells = <2>;
+			compatible = "hisilicon,hi3660-dwc3";
+			reg = <0x0 0xff200000 0x0 0x1000
+				 0x0 0xff100000 0x0 0x100000>;
+			ranges;
+			bc_again_flag = <0>;
+
+			clocks = <&crg_ctrl HI3660_CLK_ABB_USB>,
+				 <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
+			clock-names = "clk_usb3phy_ref", "aclk_usb3otg";
+			eye_diagram_param = <0x1c466e3>;
+			eye_diagram_host_param = <0x1c466e3>;
+			usb3_phy_cr_param = <0xb80>;
+			usb3_phy_host_cr_param = <0x980>;
+			usb3_phy_tx_vboost_lvl = <0x5>;
+
+			dwc3@ff100000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff100000 0x0 0x100000>;
+				interrupts = <0 159 4>, <0 161 4>;
+				dr_mode = "otg";
+				maximum-speed = "super-speed";
+			};
+		};
 	};
 };
-- 
2.11.GIT
