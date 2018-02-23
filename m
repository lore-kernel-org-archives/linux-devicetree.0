From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 7/7] arm64: allwinner: h6: add support for
 Pine H64 board
Date: Fri, 23 Feb 2018 20:35:55 +0800
Message-ID: <20180223123555.64009-8-icenowy@aosc.io>
References: <20180223123555.64009-6-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB74VYDKAKGQEEAQGZ7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180223123555.64009-6-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pine H64 is an Allwinner H6-based SBC from Pine64, with the following
features:

- 1GiB/2GiB/4GiB LPDDR3 DRAM (in 4GiB situation only 3GiB is
accessible)
- AXP805 PMIC
- Raspberry-Pi-compatible GPIO header, "Euler" GPIO header (not
compatible with the "Euler" on Pine A64) and "Expansion" pin header
- 2 USB 2.0 ports and 1 USB 3.0 ports
- Audio jack
- MicroSD slot and eMMC module slot
- on-board SPI NOR flash
- 1Gbps Ethernet port (via RTL8211E PHY)
- HDMI port

Adds initial support for it, including the UART on the Expansion pin
header.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Reviewed-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Tested-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
Changes in v3:
- SPDX license identifier fix.
- Add Andre's Reviewed-by/Tested-by tags.

Changes in v2:
- Switch to SPDX license identifier.

 arch/arm64/boot/dts/allwinner/Makefile             |  1 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      | 29 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index f505227b0250..addf245226f6 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -10,3 +10,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-prime.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-orangepi-zero-plus2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-nanopi-neo2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-nanopi-neo-plus2.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
new file mode 100644
index 000000000000..d36de5eb81f3
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (c) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
+ */
+
+/dts-v1/;
+
+#include "sun50i-h6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Pine H64";
+	compatible = "pine64,pine-h64", "allwinner,sun50i-h6";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
-- 
2.15.1
