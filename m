From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 1/9] ARC: [dts] Add clk feeding into timers to DTs
Date: Tue, 2 Feb 2016 16:28:51 +0530
Message-ID: <1454410739-24444-2-git-send-email-vgupta@synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com, Noam Camus <noamc@ezchip.com>
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This allows us to introduce timers in DT in next commit

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/boot/dts/axc001.dtsi         | 6 ++++++
 arch/arc/boot/dts/axc003.dtsi         | 6 ++++++
 arch/arc/boot/dts/axc003_idu.dtsi     | 6 ++++++
 arch/arc/boot/dts/nsim_700.dts        | 6 ++++++
 arch/arc/boot/dts/nsim_hs.dts         | 6 ++++++
 arch/arc/boot/dts/nsim_hs_idu.dts     | 6 ++++++
 arch/arc/boot/dts/nsimosci.dts        | 6 ++++++
 arch/arc/boot/dts/nsimosci_hs.dts     | 6 ++++++
 arch/arc/boot/dts/nsimosci_hs_idu.dts | 6 ++++++
 arch/arc/boot/dts/vdk_axc003.dtsi     | 6 ++++++
 arch/arc/boot/dts/vdk_axc003_idu.dtsi | 6 ++++++
 11 files changed, 66 insertions(+)

diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index e7a83d19c5a3..40bcecfc3687 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -26,6 +26,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <750000000>;
+		};
+
 		core_intc: arc700-intc@cpu {
 			compatible = "snps,arc700-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index b0e3ccdf8fc7..cabe0deeb2d8 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -25,6 +25,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <90000000>;
+		};
+
 		core_intc: archs-intc@cpu {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index f87ae409c8ed..8955881db794 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -25,6 +25,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <90000000>;
+		};
+
 		core_intc: archs-intc@cpu {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/nsim_700.dts b/arch/arc/boot/dts/nsim_700.dts
index 987921f711c1..5d5e373e0ebc 100644
--- a/arch/arc/boot/dts/nsim_700.dts
+++ b/arch/arc/boot/dts/nsim_700.dts
@@ -32,6 +32,12 @@
 		/* child and parent address space 1:1 mapped */
 		ranges;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <80000000>;
+		};
+
 		core_intc: interrupt-controller {
 			compatible = "snps,arc700-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/nsim_hs.dts b/arch/arc/boot/dts/nsim_hs.dts
index bd46aec88c6a..cbd08fa38339 100644
--- a/arch/arc/boot/dts/nsim_hs.dts
+++ b/arch/arc/boot/dts/nsim_hs.dts
@@ -38,6 +38,12 @@
 		/* only perip space at end of low mem accessible */
 		ranges = <0x80000000 0x0 0x80000000 0x80000000>;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <80000000>;
+		};
+
 		core_intc: core-interrupt-controller {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/nsim_hs_idu.dts b/arch/arc/boot/dts/nsim_hs_idu.dts
index cc82781727a1..99eabe1a2bf6 100644
--- a/arch/arc/boot/dts/nsim_hs_idu.dts
+++ b/arch/arc/boot/dts/nsim_hs_idu.dts
@@ -29,6 +29,12 @@
 		/* child and parent address space 1:1 mapped */
 		ranges;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <80000000>;
+		};
+
 		core_intc: core-interrupt-controller {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/nsimosci.dts b/arch/arc/boot/dts/nsimosci.dts
index 1c169dc74ad1..bc3161ab8f82 100644
--- a/arch/arc/boot/dts/nsimosci.dts
+++ b/arch/arc/boot/dts/nsimosci.dts
@@ -35,6 +35,12 @@
 		/* child and parent address space 1:1 mapped */
 		ranges;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <20000000>;
+		};
+
 		intc: interrupt-controller {
 			compatible = "snps,arc700-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/nsimosci_hs.dts b/arch/arc/boot/dts/nsimosci_hs.dts
index 9444956156d9..273dcce2cc66 100644
--- a/arch/arc/boot/dts/nsimosci_hs.dts
+++ b/arch/arc/boot/dts/nsimosci_hs.dts
@@ -35,6 +35,12 @@
 		/* child and parent address space 1:1 mapped */
 		ranges;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <20000000>;
+		};
+
 		core_intc: core-interrupt-controller {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/nsimosci_hs_idu.dts b/arch/arc/boot/dts/nsimosci_hs_idu.dts
index ff11388ee484..8fe60967a4c5 100644
--- a/arch/arc/boot/dts/nsimosci_hs_idu.dts
+++ b/arch/arc/boot/dts/nsimosci_hs_idu.dts
@@ -33,6 +33,12 @@
 		/* child and parent address space 1:1 mapped */
 		ranges;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <5000000>;
+		};
+
 		core_intc: core-interrupt-controller {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/vdk_axc003.dtsi b/arch/arc/boot/dts/vdk_axc003.dtsi
index 035759ee62a5..ad4ee43bd2ac 100644
--- a/arch/arc/boot/dts/vdk_axc003.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003.dtsi
@@ -25,6 +25,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <50000000>;
+		};
+
 		core_intc: archs-intc@cpu {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
diff --git a/arch/arc/boot/dts/vdk_axc003_idu.dtsi b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
index 90e18f404889..a3cb6263c581 100644
--- a/arch/arc/boot/dts/vdk_axc003_idu.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
@@ -26,6 +26,12 @@
 
 		ranges = <0x00000000 0xf0000000 0x10000000>;
 
+		core_clk: core_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <50000000>;
+		};
+
 		core_intc: archs-intc@cpu {
 			compatible = "snps,archs-intc";
 			interrupt-controller;
-- 
2.5.0
