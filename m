From: Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [V2 1/4] MIPS: dts: ralink: Add Mediatek MT7628A SoC
Date: Mon, 21 Aug 2017 11:55:29 +0100
Message-ID: <1503312931-34416-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, john@phrozen.org
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The MT7628A is the successor to the MT7620 and pin compatible with the
MT7688A, although the latter supports only a 1T1R antenna rather than
a 2T2R antenna.

This commit adds support for the following features:

- UART
- USB PHY
- EHCI
- Interrupt controller
- System controller
- Memory controller
- Reset controller

Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-mips@linux-mips.org 
Cc: devicetree@vger.kernel.org 
Cc: linux-kernel@vger.kernel.org 
Cc: linux-mediatek@lists.infradead.org 
---
Ralf: I've added this patch to both my vocore2 and omega2+
patchsets for ease of review, please only merge it once :-)

Changes in V2:
- Add MT7628 to patchset to keep kbuild happy and retain context
- Rename multiple DT nodes to standard names
- Add labels for uarts
- Rename USB PHY handle

 Documentation/devicetree/bindings/mips/ralink.txt |   1 +
 arch/mips/boot/dts/ralink/mt7628a.dtsi            | 126 ++++++++++++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 arch/mips/boot/dts/ralink/mt7628a.dtsi

diff --git a/Documentation/devicetree/bindings/mips/ralink.txt b/Documentation/devicetree/bindings/mips/ralink.txt
index b35a8d0..a16e8d7 100644
--- a/Documentation/devicetree/bindings/mips/ralink.txt
+++ b/Documentation/devicetree/bindings/mips/ralink.txt
@@ -15,3 +15,4 @@ value must be one of the following values:
   ralink,rt5350-soc
   ralink,mt7620a-soc
   ralink,mt7620n-soc
+  ralink,mt7628a-soc
diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
new file mode 100644
index 0000000..9ff7e8f
--- /dev/null
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -0,0 +1,126 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ralink,mt7628a-soc";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "mti,mips24KEc";
+			device_type = "cpu";
+			reg = <0>;
+		};
+	};
+
+	resetc: reset-controller {
+		compatible = "ralink,rt2880-reset";
+		#reset-cells = <1>;
+	};
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	palmbus@10000000 {
+		compatible = "palmbus";
+		reg = <0x10000000 0x200000>;
+		ranges = <0x0 0x10000000 0x1FFFFF>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		sysc: system-controller@0 {
+			compatible = "ralink,mt7620a-sysc", "syscon";
+			reg = <0x0 0x100>;
+		};
+
+		intc: interrupt-controller@200 {
+			compatible = "ralink,rt2880-intc";
+			reg = <0x200 0x100>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			resets = <&resetc 9>;
+			reset-names = "intc";
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+
+			ralink,intc-registers = <0x9c 0xa0
+						 0x6c 0xa4
+						 0x80 0x78>;
+		};
+
+		memory-controller@300 {
+			compatible = "ralink,mt7620a-memc";
+			reg = <0x300 0x100>;
+		};
+
+		uart0: uartlite@c00 {
+			compatible = "ns16550a";
+			reg = <0xc00 0x100>;
+
+			resets = <&resetc 12>;
+			reset-names = "uart0";
+
+			interrupt-parent = <&intc>;
+			interrupts = <20>;
+
+			reg-shift = <2>;
+		};
+
+		uart1: uart1@d00 {
+			compatible = "ns16550a";
+			reg = <0xd00 0x100>;
+
+			resets = <&resetc 19>;
+			reset-names = "uart1";
+
+			interrupt-parent = <&intc>;
+			interrupts = <21>;
+
+			reg-shift = <2>;
+		};
+
+		uart2: uart2@e00 {
+			compatible = "ns16550a";
+			reg = <0xe00 0x100>;
+
+			resets = <&resetc 20>;
+			reset-names = "uart2";
+
+			interrupt-parent = <&intc>;
+			interrupts = <22>;
+
+			reg-shift = <2>;
+		};
+	};
+
+	usb_phy: usb-phy@10120000 {
+		compatible = "mediatek,mt7628-usbphy";
+		reg = <0x10120000 0x1000>;
+
+		#phy-cells = <0>;
+
+		ralink,sysctl = <&sysc>;
+		resets = <&resetc 22 &resetc 25>;
+		reset-names = "host", "device";
+	};
+
+	ehci@101c0000 {
+		compatible = "generic-ehci";
+		reg = <0x101c0000 0x1000>;
+
+		phys = <&usb_phy>;
+		phy-names = "usb";
+
+		interrupt-parent = <&intc>;
+		interrupts = <18>;
+	};
+};
-- 
2.7.4
