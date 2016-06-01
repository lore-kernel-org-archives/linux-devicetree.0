From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 25/32] dt-gpio-fix
Date: Wed,  1 Jun 2016 23:43:34 +0200
Message-ID: <1464817421-8519-26-git-send-email-kraxel@redhat.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Eric Anholt <eric@anholt.net>

---
 arch/arm/boot/dts/bcm283x.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 170d620..30e6f46 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -293,12 +293,12 @@
 				brcm,pins = <19>;
 				brcm,function = <BCM2835_FSEL_ALT5>;
 			};
-			uart1_gpio30: uart1_gpio30 {
-				brcm,pins = <30 31>;
+			uart1_gpio32: uart1_gpio32 {
+				brcm,pins = <32 33>;
 				brcm,function = <BCM2835_FSEL_ALT5>;
 			};
-			uart1_ctsrts_gpio32: uart1_ctsrts_gpio32 {
-				brcm,pins = <32 33>;
+			uart1_ctsrts_gpio30: uart1_ctsrts_gpio30 {
+				brcm,pins = <30 31>;
 				brcm,function = <BCM2835_FSEL_ALT5>;
 			};
 			uart1_gpio40: uart1_gpio40 {
-- 
1.8.3.1
