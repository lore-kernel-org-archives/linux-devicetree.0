From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v3 1/5] ARM: dts: pxa: add pwri2c to pxa device-tree
Date: Sat,  7 Feb 2015 13:39:16 +0100
Message-ID: <1423312760-15871-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

pxa27x variant has 2 I2C busses on the SoC :
 - the casual I2C
 - the power I2C, normally driving power regulators, and capable of
 receiving orders on core frequency modifications

Add the missing pwri2c to pxa27x description.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
Since v2: as Dmitry pointed out, no pwri2c on pxa25x, only pxa27x
---
 arch/arm/boot/dts/pxa27x.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 80fc5d7..98b560e 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -35,6 +35,13 @@
 			reg = <0x40c00010 0x10>;
 			#pwm-cells = <1>;
 		};
+
+		pwri2c: i2c@40f000180 {
+			compatible = "mrvl,pxa-i2c";
+			reg = <0x40f00180 0x24>;
+			interrupts = <6>;
+			status = "disabled";
+		};
 	};
 
 	clocks {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
