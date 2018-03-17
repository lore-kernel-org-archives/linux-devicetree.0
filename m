From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] powerpc: wii.dts: Add drive slot LED
Date: Sat, 17 Mar 2018 16:06:17 +0100
Message-ID: <20180317150617.26913-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Wii has a blue LED in the disk drive slot, which is controlled via a
GPIO line. Add this LED to wii.dts, and mark it as a panic-indicator.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 arch/powerpc/boot/dts/wii.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index d697f706fc22..a946a8f4bee3 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -13,6 +13,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 
 /*
  * This is commented-out for now.
@@ -228,5 +229,16 @@
 			interrupts = <2>;
 		};
 	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		/* This is the blue LED in the disk drive slot */
+		drive-slot {
+			label = "wii:blue:drive_slot";
+			gpios = <&GPIO 5 GPIO_ACTIVE_HIGH>;
+			panic-indicator;
+		};
+	};
 };
 
-- 
2.16.2
