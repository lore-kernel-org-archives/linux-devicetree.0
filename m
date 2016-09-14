From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 6/6] ARM: dts: bcm283x: add pinctrl group to &sdhci, drop pins from &gpio
Date: Wed, 14 Sep 2016 10:23:35 +0200
Message-ID: <1473841415-937-7-git-send-email-kraxel@redhat.com>
References: <1473841415-937-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473841415-937-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: eric@anholt.net, swarren@wwwdotorg.org, bcm-kernel-feedback-list@broadcom.com, Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

As the alt3 group has no pins left after this
update drop the whole alt3 group from &gpio.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 8688204..a46fa41 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -41,11 +41,6 @@
 		brcm,pins = <4 5 7 8 9 10 11>;
 		brcm,function = <BCM2835_FSEL_ALT0>;
 	};
-
-	alt3: alt3 {
-		brcm,pins = <48 49 50 51 52 53>;
-		brcm,function = <BCM2835_FSEL_ALT3>;
-	};
 };
 
 &i2c0 {
@@ -67,6 +62,8 @@
 };
 
 &sdhci {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_gpio48>;
 	status = "okay";
 	bus-width = <4>;
 };
-- 
1.8.3.1
