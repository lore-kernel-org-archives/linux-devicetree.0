From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 13/32] bcm2837-rpi-3-b.dts: add gpio
Date: Wed,  1 Jun 2016 23:43:22 +0200
Message-ID: <1464817421-8519-14-git-send-email-kraxel@redhat.com>
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
index 6f47dd2..e0f429b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
@@ -25,6 +25,19 @@
 	};
 };
 
+&gpio {
+	pinctrl-0 = <&i2c0_gpio0
+		     &i2c1_gpio2
+		     &gpclk0_gpio4
+		     &gpclk1_gpio5
+		     &spi0_gpio7
+		     &pcm_gpio18
+		     &pwm0_gpio40
+		     &pwm1_gpio45
+		     &gpioout
+		     &alt3>;
+};
+
 &uart1 {
 	status = "okay";
 };
-- 
1.8.3.1
