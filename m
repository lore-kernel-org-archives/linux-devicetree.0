From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] ARM: dts: bcm2835-rpi-zero-w: Drop unnecessary pinctrl
Date: Sun, 20 Jan 2019 18:06:00 +0100
Message-ID: <1548003960-4807-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There is no need to specify a pinctrl for the reset GPIO. So we better
remove this avoid a potential conflict between pinctrl and pwrseq
after the pinmux driver has been changed to strict:

pinctrl-bcm2835 20200000.gpio: pin gpio41 already requested by wifi-pwrseq;
cannot claim for pinctrl-bcm2835:499
pinctrl-bcm2835 20200000.gpio: pin-41 (pinctrl-bcm2835:499) status -22
pwrseq_simple: probe of wifi-pwrseq failed with error -22

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
index 644d907..6071213 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
@@ -25,8 +25,6 @@
 
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		pinctrl-names = "default";
-		pinctrl-0 = <&wl_on>;
 		reset-gpios = <&gpio 41 GPIO_ACTIVE_LOW>;
 	};
 };
@@ -98,11 +96,6 @@
 			  "SD_DATA3_R";
 
 	pinctrl-0 = <&gpioout &alt0>;
-
-	wl_on: wl-on {
-		brcm,pins = <41>;
-		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
-	};
 };
 
 &hdmi {
-- 
2.7.4
