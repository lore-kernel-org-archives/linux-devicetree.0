From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 3/6] ARM: dts: uniphier: route on-board device IRQ to GPIO controller
Date: Wed, 18 Oct 2017 13:24:34 +0900
Message-ID: <1508300677-23190-4-git-send-email-yamada.masahiro@socionext.com>
References: <1508300677-23190-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508300677-23190-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Interrupt lines from on-board devices are connected to the GPIO
controller.  Handle this correctly.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm/boot/dts/uniphier-ld4-ref.dts       | 2 +-
 arch/arm/boot/dts/uniphier-ld6b-ref.dts      | 2 +-
 arch/arm/boot/dts/uniphier-pro4-ref.dts      | 2 +-
 arch/arm/boot/dts/uniphier-sld8-ref.dts      | 2 +-
 arch/arm/boot/dts/uniphier-support-card.dtsi | 1 +
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-ld4-ref.dts b/arch/arm/boot/dts/uniphier-ld4-ref.dts
index b3aaab3..148e7bb 100644
--- a/arch/arm/boot/dts/uniphier-ld4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ld4-ref.dts
@@ -38,7 +38,7 @@
 };
 
 &ethsc {
-	interrupts = <0 49 4>;
+	interrupts = <1 8>;
 };
 
 &serial0 {
diff --git a/arch/arm/boot/dts/uniphier-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
index 2188d11..ec2a098 100644
--- a/arch/arm/boot/dts/uniphier-ld6b-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
@@ -40,7 +40,7 @@
 };
 
 &ethsc {
-	interrupts = <0 52 4>;
+	interrupts = <4 8>;
 };
 
 &serial0 {
diff --git a/arch/arm/boot/dts/uniphier-pro4-ref.dts b/arch/arm/boot/dts/uniphier-pro4-ref.dts
index 903df63..7316cc6 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ref.dts
@@ -40,7 +40,7 @@
 };
 
 &ethsc {
-	interrupts = <0 50 4>;
+	interrupts = <2 8>;
 };
 
 &serial0 {
diff --git a/arch/arm/boot/dts/uniphier-sld8-ref.dts b/arch/arm/boot/dts/uniphier-sld8-ref.dts
index 5accd3c..4ec48a1 100644
--- a/arch/arm/boot/dts/uniphier-sld8-ref.dts
+++ b/arch/arm/boot/dts/uniphier-sld8-ref.dts
@@ -38,7 +38,7 @@
 };
 
 &ethsc {
-	interrupts = <0 48 4>;
+	interrupts = <0 8>;
 };
 
 &serial0 {
diff --git a/arch/arm/boot/dts/uniphier-support-card.dtsi b/arch/arm/boot/dts/uniphier-support-card.dtsi
index 6c825f1..c6d99c4 100644
--- a/arch/arm/boot/dts/uniphier-support-card.dtsi
+++ b/arch/arm/boot/dts/uniphier-support-card.dtsi
@@ -16,6 +16,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00000000 1 0x01f00000 0x00100000>;
+		interrupt-parent = <&gpio>;
 
 		ethsc: ethernet@0 {
 			compatible = "smsc,lan9118", "smsc,lan9115";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
