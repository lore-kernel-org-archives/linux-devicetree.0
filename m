From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH 3/3] ARM: bcm2835: dt: Add Raspberry Pi Model A+
Date: Sun, 11 Oct 2015 21:37:17 +0200
Message-ID: <1444592237-12433-3-git-send-email-lkundrak@v3.sk>
References: <1444592237-12433-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1444592237-12433-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Essentially the same as B+.

Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
---
 arch/arm/boot/dts/Makefile               |  3 ++-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 23d6493..aaaf299 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -59,7 +59,8 @@ dtb-$(CONFIG_ARCH_AXXIA) += \
 dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-b.dtb \
 	bcm2835-rpi-b-rev2.dtb \
-	bcm2835-rpi-b-plus.dtb
+	bcm2835-rpi-b-plus.dtb \
+	bcm2835-rpi-a-plus.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
new file mode 100644
index 0000000..b2bff43
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -0,0 +1,30 @@
+/dts-v1/;
+#include "bcm2835-rpi.dtsi"
+
+/ {
+	compatible = "raspberrypi,model-a-plus", "brcm,bcm2835";
+	model = "Raspberry Pi Model A+";
+
+	leds {
+		act {
+			gpios = <&gpio 47 0>;
+		};
+
+		pwr {
+			label = "PWR";
+			gpios = <&gpio 35 0>;
+			default-state = "keep";
+			linux,default-trigger = "default-on";
+		};
+	};
+};
+
+&gpio {
+	pinctrl-0 = <&gpioout &alt0 &i2s_alt0 &alt3>;
+
+	/* I2S interface */
+	i2s_alt0: i2s_alt0 {
+		brcm,pins = <18 19 20 21>;
+		brcm,function = <BCM2835_FSEL_ALT0>;
+	};
+};
-- 
2.4.3
