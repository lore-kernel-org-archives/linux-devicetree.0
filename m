From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
Date: Tue, 2 Feb 2016 16:28:52 +0530
Message-ID: <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com, Noam Camus <noamc@ezchip.com>
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ARC Timers have historically been probed directly.
As precursor to start probing Timers thru DT introduce these bindings

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 .../devicetree/bindings/timer/snps,arc-timer0.txt  | 23 ++++++++++++++++++++++
 .../devicetree/bindings/timer/snps,arc-timer1.txt  | 17 ++++++++++++++++
 .../devicetree/bindings/timer/snps,archs-gfrc.txt  | 14 +++++++++++++
 .../devicetree/bindings/timer/snps,archs-rtc.txt   | 14 +++++++++++++
 arch/arc/boot/dts/abilis_tb10x.dtsi                | 12 +++++++++++
 arch/arc/boot/dts/skeleton.dtsi                    | 12 +++++++++++
 arch/arc/boot/dts/skeleton_hs.dtsi                 | 12 +++++++++++
 arch/arc/boot/dts/skeleton_hs_idu.dtsi             | 12 +++++++++++
 8 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt

diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
new file mode 100644
index 000000000000..ceb80c72a90b
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,arc-timer0.txt
@@ -0,0 +1,23 @@
+Synopsys ARC Local Timer with Interrupt Capabilities
+- Found on all ARC CPUs (ARC700/ARCHS)
+- Mandatory clockevent provider
+
+Required properties:
+
+- compatible : should be "snps,arc-timer0"
+- interrupts : single Interrupt going into parent intc
+	       (16 for ARCHS cores, 3 for ARC700 cores)
+- clocks     : phandle to the source clock
+
+Optional properties:
+
+- interrupt-parent : phandle to parent intc
+
+Example:
+
+	timer0: timer_clkevt {
+		compatible = "snps,arc-timer0";
+		interrupts = <3>;
+		interrupt-parent = <&core_intc>;
+		clocks = <&timer0_clk>;
+	};
diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
new file mode 100644
index 000000000000..4886192ce2f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
@@ -0,0 +1,17 @@
+Synopsys ARC Free Running Local 32-bit Timer
+- Found on all ARC CPUs (ARC700/ARCHS)
+- Mandatory clocksource provider on ARC700
+- Optional clocksource provider on UP ARC HS CPUs
+  (and if better timer archs-rtc not available in SoC)
+
+Required properties:
+
+- compatible : should be "snps,arc-timer1"
+- clocks     : phandle to the source clock
+
+Example:
+
+	timer1: timer_clksrc {
+		compatible = "snps,arc-timer1";
+		clocks = <&timer0_clk>;
+	};
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
new file mode 100644
index 000000000000..cce60e16aa0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
@@ -0,0 +1,14 @@
+Synopsys ARC Free Running 64-bit Global Timer for ARC HS CPUs
+- clocksourc provider for SMP SoC
+
+Required properties:
+
+- compatible : should be "snps,archs-gfrc"
+- clocks     : phandle to the source clock
+
+Example:
+
+	timer1: timer_clksrc {
+		compatible = "snps,archs-gfrc";
+		clocks = <&timer0_clk>;
+	};
diff --git a/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
new file mode 100644
index 000000000000..f3b49938812b
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
@@ -0,0 +1,14 @@
+Synopsys ARC Free Running 64-bit Local Timer for ARC HS CPUs
+- clocksourc provider for UP SoC
+
+Required properties:
+
+- compatible : should be "snps,archs-rtc"
+- clocks     : phandle to the source clock
+
+Example:
+
+	timer1: timer_clksrc {
+		compatible = "snps,arc-rtc";
+		clocks = <&timer0_clk>;
+	};
diff --git a/arch/arc/boot/dts/abilis_tb10x.dtsi b/arch/arc/boot/dts/abilis_tb10x.dtsi
index cfb5052239a1..f9f138efa92c 100644
--- a/arch/arc/boot/dts/abilis_tb10x.dtsi
+++ b/arch/arc/boot/dts/abilis_tb10x.dtsi
@@ -35,6 +35,18 @@
 		};
 	};
 
+	timer0: timer_clkevt {
+		compatible = "snps,arc-timer0";
+		interrupts = <3>;
+		interrupt-parent = <&intc>;
+		clocks = <&cpu_clk>;
+	};
+
+	timer1: timer_clksrc {
+		compatible = "snps,arc-timer1";
+		clocks = <&cpu_clk>;
+	};
+
 	soc100 {
 		#address-cells	= <1>;
 		#size-cells	= <1>;
diff --git a/arch/arc/boot/dts/skeleton.dtsi b/arch/arc/boot/dts/skeleton.dtsi
index 296d371a335c..bcb08b36210d 100644
--- a/arch/arc/boot/dts/skeleton.dtsi
+++ b/arch/arc/boot/dts/skeleton.dtsi
@@ -30,6 +30,18 @@
 		};
 	};
 
+	timer0: timer_clkevt {
+		compatible = "snps,arc-timer0";
+		interrupts = <3>;
+		interrupt-parent = <&core_intc>;
+		clocks = <&core_clk>;
+	};
+
+	timer1: timer_clksrc {
+		compatible = "snps,arc-timer1";
+		clocks = <&core_clk>;
+	};
+
 	memory {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;	/* 256M */
diff --git a/arch/arc/boot/dts/skeleton_hs.dtsi b/arch/arc/boot/dts/skeleton_hs.dtsi
index a53876669030..46c5b05aea90 100644
--- a/arch/arc/boot/dts/skeleton_hs.dtsi
+++ b/arch/arc/boot/dts/skeleton_hs.dtsi
@@ -25,6 +25,18 @@
 		};
 	};
 
+	timer0: timer_clkevt {
+		compatible = "snps,arc-timer0";
+		interrupts = <16>;
+		interrupt-parent = <&core_intc>;
+		clocks = <&core_clk>;
+	};
+
+	timer1: timer_clksrc {
+		compatible = "snps,arc-timer1";
+		clocks = <&core_clk>;
+	};
+
 	memory {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;	/* 256M */
diff --git a/arch/arc/boot/dts/skeleton_hs_idu.dtsi b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
index 74898d017f7a..2a40bd9e2e2a 100644
--- a/arch/arc/boot/dts/skeleton_hs_idu.dtsi
+++ b/arch/arc/boot/dts/skeleton_hs_idu.dtsi
@@ -25,6 +25,18 @@
 		};
 	};
 
+	timer0: timer_clkevt {
+		compatible = "snps,arc-timer0";
+		interrupts = <16>;
+		interrupt-parent = <&core_intc>;
+		clocks = <&core_clk>;
+	};
+
+	timer1: timer_clksrc {
+		compatible = "snps,archs-timer-gfrc";
+		clocks = <&core_clk>;
+	};
+
 	memory {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;	/* 256M */
-- 
2.5.0
