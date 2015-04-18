From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 12/14] MIPS: Add a basic dtsi for the AR9132
Date: Sat, 18 Apr 2015 18:13:25 +0200
Message-ID: <1429373607-9226-1-git-send-email-albeu@free.fr>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A basic dtsi for the AR9132 with support for the DDR controller, CPU
and MISC interrupt controller, GPIO controller, the UART and the
watchdog.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 arch/mips/boot/dts/ar9132.dtsi | 119 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 arch/mips/boot/dts/ar9132.dtsi

diff --git a/arch/mips/boot/dts/ar9132.dtsi b/arch/mips/boot/dts/ar9132.dtsi
new file mode 100644
index 0000000..ede58cd
--- /dev/null
+++ b/arch/mips/boot/dts/ar9132.dtsi
@@ -0,0 +1,119 @@
+/ {
+	compatible = "qca,ar9132";
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "mips,mips24Kc";
+			reg = <0>;
+		};
+	};
+
+	cpuintc: cpuintc {
+		compatible = "qca,ar9132-cpu-intc", "qca,ar7100-cpu-intc";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		qca,ddr-wb-channel-interrupts = <2>, <3>, <4>, <5>;
+		qca,ddr-wb-channels = <&ddr_ctrl 3>, <&ddr_ctrl 2>,
+					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
+	};
+
+	ahb {
+		compatible = "simple-bus";
+		ranges;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-parent = <&cpuintc>;
+
+		apb {
+			compatible = "simple-bus";
+			ranges;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			interrupt-parent = <&miscintc>;
+
+			ddr_ctrl: ddr-controller@18000000 {
+				compatible = "qca,ar9132-ddr-controller",
+						"qca,ar7240-ddr-controller";
+				reg = <0x18000000 0x100>;
+
+				#qca,ddr-wb-channel-cells = <1>;
+			};
+
+			uart@18020000 {
+				compatible = "ns8250";
+				reg = <0x18020000 0x20>;
+				interrupts = <3>;
+
+				clocks = <&pll 2>;
+				clock-names = "uart";
+
+				reg-io-width = <4>;
+				reg-shift = <2>;
+				no-loopback-test;
+
+				status = "disabled";
+			};
+
+			gpio: gpio@18040000 {
+				compatible = "qca,ar9132-gpio",
+						"qca,ar9130-gpio";
+				reg = <0x18040000 0x30>;
+				interrupts = <2>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			pll: pll-controller@18050000 {
+				compatible = "qca,ar9132-ppl",
+						"qca,ar9130-pll";
+				reg = <0x18050000 0x20>;
+
+				clock-names = "ref";
+				/* The board must provides the ref clock */
+
+				#clock-cells = <1>;
+				clock-output-names = "cpu", "ddr", "ahb";
+			};
+
+			wdt@18060008 {
+				compatible = "qca,ar7130-wdt";
+				reg = <0x18060008 0x8>;
+
+				interrupts = <4>;
+
+				clocks = <&pll 2>;
+				clock-names = "wdt";
+			};
+
+			miscintc: miscintc@18060010 {
+				compatible = "qca,ar9132-misc-intc",
+					   qca,ar7100-misc-intc";
+				reg = <0x18060010 0x4>;
+
+				interrupt-parent = <&cpuintc>;
+				interrupts = <6>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+	};
+};
-- 
2.0.0
