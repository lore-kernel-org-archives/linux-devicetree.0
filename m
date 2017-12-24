From: henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] BCM283x JTAG pins on ALT5 Function
Date: Sun, 24 Dec 2017 13:18:02 -0800
Message-ID: <1514150282-9988-1-git-send-email-henryzhang62@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Henry Zhang <henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Henry Zhang <henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

BCM2835 ARM Peripherals doc shows gpio pins 4, 5, 6, 12 and 13
carry altenate function, ALT5 for ARM JTAG

Signed-off-by: Henry Zhang <henryzhang62-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index dcde93c..64971e4 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -251,7 +251,7 @@
 
 			jtag_gpio4: jtag_gpio4 {
 				brcm,pins = <4 5 6 12 13>;
-				brcm,function = <BCM2835_FSEL_ALT4>;
+				brcm,function = <BCM2835_FSEL_ALT5>;
 			};
 			jtag_gpio22: jtag_gpio22 {
 				brcm,pins = <22 23 24 25 26 27>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
