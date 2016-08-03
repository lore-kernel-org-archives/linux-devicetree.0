From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH v2 5/7] MIPS: BMIPS: Add device tree example for BCM3368
Date: Wed,  3 Aug 2016 11:58:28 +0200
Message-ID: <1470218310-2978-5-git-send-email-noltari@gmail.com>
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

This adds a device tree example for Netgear CVG834G.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/bmips/Kconfig                            |   4 +
 arch/mips/boot/dts/brcm/Makefile                   |   2 +
 .../mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts |  22 +++++
 arch/mips/boot/dts/brcm/bcm3368.dtsi               | 101 +++++++++++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100644 arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts
 create mode 100644 arch/mips/boot/dts/brcm/bcm3368.dtsi

diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
index 6a0946c..f499fd2 100644
--- a/arch/mips/bmips/Kconfig
+++ b/arch/mips/bmips/Kconfig
@@ -65,6 +65,10 @@ config DT_COMTREND_VR3032U
 	bool "Comtrend VR-3032u"
 	select BUILTIN_DTB
 
+config DT_NETGEAR_CVG834G
+	bool "NETGEAR CVG834G"
+	select BUILTIN_DTB
+
 config DT_SFR_NEUFBOX4_SERCOMM
 	bool "SFR Neufbox 4 (Sercomm)"
 	select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm/Makefile
index 8281ec6..a698e84 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -11,9 +11,11 @@ dtb-$(CONFIG_DT_BCM97420C)		+= bcm97420c.dtb
 dtb-$(CONFIG_DT_BCM97425SVMB)		+= bcm97425svmb.dtb
 dtb-$(CONFIG_DT_BCM97435SVMB)		+= bcm97435svmb.dtb
 dtb-$(CONFIG_DT_COMTREND_VR3032U)	+= bcm63268-comtrend-vr-3032u.dtb
+dtb-$(CONFIG_DT_NETGEAR_CVG834G)	+= bcm3368-netgear-cvg834g.dtb
 dtb-$(CONFIG_DT_SFR_NEUFBOX4_SERCOMM)	+= bcm6358-neufbox4-sercomm.dtb
 
 dtb-$(CONFIG_DT_NONE) += \
+	bcm3368-netgear-cvg834g.dtb \
 	bcm6358-neufbox4-sercomm.dtb \
 	bcm63268-comtrend-vr-3032u.dtb \
 	bcm93384wvg.dtb \
diff --git a/arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts b/arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts
new file mode 100644
index 0000000..2f2e80f
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm3368-netgear-cvg834g.dts
@@ -0,0 +1,22 @@
+/dts-v1/;
+
+/include/ "bcm3368.dtsi"
+
+/ {
+	compatible = "netgear,cvg834g", "brcm,bcm3368";
+	model = "NETGEAR CVG834G";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x02000000>;
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
diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/brcm/bcm3368.dtsi
new file mode 100644
index 0000000..bee855c
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -0,0 +1,101 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm3368";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mips-hpt-frequency = <150000000>;
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
+		periph_cntl: syscon@fff8c000 {
+			compatible = "syscon";
+			reg = <0xfff8c000 0xc>;
+			native-endian;
+		};
+
+		reboot: syscon-reboot@fff8c008 {
+			compatible = "syscon-reboot";
+			regmap = <&periph_cntl>;
+			offset = <0x8>;
+			mask = <0x1>;
+		};
+
+		periph_intc: interrupt-controller@fff8c00c {
+			compatible = "brcm,bcm6345-l1-intc";
+			reg = <0xfff8c00c 0x8>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <2>;
+		};
+
+		uart0: serial@fff8c100 {
+			compatible = "brcm,bcm6345-uart";
+			reg = <0xfff8c100 0x18>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <2>;
+
+			clocks = <&periph_clk>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@fff8c120 {
+			compatible = "brcm,bcm6345-uart";
+			reg = <0xfff8c120 0x18>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <3>;
+
+			clocks = <&periph_clk>;
+
+			status = "disabled";
+		};
+	};
+};
-- 
2.1.4
