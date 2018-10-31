From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 3/7] arm64: allwinner: h6: Add OrangePi Lite2
 initial support
Date: Thu,  1 Nov 2018 00:06:30 +0530
Message-ID: <20181031183634.29640-3-jagan@amarulasolutions.com>
References: <20181031183634.29640-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBUHM47PAKGQEA7YLQEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181031183634.29640-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>

OrangePi Lite2 is Allwinner H6 based open-source SBC,
which support:
- Allwinner H6 Quad-core 64-bit ARM Cortex-A53
- GPU Mali-T720
- 1GB LPDDR3 RAM
- AXP805 PMIC
- AP6356S Wifi/BT
- USB 2.0, USB 3.0 Host, OTG
- HDMI port
- 5V/2A DC power supply

Signed-off-by: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/Makefile                |  1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts   | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 8d4f97f279e0..38f4a015637c 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,5 +18,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-pc2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-prime.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus2.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
new file mode 100644
index 000000000000..e098a2475f2d
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2018 Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
+ */
+
+#include "sun50i-h6-orangepi.dtsi"
+
+/ {
+	model = "OrangePi Lite2";
+	compatible = "xunlong,orangepi-lite2", "allwinner,sun50i-h6";
+};
-- 
2.18.0.321.gffc6fa0e3
