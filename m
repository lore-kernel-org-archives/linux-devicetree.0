From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V3 2/4] MIPS: dt: xilfpga: Add xilfpga device tree files.
Date: Mon, 26 Oct 2015 11:30:55 +0000
Message-ID: <1445859057-47665-3-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1445859057-47665-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445859057-47665-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, robh+dt@kernel.org
Cc: Zubair.Kakakhel@imgtec.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device tree files for the MIPSfpga platform.

See Documentation/devicetree/bindings/mips/img/xilfpga.txt
for details about MIPSfpga

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V2 -> V3

no change

V1 -> V2
Reformatted git log for 80 column
Added nexys4ddr compatible
Fixed some whitespace
Removed a redundant status okay
---
 arch/mips/boot/dts/Makefile                |  1 +
 arch/mips/boot/dts/xilfpga/Makefile        |  9 ++++++
 arch/mips/boot/dts/xilfpga/microAptiv.dtsi | 21 ++++++++++++++
 arch/mips/boot/dts/xilfpga/nexys4ddr.dts   | 46 ++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
 create mode 100644 arch/mips/boot/dts/xilfpga/Makefile
 create mode 100644 arch/mips/boot/dts/xilfpga/microAptiv.dtsi
 create mode 100644 arch/mips/boot/dts/xilfpga/nexys4ddr.dts

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 778a340..0571ef7 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -6,6 +6,7 @@ dts-dirs	+= mti
 dts-dirs	+= netlogic
 dts-dirs	+= qca
 dts-dirs	+= ralink
+dts-dirs	+= xilfpga
 
 obj-y		:= $(addsuffix /, $(dts-dirs))
 
diff --git a/arch/mips/boot/dts/xilfpga/Makefile b/arch/mips/boot/dts/xilfpga/Makefile
new file mode 100644
index 0000000..913a752
--- /dev/null
+++ b/arch/mips/boot/dts/xilfpga/Makefile
@@ -0,0 +1,9 @@
+dtb-$(CONFIG_XILFPGA_NEXYS4DDR)	+= nexys4ddr.dtb
+
+obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
+
+# Force kbuild to make empty built-in.o if necessary
+obj-				+= dummy.o
+
+always				:= $(dtb-y)
+clean-files	:= *.dtb *.dtb.S
diff --git a/arch/mips/boot/dts/xilfpga/microAptiv.dtsi b/arch/mips/boot/dts/xilfpga/microAptiv.dtsi
new file mode 100644
index 0000000..81d518e
--- /dev/null
+++ b/arch/mips/boot/dts/xilfpga/microAptiv.dtsi
@@ -0,0 +1,21 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "img,xilfpga";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "mips,m14Kc";
+			clocks	= <&ext>;
+			reg = <0>;
+		};
+	};
+
+	ext: ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+};
diff --git a/arch/mips/boot/dts/xilfpga/nexys4ddr.dts b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
new file mode 100644
index 0000000..686ebd1
--- /dev/null
+++ b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
@@ -0,0 +1,46 @@
+/dts-v1/;
+
+#include "microAptiv.dtsi"
+
+/ {
+	compatible = "digilent,nexys4ddr";
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x08000000>;
+	};
+
+	cpuintc: interrupt-controller@0 {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	axi_gpio: gpio@10600000 {
+		#gpio-cells = <1>;
+		compatible = "xlnx,xps-gpio-1.00.a";
+		gpio-controller;
+		reg = <0x10600000 0x10000>;
+		xlnx,all-inputs = <0x0>;
+		xlnx,dout-default = <0x0>;
+		xlnx,gpio-width = <0x16>;
+		xlnx,interrupt-present = <0x0>;
+		xlnx,is-dual = <0x0>;
+		xlnx,tri-default = <0xffffffff>;
+	} ;
+
+	axi_uart16550: serial@10400000 {
+		compatible = "ns16550a";
+		reg = <0x10400000 0x10000>;
+
+		reg-shift = <2>;
+		reg-offset = <0x1000>;
+
+		clocks	= <&ext>;
+	};
+};
+
+&ext {
+	clock-frequency = <50000000>;
+};
-- 
1.9.1
