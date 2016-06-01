From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 19/32] bcm2837-rpi-3-b.dts: move most RPi default pin groups to their devices
Date: Wed,  1 Jun 2016 23:43:28 +0200
Message-ID: <1464817421-8519-20-git-send-email-kraxel@redhat.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:BROADCOM
	BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT
	AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

---
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
index 8579df3..4636c16 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
@@ -25,17 +25,9 @@
 	};
 };
 
-&gpio {
-	pinctrl-0 = <&i2c0_gpio0
-		     &i2c1_gpio2
-		     &gpclk0_gpio4
-		     &gpclk1_gpio5
-		     &spi0_gpio7
-		     &pcm_gpio18
-		     &pwm0_gpio40
-		     &pwm1_gpio45
-		     &emmc_gpio48
-		     &gpioout>;
+&i2s {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcm_gpio18>;
 };
 
 &uart1 {
-- 
1.8.3.1
