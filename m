From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH RFC 4/4] ARM: bcm2835: assign pins to sdhci pinctrl
Date: Thu, 19 Nov 2015 16:06:16 +0000
Message-ID: <1447949176-21926-5-git-send-email-stefan.wahren@i2se.com>
References: <1447949176-21926-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447949176-21926-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Finally this patch assign all relevant pins to the sdhci pinctrl.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts |    4 ++++
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts |    4 ++++
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts |    4 ++++
 arch/arm/boot/dts/bcm2835-rpi-b.dts      |    4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
index 50be11d..4d562d9 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -28,3 +28,7 @@
 		brcm,function = <BCM2835_FSEL_ALT0>;
 	};
 };
+
+&sdhci {
+	pinctrl-0 = <&sdhci_alt3>;
+};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index 43dd5ef..27a533a 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -28,3 +28,7 @@
 		brcm,function = <BCM2835_FSEL_ALT0>;
 	};
 };
+
+&sdhci {
+	pinctrl-0 = <&sdhci_alt3>;
+};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
index e5a65a8..dcc1627 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -21,3 +21,7 @@
 		brcm,function = <BCM2835_FSEL_ALT2>;
 	};
 };
+
+&sdhci {
+	pinctrl-0 = <&sdhci_alt3>;
+};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index 1be2220..bdb9308 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -20,3 +20,7 @@
 		brcm,function = <BCM2835_FSEL_GPIO_IN>;
 	};
 };
+
+&sdhci {
+	pinctrl-0 = <&sdhci_alt3 &sdhci_cd>;
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
