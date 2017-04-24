From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] ARM: dts: Add devicetree for the Raspberry Pi 3, for arm32 (v5)
Date: Mon, 24 Apr 2017 13:00:37 -0700
Message-ID: <20170424200037.25615-1-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Raspbian and Fedora have decided to support the Pi3 in 32-bit mode for
now, so it's useful to be able to test that mode on an upstream
kernel.  It's also been useful for me to use the same board for 32-bit
and 64-bit development.

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
---
 arch/arm/boot/dts/Makefile            | 1 +
 arch/arm/boot/dts/bcm2837-rpi-3.b.dts | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3.b.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 011808490fed..eded842d9978 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-b-plus.dtb \
 	bcm2835-rpi-a-plus.dtb \
 	bcm2836-rpi-2-b.dtb \
+	bcm2837-rpi-3-b.dtb \
 	bcm2835-rpi-zero.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3.b.dts b/arch/arm/boot/dts/bcm2837-rpi-3.b.dts
new file mode 100644
index 000000000000..8c8aa4d1e9b3
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2837-rpi-3.b.dts
@@ -0,0 +1 @@
+#include "arm64/broadcom/bcm2837-rpi-3.b.dts"
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
