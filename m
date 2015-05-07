From: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Subject: [PATCH 4/6] ARM: Zynq: DT: Enable xadc node in zynq-zc706.dts
Date: Thu, 7 May 2015 17:32:23 -0500
Message-ID: <1431037945-40360-4-git-send-email-xander.huff@ni.com>
References: <1431037945-40360-1-git-send-email-xander.huff@ni.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431037945-40360-1-git-send-email-xander.huff-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org, Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that zynq-7000 disables xadc by default, enable in zynq-zc706
to retain existing behavior.

Signed-off-by: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
---
 arch/arm/boot/dts/zynq-zc706.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 850518d..e7f81e3 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -37,6 +37,12 @@
 		compatible = "usb-nop-xceiv";
 		#phy-cells = <0>;
 	};
+
+	amba {
+		adc: adc@f8007100 {
+			status = "okay";
+		};
+	};
 };
 
 &clkc {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
