From: David Coles <coles.david@gmail.com>
Subject: [PATCH] ARM: dts: add description of Netgear RN NV+v2 LCD
Date: Thu,  7 Feb 2019 20:53:05 -0800
Message-ID: <20190208045305.8759-1-coles.david@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, David Coles <coles.david@gmail.com>
List-Id: devicetree@vger.kernel.org

GPIO pin mapping taken from NetGear NV+ v2 5.3.13 kernel sources[1]
(see arch/arm/plat-feroceon/mv_hal/rtc/ext_rtc/usiLCD.c).

1. https://www.downloads.netgear.com/files/GPL/RND_5.3.13_WW.src.zip

Signed-off-by: David Coles <coles.david@gmail.com>
---
 .../boot/dts/kirkwood-netgear_readynas_nv+_v2.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.dts b/arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.dts
index 8cc8550242ef..a61b56f44ec7 100644
--- a/arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.dts
+++ b/arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.dts
@@ -184,6 +184,20 @@
 		gpios = <&gpio0 30 GPIO_ACTIVE_LOW>;
 	};
 
+	auxdisplay {
+		compatible = "hit,hd44780";
+		data-gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>,
+			     <&gpio1 1 GPIO_ACTIVE_HIGH>,
+			     <&gpio1 3 GPIO_ACTIVE_HIGH>,
+			     <&gpio1 17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		rs-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+		rw-gpios = <&gpio0 15 GPIO_ACTIVE_HIGH>;
+		backlight-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+		display-height-chars = <2>;
+		display-width-chars = <16>;
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.17.1
