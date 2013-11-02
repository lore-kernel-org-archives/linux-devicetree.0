From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 5/6] ARM: davinci: da850: add GPIO DT node
Date: Sat,  2 Nov 2013 21:09:34 +0530
Message-ID: <1383406775-14902-6-git-send-email-prabhakar.csenng@gmail.com>
References: <1383406775-14902-1-git-send-email-prabhakar.csenng@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383406775-14902-1-git-send-email-prabhakar.csenng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <alex.elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lad Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>

Add DT node for Davinci GPIO driver.

Signed-off-by: KV Sujith <sujithkv-l0cyMroinI0@public.gmane.org>
Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
Signed-off-by: Lad, Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/da850.dtsi |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 8d17346..d7b4cd6 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -8,6 +8,7 @@
  * option) any later version.
  */
 #include "skeleton.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	arm {
@@ -256,6 +257,20 @@
 					36
 					>;
 		};
+		gpio: gpio@1e26000 {
+			compatible = "ti,dm6441-gpio";
+			gpio-controller;
+			reg = <0x226000 0x1000>;
+			interrupts = <42 IRQ_TYPE_EDGE_BOTH
+				43 IRQ_TYPE_EDGE_BOTH 44 IRQ_TYPE_EDGE_BOTH
+				45 IRQ_TYPE_EDGE_BOTH 46 IRQ_TYPE_EDGE_BOTH
+				47 IRQ_TYPE_EDGE_BOTH 48 IRQ_TYPE_EDGE_BOTH
+				49 IRQ_TYPE_EDGE_BOTH 50 IRQ_TYPE_EDGE_BOTH>;
+			ti,ngpio = <144>;
+			ti,davinci-gpio-irq-base = <101>;
+			ti,davinci-gpio-unbanked = <0>;
+			status = "disabled";
+		};
 	};
 	nand_cs3@62000000 {
 		compatible = "ti,davinci-nand";
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
