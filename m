From: Karl Palsson <karlp@tweak.net.au>
Subject: [PATCH 3/3] ARM: dts: sun8i: add FriendlyARM NanoPi Duo2-IoT Box
Date: Tue, 18 Dec 2018 21:24:57 +0000
Message-ID: <20181218212457.30382-3-karlp@tweak.net.au>
References: <20181218212457.30382-1-karlp@tweak.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181218212457.30382-1-karlp@tweak.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Karl Palsson <karlp@tweak.net.au>
List-Id: devicetree@vger.kernel.org

The IoT-Box is a dock for the NanoPi Duo2, adding two USB host ports, a
10/100 ethernet port, a variety of pin headers for i2c and uarts, and a
quad band 2G GSM module, a SIM800C.

Full documentation and schematics available from vendor:
http://wiki.friendlyarm.com/wiki/index.php/NanoPi_Duo2_IoT-Box

Signed-off-by: Karl Palsson <karlp@tweak.net.au>
---
 arch/arm/boot/dts/Makefile                        |  1 +
 arch/arm/boot/dts/sun8i-h3-nanopi-duo2-iotbox.dts | 45 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-duo2-iotbox.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7f296bfea94a..b62d84639c7a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1064,6 +1064,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-h3-libretech-all-h3-cc.dtb \
 	sun8i-h3-mapleboard-mp130.dtb \
 	sun8i-h3-nanopi-duo2.dtb \
+	sun8i-h3-nanopi-duo2-iotbox.dtb \
 	sun8i-h3-nanopi-m1.dtb	\
 	sun8i-h3-nanopi-m1-plus.dtb \
 	sun8i-h3-nanopi-neo.dtb \
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-duo2-iotbox.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-duo2-iotbox.dts
new file mode 100644
index 000000000000..4e7fae4046a8
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-duo2-iotbox.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2018 Karl Palsson <karlp@tweak.net.au>
+ */
+
+#include "sun8i-h3-nanopi-duo2.dts"
+
+/ {
+	model = "FriendlyARM NanoPi Duo2 IoT Box";
+	compatible = "friendlyarm,nanopi-duo2-iotbox",
+		"friendlyarm,nanopi-duo2",
+		"allwinner,sun8i-h3";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
+
+&emac {
+	phy-handle = <&int_mii_phy>;
+	phy-mode = "mii";
+	allwinner,leds-active-low;
+	status = "okay";
+};
+
+/* Not addressed, SIM800C module on uart3 */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>, <&uart3_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
-- 
2.14.5
