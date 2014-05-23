From: Anders Berg <anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Subject: [PATCH v4 5/5] ARM: dts: axxia: Add reset controller
Date: Fri, 23 May 2014 11:08:39 +0200
Message-ID: <0f4c77059d58b463781a37d66a703f1cf2d7ed96.1400834521.git.anders.berg@avagotech.com>
References: <cover.1400834521.git.anders.berg@avagotech.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1400834521.git.anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
In-Reply-To: <cover.1400834521.git.anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
References: <cover.1400834521.git.anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anders Berg <anders.berg-M7mHMAq9Yzo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Anders Berg <anders.berg-M7mHMAq9Yzo@public.gmane.org>

Add the reset controller to the AXM5xx device tree.

Signed-off-by: Anders Berg <anders.berg-M7mHMAq9Yzo@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/axm55xx.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/axm55xx.dtsi b/arch/arm/boot/dts/axm55xx.dtsi
index 3fbd83c..ea288f0 100644
--- a/arch/arm/boot/dts/axm55xx.dtsi
+++ b/arch/arm/boot/dts/axm55xx.dtsi
@@ -101,6 +101,11 @@
 			reg = <0x20 0x10030000 0 0x2000>;
 		};
 
+		reset: reset@2010031000 {
+			compatible = "lsi,axm55xx-reset";
+			syscon = <&syscon>;
+		};
+
 		amba {
 			compatible = "arm,amba-bus";
 			#address-cells = <2>;
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
