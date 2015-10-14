From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 3/5] MIPS: dt: xilfpga: Add xilfpga device tree files.
Date: Wed, 14 Oct 2015 13:51:55 +0100
Message-ID: <1444827117-10939-4-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ralf@linux-mips.org, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 arch/mips/boot/dts/Makefile                |  1 +
 arch/mips/boot/dts/xilfpga/Makefile        |  9 ++++++
 arch/mips/boot/dts/xilfpga/microAptiv.dtsi | 21 +++++++++++++
 arch/mips/boot/dts/xilfpga/nexys4ddr.dts   | 47 ++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)
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
index 0000000..e225ae7
--- /dev/null
+++ b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
@@ -0,0 +1,47 @@
+/dts-v1/;
+
+#include "microAptiv.dtsi"
+
+/ {
+	compatible = "img,xilfpga";
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x07ffffff>;
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
+		reg = < 0x10600000 0x10000 >;
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
+		clock-frequency = <50000000>;
+		status = "okay";
+	};
+};
+
+&ext {
+	clock-frequency = <50000000>;
+};
-- 
1.9.1
