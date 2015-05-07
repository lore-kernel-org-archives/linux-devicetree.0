From: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
Subject: [PATCH 2/6] ARM: Zynq: DT: Enable xadc node in zynq-parallella.dts
Date: Thu, 7 May 2015 17:32:21 -0500
Message-ID: <1431037945-40360-2-git-send-email-xander.huff@ni.com>
References: <1431037945-40360-1-git-send-email-xander.huff@ni.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431037945-40360-1-git-send-email-xander.huff-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ben.shelton-acOepvfBmUk@public.gmane.org, joshc-acOepvfBmUk@public.gmane.org, joe.hershberger-acOepvfBmUk@public.gmane.org, Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that zynq-7000 disables xadc by default, enable in zynq-parallella
to retain existing behavior.

Signed-off-by: Xander Huff <xander.huff-acOepvfBmUk@public.gmane.org>
---
 arch/arm/boot/dts/zynq-parallella.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/zynq-parallella.dts
index 1745712..b1a1f7a 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -32,6 +32,12 @@
 		bootargs = "console=ttyPS0,115200 earlyprintk root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait";
 		linux,stdout-path = "/amba/serial@e0001000";
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
