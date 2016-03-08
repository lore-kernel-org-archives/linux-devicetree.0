From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/9] ARC: [dts] Add clk feeding into timers to DTs
Date: Tue, 8 Mar 2016 17:56:04 +0530
Message-ID: <1457439972-20285-2-git-send-email-vgupta@synopsys.com>
References: <1457439972-20285-1-git-send-email-vgupta@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457439972-20285-1-git-send-email-vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Noam Camus <noamc-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This allows us to introduce timers in DT in next commit

Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
