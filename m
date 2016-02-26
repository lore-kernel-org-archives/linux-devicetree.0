From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/5] ARM: bcm2835: Move the emmc pin group to bcm283x.dtsi.
Date: Fri, 26 Feb 2016 10:19:14 -0800
Message-ID: <1456510756-15337-4-git-send-email-eric@anholt.net>
References: <1456510756-15337-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456510756-15337-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

While it's not documented in the public PDF, it is internally.  This
is a standard pin group for the 283x, not rpi-specific.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-a.dts      | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-b.dts      | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi.dtsi       | 5 -----
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts    | 4 ++--
 arch/arm/boot/dts/bcm283x.dtsi           | 4 ++++
 8 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
index 0a8b92e..1db6835 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -29,6 +29,6 @@
 		     &pcm_gpio18
 		     &pwm0_gpio40
 		     &pwm1_gpio45
-		     &gpioout
-		     &alt3>;
+		     &emmc_gpio48
+		     &gpioout>;
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi-a.dts b/arch/arm/boot/dts/bcm2835-rpi-a.dts
index d093407..25d2114 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-a.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a.dts
@@ -22,6 +22,6 @@
 		     &pcm_gpio28
 		     &pwm0_gpio40
 		     &pwm1_gpio45
-		     &gpioout
-		     &alt3>;
+		     &emmc_gpio48
+		     &gpioout>;
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index c26b81d..d8057b8 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -29,6 +29,6 @@
 		     &pcm_gpio18
 		     &pwm0_gpio40
 		     &pwm1_gpio45
-		     &gpioout
-		     &alt3>;
+		     &emmc_gpio48
+		     &gpioout>;
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
index a5b606e..e7dbff4 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -22,6 +22,6 @@
 		     &pcm_gpio28
 		     &pwm0_gpio40
 		     &pwm1_gpio45
-		     &gpioout
-		     &alt3>;
+		     &emmc_gpio48
+		     &gpioout>;
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index 97e3c2f..d154049 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -21,6 +21,6 @@
 		     &spi0_gpio7
 		     &pwm0_gpio40
 		     &pwm1_gpio45
-		     &gpioout
-		     &alt3>;
+		     &emmc_gpio48
+		     &gpioout>;
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 141b18c..eff27b0 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -36,11 +36,6 @@
 		brcm,pins = <6>;
 		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
 	};
-
-	alt3: alt3 {
-		brcm,pins = <48 49 50 51 52 53>;
-		brcm,function = <BCM2835_FSEL_ALT3>;
-	};
 };
 
 &i2c0 {
diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
index 52798ca..3e9226f 100644
--- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
+++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
@@ -33,6 +33,6 @@
 		     &pcm_gpio18
 		     &pwm0_gpio40
 		     &pwm1_gpio45
-		     &gpioout
-		     &alt3>;
+		     &emmc_gpio48
+		     &gpioout>;
 };
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index e91198e..70a6814 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -232,6 +232,10 @@
 				brcm,pins = <32 33>;
 				brcm,function = <BCM2835_FSEL_ALT3>;
 			};
+			emmc_gpio48: emmc_gpio48 {
+				brcm,pins = <48 49 50 51 52 53>;
+				brcm,function = <BCM2835_FSEL_ALT3>;
+			};
 			spi1_gpio16: spi1_gpio16 {
 				brcm,pins = <16 17 18 19 20 21>;
 				brcm,function = <BCM2835_FSEL_ALT4>;
-- 
2.7.0
