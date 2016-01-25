From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH] ARM: bcm2835: dt: Add a fall-back Raspberry Pi tree
Date: Mon, 25 Jan 2016 21:39:54 +0100
Message-ID: <1453754394-3639-1-git-send-email-lkundrak@v3.sk>
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

U-Boot falls back to "bcm2835-rpi-other.dtb" for boards of unknown
identification. Let's do a bare minimum for them so that they at leat
boot.

Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
---
 arch/arm/boot/dts/Makefile              | 1 +
 arch/arm/boot/dts/bcm2835-rpi-other.dts | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2835-rpi-other.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d000814..d15a403 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -59,6 +59,7 @@ dtb-$(CONFIG_ARCH_ATLAS7) += \
 dtb-$(CONFIG_ARCH_AXXIA) += \
 	axm5516-amarillo.dtb
 dtb-$(CONFIG_ARCH_BCM2835) += \
+	bcm2835-rpi-other.dtb \
 	bcm2835-rpi-b.dtb \
 	bcm2835-rpi-a.dtb \
 	bcm2835-rpi-b-rev2.dtb \
diff --git a/arch/arm/boot/dts/bcm2835-rpi-other.dts b/arch/arm/boot/dts/bcm2835-rpi-other.dts
new file mode 100644
index 0000000..de0b7a2
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2835-rpi-other.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+#include "bcm2835-rpi.dtsi"
+
+/ {
+	compatible = "brcm,bcm2835";
+	model = "Raspberry Pi Unknown Model";
+};
-- 
2.5.0
