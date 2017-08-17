From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: BCM53573: Specify ports for USB LED for Tenda AC9
Date: Thu, 17 Aug 2017 11:05:14 +0200
Message-ID: <20170817090514.4503-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This uses trigger-sources documented in commit 80dc6e1cd85fc ("dt-bindings:
leds: document new trigger-sources property") to specify USB ports. Such an
information can be used by operating system to setup LEDs behavior.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts | 2 ++
 arch/arm/boot/dts/bcm53573.dtsi          | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
index 34417dac1cd0..19e61b5b066c 100644
--- a/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
+++ b/arch/arm/boot/dts/bcm47189-tenda-ac9.dts
@@ -26,6 +26,8 @@
 		usb {
 			label = "bcm53xx:blue:usb";
 			gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
+			trigger-sources = <&ohci_port1>, <&ehci_port1>;
+			linux,default-trigger = "usbport";
 		};
 
 		wps {
diff --git a/arch/arm/boot/dts/bcm53573.dtsi b/arch/arm/boot/dts/bcm53573.dtsi
index eae623f76401..c698a565b8ae 100644
--- a/arch/arm/boot/dts/bcm53573.dtsi
+++ b/arch/arm/boot/dts/bcm53573.dtsi
@@ -138,10 +138,12 @@
 
 				ehci_port1: port@1 {
 					reg = <1>;
+					#trigger-source-cells = <0>;
 				};
 
 				ehci_port2: port@2 {
 					reg = <2>;
+					#trigger-source-cells = <0>;
 				};
 			};
 
@@ -158,10 +160,12 @@
 
 				ohci_port1: port@1 {
 					reg = <1>;
+					#trigger-source-cells = <0>;
 				};
 
 				ohci_port2: port@2 {
 					reg = <2>;
+					#trigger-source-cells = <0>;
 				};
 			};
 		};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
