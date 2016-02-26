From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 4/5] ARM: bcm2835: Add a group for mapping pins 48-53 to sdhost.
Date: Fri, 26 Feb 2016 10:19:15 -0800
Message-ID: <1456510756-15337-5-git-send-email-eric@anholt.net>
References: <1456510756-15337-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456510756-15337-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This pin group definition comes from downstream.  We don't have a
driver for sdhost integrated yet, but they've been experimenting with
it and it sounds useful to bring over.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm283x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 70a6814..0bb32cc 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -191,6 +191,10 @@
 				brcm,pins = <45>;
 				brcm,function = <BCM2835_FSEL_ALT0>;
 			};
+			sdhost_gpio48: sdhost_gpio48 {
+				brcm,pins = <48 49 50 51 52 53>;
+				brcm,function = <BCM2835_FSEL_ALT0>;
+			};
 			i2c0_gpio44: i2c0_gpio44 {
 				brcm,pins = <44 45>;
 				brcm,function = <BCM2835_FSEL_ALT1>;
-- 
2.7.0
