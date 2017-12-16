From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: [PATCH V2 7/8] ARM: dts: keystone-k2e-clocks: Add missing unit name to clock nodes that have regs
Date: Sat, 16 Dec 2017 14:40:39 -0600
Message-ID: <20171216204040.18017-8-nm@ti.com>
References: <20171215132102.435-1-nm@ti.com>
 <20171216204040.18017-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171216204040.18017-1-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the control register as the base for the clock nodes which are
missing them. This squashes the following warnings of the effect when built
with W=1:
arch/arm/boot/dts/keystone-k2e-evm.dtb: Warning (unit_address_vs_reg): Node /soc@0/clocks/clkusb1 has a reg or ranges property, but no unit name
arch/arm/boot/dts/keystone-k2e-evm.dtb: Warning (unit_address_vs_reg): Node /soc@0/clocks/clkhyperlink0 has a reg or ranges property, but no unit name
arch/arm/boot/dts/keystone-k2e-evm.dtb: Warning (unit_address_vs_reg): Node /soc@0/clocks/clkpcie1 has a reg or ranges property, but no unit name
arch/arm/boot/dts/keystone-k2e-evm.dtb: Warning (unit_address_vs_reg): Node /soc@0/clocks/clkxge has a reg or ranges property, but no unit name

Reported-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
Changes since V1: rebase

V1: https://patchwork.kernel.org/patch/10115125/

 arch/arm/boot/dts/keystone-k2e-clocks.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-clocks.dtsi b/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
index 915a99d5bc5e..5e0e7d232161 100644
--- a/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
@@ -32,7 +32,7 @@ clocks {
 		reg-names = "control";
 	};
 
-	clkusb1: clkusb1 {
+	clkusb1: clkusb1@2350004 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk16>;
@@ -42,7 +42,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkhyperlink0: clkhyperlink0 {
+	clkhyperlink0: clkhyperlink02350030 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk12>;
@@ -52,7 +52,7 @@ clocks {
 		domain-id = <5>;
 	};
 
-	clkpcie1: clkpcie1 {
+	clkpcie1: clkpcie1@235006c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk12>;
@@ -62,7 +62,7 @@ clocks {
 		domain-id = <18>;
 	};
 
-	clkxge: clkxge {
+	clkxge: clkxge@23500c8 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
