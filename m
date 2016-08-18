From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: [PATCH v3 2/2] ARM64: dts: bcm: Use a symlink to R-Pi dtsi files from arch=arm
Date: Thu, 18 Aug 2016 11:42:06 +0100
Message-ID: <1471516926-11466-2-git-send-email-ijc@hellion.org.uk>
References: <1471516926-11466-1-git-send-email-ijc@hellion.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471516926-11466-1-git-send-email-ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The ../../../arm... style cross-references added by commit 9d56c22a7861
("ARM: bcm2835: Add devicetree for the Raspberry Pi 3.") do not work in the
context of the split device-tree repository[0] (where the directory
structure differs). As with commit 8ee57b8182c4 ("ARM64: dts: vexpress: Use
a symlink to vexpress-v2m-rs1.dtsi from arch=arm") use symlinks instead.

[0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/

Signed-off-by: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
---
v2: No more need for skeleton.dtsi since this was cleaned up in the previous
    patch
v3: Collected tags
---
 arch/arm64/boot/dts/broadcom/bcm2835-rpi.dtsi          | 1 +
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts       | 4 ++--
 arch/arm64/boot/dts/broadcom/bcm2837.dtsi              | 2 +-
 arch/arm64/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi | 1 +
 arch/arm64/boot/dts/broadcom/bcm283x.dtsi              | 1 +
 5 files changed, 6 insertions(+), 3 deletions(-)
 create mode 120000 arch/arm64/boot/dts/broadcom/bcm2835-rpi.dtsi
 create mode 120000 arch/arm64/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi
 create mode 120000 arch/arm64/boot/dts/broadcom/bcm283x.dtsi

diff --git a/arch/arm64/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm64/boot/dts/broadcom/bcm2835-rpi.dtsi
new file mode 120000
index 0000000..3937b77
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -0,0 +1 @@
+../../../../arm/boot/dts/bcm2835-rpi.dtsi
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
index 6f47dd2..7841b72 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts
@@ -1,7 +1,7 @@
 /dts-v1/;
 #include "bcm2837.dtsi"
-#include "../../../../arm/boot/dts/bcm2835-rpi.dtsi"
-#include "../../../../arm/boot/dts/bcm283x-rpi-smsc9514.dtsi"
+#include "bcm2835-rpi.dtsi"
+#include "bcm283x-rpi-smsc9514.dtsi"
 
 / {
 	compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
diff --git a/arch/arm64/boot/dts/broadcom/bcm2837.dtsi b/arch/arm64/boot/dts/broadcom/bcm2837.dtsi
index f2a31d0..8216bbb 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2837.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2837.dtsi
@@ -1,4 +1,4 @@
-#include "../../../../arm/boot/dts/bcm283x.dtsi"
+#include "bcm283x.dtsi"
 
 / {
 	compatible = "brcm,bcm2836";
diff --git a/arch/arm64/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi b/arch/arm64/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi
new file mode 120000
index 0000000..dca7c05
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm283x-rpi-smsc9514.dtsi
@@ -0,0 +1 @@
+../../../../arm/boot/dts/bcm283x-rpi-smsc9514.dtsi
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/broadcom/bcm283x.dtsi b/arch/arm64/boot/dts/broadcom/bcm283x.dtsi
new file mode 120000
index 0000000..5f54e4c
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm283x.dtsi
@@ -0,0 +1 @@
+../../../../arm/boot/dts/bcm283x.dtsi
\ No newline at end of file
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
