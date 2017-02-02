From: Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH V2] Add devicetree for the Raspberry Pi 3, for arm (32)
Date: Thu,  2 Feb 2017 01:05:36 -0800
Message-ID: <20170202090536.16724-1-mzoran@crowfest.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org
Cc: kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile            | 3 ++-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8bd8878efe7b..72ba524df912 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -72,7 +72,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-b-plus.dtb \
 	bcm2835-rpi-a-plus.dtb \
 	bcm2836-rpi-2-b.dtb \
-	bcm2835-rpi-zero.dtb
+	bcm2835-rpi-zero.dtb \
+	bcm2837-rpi-3-b.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
new file mode 100644
index 000000000000..48ad20f83255
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -0,0 +1,2 @@
+#include "../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts"
+
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
