From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 4/4] CRIS: add Axis 88 board device tree
Date: Sun,  8 Feb 2015 16:35:45 +0100
Message-ID: <1423409745-2230-4-git-send-email-rabin@rab.in>
References: <1423409745-2230-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423409745-2230-1-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: jesper.nilsson@axis.com
Cc: linux-cris-kernel@axis.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: devicetree@vger.kernel.org

Add a minimal device tree for the ETRAX FS SoC and the Axis 88 developer
board.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 arch/cris/boot/dts/dev88.dts    | 18 ++++++++++++++++++
 arch/cris/boot/dts/etraxfs.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 arch/cris/boot/dts/dev88.dts
 create mode 100644 arch/cris/boot/dts/etraxfs.dtsi

diff --git a/arch/cris/boot/dts/dev88.dts b/arch/cris/boot/dts/dev88.dts
new file mode 100644
index 0000000..4fa5a3f
--- /dev/null
+++ b/arch/cris/boot/dts/dev88.dts
@@ -0,0 +1,18 @@
+/dts-v1/;
+
+/include/ "etraxfs.dtsi"
+
+/ {
+	model = "Axis 88 Developer Board";
+	compatible = "axis,dev88";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	soc {
+		uart0: serial@b00260000 {
+			status = "okay";
+		};
+	};
+};
diff --git a/arch/cris/boot/dts/etraxfs.dtsi b/arch/cris/boot/dts/etraxfs.dtsi
new file mode 100644
index 0000000..909bced
--- /dev/null
+++ b/arch/cris/boot/dts/etraxfs.dtsi
@@ -0,0 +1,38 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			model = "axis,crisv32";
+			reg = <0>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		model = "etraxfs";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		intc: interrupt-controller {
+			compatible = "axis,crisv32-intc";
+			reg = <0xb001c000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
+
+		serial@b00260000 {
+			compatible = "axis,etraxfs-uart";
+			reg = <0xb0026000 0x1000>;
+			interrupts = <68>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.1.4
