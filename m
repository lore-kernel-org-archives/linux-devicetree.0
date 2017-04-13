From: Peter Rosin <peda@axentia.se>
Subject: [PATCH] ARM: dts: at91: use correct compatible for the gpio mux controller
Date: Thu, 13 Apr 2017 23:22:58 +0200
Message-ID: <1492118578-15356-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The compatible string for a gpio based mux controller is "gpio-mux",
and nothing else.

Fixes: 29dd89418007 ("ARM: dts: at91: add envelope detector mux to the Axentia TSE-850")
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-tse850-3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi!

The compatible string for the gpio based mux changed along the way (on
request from Rob) but I failed to update the implementation in the
gpio-mux driver when I made that change. Consequently, I didn't notice
that I didn't update the compatible string here either, since it all
continued to work in my tests...

The compatible string in the gpio-mux driver is being fixed to match
documentation, so this of course needs fixing too. No TSE-850 devices
are affected, except for the one on my desk.

Sorry for the churn.

Cheers,
peda

diff --git a/arch/arm/boot/dts/at91-tse850-3.dts b/arch/arm/boot/dts/at91-tse850-3.dts
index 6a724cfb5389..168665e56a56 100644
--- a/arch/arm/boot/dts/at91-tse850-3.dts
+++ b/arch/arm/boot/dts/at91-tse850-3.dts
@@ -204,7 +204,7 @@
 	};
 
 	mux: mux-controller {
-		compatible = "mux-gpio";
+		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
 
 		mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
-- 
2.1.4
