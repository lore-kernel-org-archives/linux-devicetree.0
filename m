From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 6/6] ARM: dts: bcm283x: add pinctrl group to &sdhci, drop pins from &gpio
Date: Mon, 12 Sep 2016 10:22:56 +0200
Message-ID: <1473668576-22256-7-git-send-email-kraxel@redhat.com>
References: <1473668576-22256-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473668576-22256-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: eric@anholt.net, swarren@wwwdotorg.org, bcm-kernel-feedback-list@broadcom.com, Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 8688204..3f0ce61 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -43,7 +43,7 @@
 	};
 
 	alt3: alt3 {
-		brcm,pins = <48 49 50 51 52 53>;
+		brcm,pins = <>;
 		brcm,function = <BCM2835_FSEL_ALT3>;
 	};
 };
@@ -67,6 +67,8 @@
 };
 
 &sdhci {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_gpio48>;
 	status = "okay";
 	bus-width = <4>;
 };
-- 
1.8.3.1
