From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH v2 7/7] MIPS: BMIPS: Add device tree example for BCM6362
Date: Wed,  3 Aug 2016 11:58:30 +0200
Message-ID: <1470218310-2978-7-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu, john@phrozen.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds a device tree example for SFR NeufBox 6.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/bmips/Kconfig                            |   4 +
 arch/mips/boot/dts/brcm/Makefile                   |   2 +
 .../boot/dts/brcm/bcm6362-neufbox6-sercomm.dts     |  22 ++++
 arch/mips/boot/dts/brcm/bcm6362.dtsi               | 134 +++++++++++++++++++++
 4 files changed, 162 insertions(+)
 create mode 100644 arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts
 create mode 100644 arch/mips/boot/dts/brcm/bcm6362.dtsi

diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
index f499fd2..2d60f25 100644
--- a/arch/mips/bmips/Kconfig
+++ b/arch/mips/bmips/Kconfig
@@ -73,6 +73,10 @@ config DT_SFR_NEUFBOX4_SERCOMM
 	bool "SFR Neufbox 4 (Sercomm)"
 	select BUILTIN_DTB
 
+config DT_SFR_NEUFBOX6_SERCOMM
+	bool "SFR Neufbox 6 (Sercomm)"
+	select BUILTIN_DTB
+
 endchoice
 
 endif
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm/Makefile
index a698e84..d61bc2a 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -13,10 +13,12 @@ dtb-$(CONFIG_DT_BCM97435SVMB)		+= bcm97435svmb.dtb
 dtb-$(CONFIG_DT_COMTREND_VR3032U)	+= bcm63268-comtrend-vr-3032u.dtb
 dtb-$(CONFIG_DT_NETGEAR_CVG834G)	+= bcm3368-netgear-cvg834g.dtb
 dtb-$(CONFIG_DT_SFR_NEUFBOX4_SERCOMM)	+= bcm6358-neufbox4-sercomm.dtb
+dtb-$(CONFIG_DT_SFR_NEUFBOX6_SERCOMM)	+= bcm6362-neufbox6-sercomm.dtb
 
 dtb-$(CONFIG_DT_NONE) += \
 	bcm3368-netgear-cvg834g.dtb \
 	bcm6358-neufbox4-sercomm.dtb \
+	bcm6362-neufbox6-sercomm.dtb \
 	bcm63268-comtrend-vr-3032u.dtb \
 	bcm93384wvg.dtb \
 	bcm93384wvg_viper.dtb \
diff --git a/arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts b/arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts
new file mode 100644
index 0000000..480f2a5
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm6362-neufbox6-sercomm.dts
@@ -0,0 +1,22 @@
+/dts-v1/;
+
+/include/ "bcm6362.dtsi"
+
+/ {
+	compatible = "sfr,nb6-ser", "brcm,bcm6362";
+	model = "SFR NeufBox 6 (Sercomm)";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x08000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+		stdout-path = &uart0;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
new file mode 100644
index 0000000..c507da5
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -0,0 +1,134 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm6362";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mips-hpt-frequency = <200000000>;
+
+		cpu@0 {
+			compatible = "brcm,bmips4350";
+			device_type = "cpu";
+			reg = <0>;
+		};
+
+		cpu@1 {
+			compatible = "brcm,bmips4350";
+			device_type = "cpu";
+			reg = <1>;
+		};
+	};
+
+	clocks {
+		periph_clk: periph-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+		};
+	};
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	cpu_intc: interrupt-controller {
+		#address-cells = <0>;
+		compatible = "mti,cpu-interrupt-controller";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
+
+	ubus {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		compatible = "simple-bus";
+		ranges;
+
+		periph_cntl: syscon@10000000 {
+			compatible = "syscon";
+			reg = <0x10000000 0x14>;
+			native-endian;
+		};
+
+		reboot: syscon-reboot@10000008 {
+			compatible = "syscon-reboot";
+			regmap = <&periph_cntl>;
+			offset = <0x8>;
+			mask = <0x1>;
+		};
+
+		periph_intc: interrupt-controller@10000020 {
+			compatible = "brcm,bcm6345-l1-intc";
+			reg = <0x10000020 0x10>,
+			      <0x10000030 0x10>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <2>, <3>;
+		};
+
+		uart0: serial@10000100 {
+			compatible = "brcm,bcm6345-uart";
+			reg = <0x10000100 0x18>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <3>;
+
+			clocks = <&periph_clk>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@10000120 {
+			compatible = "brcm,bcm6345-uart";
+			reg = <0x10000120 0x18>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <4>;
+
+			clocks = <&periph_clk>;
+
+			status = "disabled";
+		};
+
+		leds0: led-controller@10001900 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm6328-leds";
+			reg = <0x10001900 0x24>;
+
+			status = "disabled";
+		};
+
+		ehci: usb@10002500 {
+			compatible = "brcm,bcm6362-ehci", "generic-ehci";
+			reg = <0x10002500 0x100>;
+			big-endian;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <10>;
+
+			status = "disabled";
+		};
+
+		ohci: usb@10002600 {
+			compatible = "brcm,bcm6362-ohci", "generic-ohci";
+			reg = <0x10002600 0x100>;
+			big-endian;
+			no-big-frame-no;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <9>;
+
+			status = "disabled";
+		};
+	};
+};
-- 
2.1.4
