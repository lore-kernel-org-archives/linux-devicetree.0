From: Vijay Kumar B <vijaykumar-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
Subject: [RESEND PATCH] ARM: dts: pxa2xx: Specify all interrupts for the GPIO controller.
Date: Mon,  3 Oct 2016 15:48:12 +0530
Message-ID: <1475489892-10316-1-git-send-email-vijaykumar@zilogic.com>
References: <1475489412-9758-1-git-send-email-vijaykumar@zilogic.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475489412-9758-1-git-send-email-vijaykumar-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Vijay Kumar B <vijaykumar-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The PXA GPIO controller has 3 interrupt outputs, this needs to be
indicated in the DTS file. Without this mainstone's CPLD interrupt 0
will not be raised to the processor.

Signed-off-by: Vijay Kumar B. <vijaykumar-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Deepak S. <deepak-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/pxa2xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index 5e5af07..9ca2e5b 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -54,8 +54,8 @@
 			reg = <0x40e00000 0x10000>;
 			gpio-controller;
 			#gpio-cells = <0x2>;
-			interrupts = <10>;
-			interrupt-names = "gpio_mux";
+			interrupts = <8 9 10>;
+			interrupt-names = "gpio0", "gpio1", "gpio_mux";
 			interrupt-controller;
 			#interrupt-cells = <0x2>;
 			ranges;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
