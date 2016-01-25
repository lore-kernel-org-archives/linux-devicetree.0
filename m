From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH] ARM: bcm2835: dt: Add Raspberry Pi Model A
Date: Mon, 25 Jan 2016 21:40:06 +0100
Message-ID: <1453754406-3739-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
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

This one is essentially the same as revision 2 B board (with the I2S on
P5 header).

Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
---
 arch/arm/boot/dts/Makefile          |  1 +
 arch/arm/boot/dts/bcm2835-rpi-a.dts | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2835-rpi-a.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a4a6d70..d000814 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_AXXIA) += \
 	axm5516-amarillo.dtb
 dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-b.dtb \
+	bcm2835-rpi-a.dtb \
 	bcm2835-rpi-b-rev2.dtb \
 	bcm2835-rpi-b-plus.dtb \
 	bcm2835-rpi-a-plus.dtb \
diff --git a/arch/arm/boot/dts/bcm2835-rpi-a.dts b/arch/arm/boot/dts/bcm2835-rpi-a.dts
new file mode 100644
index 0000000..42d6bf8
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2835-rpi-a.dts
@@ -0,0 +1,23 @@
+/dts-v1/;
+#include "bcm2835-rpi.dtsi"
+
+/ {
+	compatible = "raspberrypi,model-a", "brcm,bcm2835";
+	model = "Raspberry Pi Model A";
+
+	leds {
+		act {
+			gpios = <&gpio 16 1>;
+		};
+	};
+};
+
+&gpio {
+	pinctrl-0 = <&gpioout &alt0 &i2s_alt2 &alt3>;
+
+	/* I2S interface */
+	i2s_alt2: i2s_alt2 {
+		brcm,pins = <28 29 30 31>;
+		brcm,function = <BCM2835_FSEL_ALT2>;
+	};
+};
-- 
2.5.0
