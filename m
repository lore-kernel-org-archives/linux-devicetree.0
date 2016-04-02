From: Bert Vermeulen <bert@biot.com>
Subject: [PATCH] ARM: dts: kirkwood: Add DTS for Linksys EA4200v2/EA4500
Date: Sat,  2 Apr 2016 14:55:52 +0200
Message-ID: <1459601753-31193-1-git-send-email-bert@biot.com>
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
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Bert Vermeulen <bert@biot.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,
 ..." <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This platform is based on a Marvell 88E6282 SoC and 88E6171 switch.

The DSA port labels follow the switchdev convention.

Signed-off-by: Bert Vermeulen <bert@biot.com>
---
 arch/arm/boot/dts/kirkwood-candyhouse.dts | 228 ++++++++++++++++++++++++++++++
 1 file changed, 228 insertions(+)
 create mode 100644 arch/arm/boot/dts/kirkwood-candyhouse.dts

diff --git a/arch/arm/boot/dts/kirkwood-candyhouse.dts b/arch/arm/boot/dts/kirkwood-candyhouse.dts
new file mode 100644
index 0000000..1d16cef
--- /dev/null
+++ b/arch/arm/boot/dts/kirkwood-candyhouse.dts
@@ -0,0 +1,228 @@
+/*
+ * kirkwood-candyhouse.dts - Device Tree file for Linksys Candyhouse (E4200v2 / EA4500)
+ *
+ * (c) 2013 Jonas Gorski <jogo@openwrt.org>
+ * (c) 2013 Deutsche Telekom Innovation Laboratories
+ * (c) 2014 Luka Perkov <luka@openwrt.org>
+ * (c) 2014 Randy C. Will <randall.will@gmail.com>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+
+#include "kirkwood.dtsi"
+#include "kirkwood-6282.dtsi"
+
+/ {
+	model = "Linksys Candyhouse (E4200v2 / EA4500)";
+	compatible = "linksys,ea4500", "linksys,e4200v2", "marvell,kirkwood-88f6282", "marvell,kirkwood";
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x8000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8 earlyprintk";
+	};
+
+	mbus {
+		pcie-controller {
+			status = "okay";
+
+			pcie@1,0 {
+				status = "okay";
+			};
+
+			pcie@2,0 {
+				status = "okay";
+			};
+		};
+	};
+
+	ocp@f1000000 {
+		pinctrl: pin-controller@10000 {
+			pmx_led_white_health: pmx-led-white-health {
+				marvell,pins = "mpp7";
+				marvell,function = "gpo";
+			};
+			pmx_led_white_pulse: pmx-led-white-pulse {
+				marvell,pins = "mpp14";
+				marvell,function = "gpio";
+			};
+			pmx_btn_wps: pmx-btn-wps {
+				marvell,pins = "mpp47";
+				marvell,function = "gpio";
+			};
+			pmx_btn_reset: pmx-btn-reset {
+				marvell,pins = "mpp48";
+				marvell,function = "gpio";
+			};
+		};
+
+		/* There is no battery on the boards, so the RTC does not keep
+		   time when there is no power, making it useless. */
+		rtc@10300 {
+			status = "disabled";
+		};
+
+		serial@12000 {
+			status = "okay";
+		};
+
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-0 = < &pmx_btn_wps &pmx_btn_reset >;
+		pinctrl-names = "default";
+
+		button@15 {
+			label = "WPS Button";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+		};
+
+		button@16 {
+			label = "Reset Button";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = < &pmx_led_white_health &pmx_led_white_pulse >;
+		pinctrl-names = "default";
+
+		white-health {
+			label = "candyhouse:white:health";
+			gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		white-pulse {
+			label = "candyhouse:white:pulse";
+			gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	dsa@0 {
+		compatible = "marvell,dsa";
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		dsa,ethernet = <&eth0port>;
+		dsa,mii-bus = <&mdio>;
+
+		switch@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x10 0>;	/* MDIO address 16, switch 0 in tree */
+
+			port@0 {
+				reg = <0>;
+				label = "sw0p0";
+			};
+
+			port@1 {
+				reg = <1>;
+				label = "sw0p1";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "sw0p2";
+			};
+
+			port@3 {
+				reg = <3>;
+				label = "sw0p3";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "sw0p4";
+			};
+
+			port@5 {
+				reg = <5>;
+				label = "cpu";
+			};
+		};
+	};
+};
+
+&nand {
+	status = "okay";
+	pinctrl-0 = <&pmx_nand>;
+	pinctrl-names = "default";
+
+	partition@0 {
+		label = "u-boot";
+		reg = <0x0 0x80000>;
+	};
+
+	partition@80000 {
+		label = "u_env";
+		reg = <0x80000 0x20000>;
+	};
+
+	partition@A0000 {
+		label = "s_env";
+		reg = <0xA0000 0x20000>;
+	};
+
+	partition@200000 {
+		label = "kernel";
+		reg = <0x200000 0x2A0000>;
+	};
+
+	partition@4A0000 {
+		label = "rootfs";
+		reg = <0x4A0000 0x1760000>;
+	};
+
+	partition@1C00000 {
+		label = "alt_kernel";
+		reg = <0x1C00000 0x2A0000>;
+	};
+
+	partition@1EA0000 {
+		label = "alt_rootfs";
+		reg = <0x1EA0000 0x1760000>;
+	};
+
+	partition@3600000 {
+		label = "syscfg";
+		reg = <0x3600000 0x4A00000>;
+	};
+};
+
+&mdio {
+	status = "okay";
+};
+
+/* eth0 is connected to a Marvell 88E6171 switch, without a PHY. So set
+ * fixed speed and duplex. */
+&eth0 {
+	status = "okay";
+	ethernet0-port@0 {
+		speed = <1000>;
+		duplex = <1>;
+	};
+};
+
+/* eth1 is connected to the switch as well. However DSA only supports a
+ * single CPU port. So leave this port disabled to avoid confusion. */
+&eth1 {
+	status = "disabled";
+	ethernet1-port@0 {
+		speed = <1000>;
+		duplex = <1>;
+	};
+};
-- 
1.9.1
