From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/8] ARM: dts: bcm283x: Add a group for mapping pins 48-53 to sdhost.
Date: Wed,  7 Sep 2016 12:31:24 +0200
Message-ID: <1473244289-20728-4-git-send-email-kraxel@redhat.com>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: eric@anholt.net, swarren@wwwdotorg.org, bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Eric Anholt <eric@anholt.net>

This pin group definition comes from downstream.  We don't have a
driver for sdhost integrated yet, but they've been experimenting with
it and it sounds useful to bring over.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm283x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 164d962..062d09db 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -212,6 +212,10 @@
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
1.8.3.1
