From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: keystone: Add minimum support for K2G evm
Date: Tue,  2 Feb 2016 17:25:17 -0600
Message-ID: <1454455517-7360-4-git-send-email-fcooper@ti.com>
References: <1454455517-7360-1-git-send-email-fcooper@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454455517-7360-1-git-send-email-fcooper-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nm-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>

Add barebones K2G evm dts. This DTS allows the board to boot using a
ram based filesystem.

The technical reference manual for K2G can be found here:
http://www.ti.com/lit/ug/spruhy8/spruhy8.pdf

Signed-off-by: Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>
Signed-off-by: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/Makefile    |  3 ++-
 arch/arm/boot/dts/k2g-evm.dts | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/k2g-evm.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a4a6d70..8343f66 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -156,7 +156,8 @@ dtb-$(CONFIG_ARCH_INTEGRATOR) += \
 dtb-$(CONFIG_ARCH_KEYSTONE) += \
 	k2hk-evm.dtb \
 	k2l-evm.dtb \
-	k2e-evm.dtb
+	k2e-evm.dtb \
+	k2g-evm.dtb
 dtb-$(CONFIG_MACH_KIRKWOOD) += \
 	kirkwood-b3.dtb \
 	kirkwood-blackarmor-nas220.dtb \
diff --git a/arch/arm/boot/dts/k2g-evm.dts b/arch/arm/boot/dts/k2g-evm.dts
new file mode 100644
index 0000000..99663b3
--- /dev/null
+++ b/arch/arm/boot/dts/k2g-evm.dts
@@ -0,0 +1,32 @@
+/*
+ * Device Tree Source for K2G EVM
+ *
+ * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+/dts-v1/;
+
+#include "k2g.dtsi"
+
+/ {
+	compatible =  "ti,k2g-evm", "ti,k2g", "ti,keystone";
+	model = "Texas Instruments K2G General Purpose EVM";
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000008 0x00000000 0x00000000 0x80000000>;
+	};
+
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
