From: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC PATCH 10/10] ARM: at91/dt: add new AIC irq mux definitions for sama5 SoCs
Date: Mon, 16 Dec 2013 22:25:40 +0100
Message-ID: <1387229140-7642-1-git-send-email-b.brezillon@overkiz.com>
References: <1387225461-6201-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387225461-6201-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add irq line muxing definition for sama5 SoCs.

Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/sama5d3.dtsi      |   40 ++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/sama5d3_tcb1.dtsi |   22 +++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index de9fece..1e8f4b5 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -390,6 +390,44 @@
 				interrupt-controller;
 				reg = <0xfffff000 0x200>;
 				atmel,external-irqs = <47>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				atmel,aic-irq-mapping = <0xffffffff 0x7ffff>;
+
+				sysc_irq_mux: irq-mux@1 {
+					compatible = "atmel,aic-mux";
+					reg = <1>;
+
+					pmc_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&pmc 0 0x64 0x5074b>;
+					};
+
+					rtc_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&rtc 0 0x24 0x1f>;
+					};
+				};
+
+				tcb0_irq_mux: irq-mux@26 {
+					compatible = "atmel,aic-mux";
+					reg = <26>;
+
+					tc0_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&tcb0 0 0x28 0xff>;
+					};
+
+					tc1_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&tcb0 0 0x68 0xff>;
+					};
+
+					tc2_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&tcb0 0 0xa8 0xff>;
+					};
+				};
 			};
 
 			pinctrl@fffff200 {
@@ -1061,7 +1099,7 @@
 				status = "disabled";
 			};
 
-			rtc@fffffeb0 {
+			rtc: rtc@fffffeb0 {
 				compatible = "atmel,at91rm9200-rtc";
 				reg = <0xfffffeb0 0x30>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
diff --git a/arch/arm/boot/dts/sama5d3_tcb1.dtsi b/arch/arm/boot/dts/sama5d3_tcb1.dtsi
index 382b044..123b153 100644
--- a/arch/arm/boot/dts/sama5d3_tcb1.dtsi
+++ b/arch/arm/boot/dts/sama5d3_tcb1.dtsi
@@ -18,6 +18,28 @@
 
 	ahb {
 		apb {
+			aic: interrupt-controller@fffff000 {
+				tcb1_irq_mux: irq-mux@27 {
+					compatible = "atmel,aic-mux";
+					reg = <27>;
+
+					tc3_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&tcb1 0 0x28 0xff>;
+					};
+
+					tc4_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&tcb1 0 0x68 0xff>;
+					};
+
+					tc5_irq {
+						compatible = "atmel,aic-mux-3reg-irq";
+						atmel,aic-mux-irq-reg = <&tcb1 0 0xa8 0xff>;
+					};
+				};
+			};
+
 			pmc: pmc@fffffc00 {
 				periphck {
 					tcb1_clk: tcb1_clk {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
