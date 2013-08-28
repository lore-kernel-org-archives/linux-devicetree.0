From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH 3/9] ARM: at91/dt: add usb1 vbus and pullup pins
Date: Wed, 28 Aug 2013 13:04:41 +0200
Message-ID: <1377687881-10688-1-git-send-email-b.brezillon@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Joachim Eastwood <manabian@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Add vbus and pullup pinctrl definitions.
Request the vbus and pullup pins in usb1 node.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 arch/arm/boot/dts/at91rm9200ek.dts |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
index 37b0880..76f3e87 100644
--- a/arch/arm/boot/dts/at91rm9200ek.dts
+++ b/arch/arm/boot/dts/at91rm9200ek.dts
@@ -29,6 +29,18 @@
 
 	ahb {
 		apb {
+			pinctrl@fffff400 {
+				usb1 {
+					pinctrl_usb1_vbus: usb1_vbus-0 {
+						atmel,pins = <AT91_PIOD 4 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+					};
+
+					pinctrl_usb1_pullup: usb1_pullup-0 {
+						atmel,pins = <AT91_PIOD 5 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
+					};
+				};
+			};
+
 			dbgu: serial@fffff200 {
 				status = "okay";
 			};
@@ -56,6 +68,9 @@
 
 			usb1: gadget@fffb0000 {
 				atmel,vbus-gpio = <&pioD 4 GPIO_ACTIVE_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_usb1_vbus
+					     &pinctrl_usb1_pullup>;
 				status = "okay";
 			};
 
-- 
1.7.9.5
