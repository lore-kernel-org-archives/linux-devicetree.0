From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: BCM5301X: Specify USB ports for each controller
Date: Tue, 27 Jun 2017 19:35:27 +0200
Message-ID: <20170627173527.16682-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Northstar has 3 controllers: OHCI and EHCI (each with 2 ports) and XHCI
(with just 1 port). Describe them in the DT. In future this will allow
to reference them as trigger sources.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 arch/arm/boot/dts/bcm5301x.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 98647d22b291..045b9bb857f9 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -272,6 +272,19 @@
 				reg = <0x00021000 0x1000>;
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ehci_port1: port@1 {
+					reg = <1>;
+					#trigger-source-cells = <0>;
+				};
+
+				ehci_port2: port@2 {
+					reg = <2>;
+					#trigger-source-cells = <0>;
+				};
 			};
 
 			ohci: ohci@22000 {
@@ -280,6 +293,19 @@
 				compatible = "generic-ohci";
 				reg = <0x00022000 0x1000>;
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ohci_port1: port@1 {
+					reg = <1>;
+					#trigger-source-cells = <0>;
+				};
+
+				ohci_port2: port@2 {
+					reg = <2>;
+					#trigger-source-cells = <0>;
+				};
 			};
 		};
 
@@ -300,6 +326,14 @@
 				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb3_phy>;
 				phy-names = "usb";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				xhci_port1: port@1 {
+					reg = <1>;
+					#trigger-source-cells = <0>;
+				};
 			};
 		};
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
