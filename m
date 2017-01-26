From: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 3/4] ARM: dts: Remove Broadcom iProc mailbox controller node
Date: Wed, 25 Jan 2017 16:27:01 -0800
Message-ID: <1485390422-3984-4-git-send-email-jonathan.richardson@broadcom.com>
References: <1485390422-3984-1-git-send-email-jonathan.richardson@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485390422-3984-1-git-send-email-jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mailbox controller node and crmu gpio driver changes to enable
interrupt support were prematurely merged and don't reflect the mailbox
controller driver. They are being reverted.

Signed-off-by: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 8833a4c..cf02271 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -121,15 +121,6 @@
 			      <0x0301d24c 0x2c>;
 		};
 
-		mailbox: mailbox@03024024 {
-			compatible = "brcm,iproc-mailbox";
-			reg = <0x03024024 0x40>;
-			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
-			#interrupt-cells = <1>;
-			interrupt-controller;
-			#mbox-cells = <1>;
-		};
-
 		gpio_crmu: gpio@03024800 {
 			compatible = "brcm,cygnus-crmu-gpio";
 			reg = <0x03024800 0x50>,
@@ -137,9 +128,6 @@
 			ngpios = <6>;
 			#gpio-cells = <2>;
 			gpio-controller;
-			interrupt-controller;
-			interrupt-parent = <&mailbox>;
-			interrupts = <0>;
 		};
 
 		i2c0: i2c@18008000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
