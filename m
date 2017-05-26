From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 08/11] arm64: dts: Add GPIO DT nodes for Stingray SOC
Date: Fri, 26 May 2017 14:55:01 +0530
Message-ID: <1495790704-2438-9-git-send-email-anup.patel@broadcom.com>
References: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495790704-2438-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

The GPIOs on Stingray SOC are based on iProc GPIOs hence
using this we add GPIO DT nodes for Stingray SOC.

Signed-off-by: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index a4afd44..059086f 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -251,6 +251,14 @@
 		ranges = <0x0 0x0 0x66400000 0x100000>;
 
 		#include "stingray-clock.dtsi"
+
+		gpio_crmu: gpio@66424800 {
+			compatible = "brcm,iproc-gpio";
+			reg = <0x00024800 0x4c>;
+			ngpios = <6>;
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
 	};
 
 	hsls {
@@ -261,6 +269,32 @@
 
 		#include "stingray-pinctrl.dtsi"
 
+		gpio_hsls: gpio@689d0000 {
+			compatible = "brcm,iproc-gpio";
+			reg = <0x000d0000 0x864>;
+			ngpios = <151>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinmux 0 0 16>,
+					<&pinmux 16 71 2>,
+					<&pinmux 18 131 8>,
+					<&pinmux 26 83 6>,
+					<&pinmux 32 123 4>,
+					<&pinmux 36 43 24>,
+					<&pinmux 60 89 2>,
+					<&pinmux 62 73 4>,
+					<&pinmux 66 95 28>,
+					<&pinmux 94 127 4>,
+					<&pinmux 98 139 10>,
+					<&pinmux 108 16 27>,
+					<&pinmux 135 77 6>,
+					<&pinmux 141 67 4>,
+					<&pinmux 145 149 6>,
+					<&pinmux 151 91 4>;
+		};
+
 		uart0: uart@68a00000 {
 			device_type = "serial";
 			compatible = "snps,dw-apb-uart";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
