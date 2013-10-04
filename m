From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: integrator: pass parent IRQ to the SIC
Date: Fri,  4 Oct 2013 15:27:02 +0200
Message-ID: <1380893222-7716-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The SIC is cascaded off the PIC, so specify this in the device tree.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/integratorcp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/integratorcp.dts b/arch/arm/boot/dts/integratorcp.dts
index ff1aea0..f0ab05f 100644
--- a/arch/arm/boot/dts/integratorcp.dts
+++ b/arch/arm/boot/dts/integratorcp.dts
@@ -48,8 +48,11 @@
 		valid-mask = <0x00000007>;
 	};
 
+	/* The SIC is cascaded off IRQ 26 on the PIC */
 	sic: sic@ca000000 {
 		compatible = "arm,versatile-fpga-irq";
+		interrupt-parent = <&pic>;
+		interrupts = <26>;
 		#interrupt-cells = <1>;
 		interrupt-controller;
 		reg = <0xca000000 0x100>;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
