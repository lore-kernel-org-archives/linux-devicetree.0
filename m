From: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Subject: [PATCH 1/6] ARM: Zynq: DT: Disable xadc node by default in zynq-7000.dtsi
Date: Thu, 7 May 2015 17:32:20 -0500
Message-ID: <1431037945-40360-1-git-send-email-xander.huff@ni.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org, Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the de-facto practice.

Signed-off-by: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Reviewed-by: Ben Shelton <ben.shelton-acOepvfBmUk@public.gmane.org>
Reviewed-by: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Reviewed-by: Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>
---
 arch/arm/boot/dts/zynq-7000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index a5cd2ed..7640bdc 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -66,6 +66,7 @@
 
 		adc: adc@f8007100 {
 			compatible = "xlnx,zynq-xadc-1.00.a";
+			status = "disabled";
 			reg = <0xf8007100 0x20>;
 			interrupts = <0 7 4>;
 			interrupt-parent = <&intc>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
