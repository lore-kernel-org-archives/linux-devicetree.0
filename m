From: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RESEND v5 2/2] PXA: add PWM nodes to pxa27x.dtsi
Date: Sat, 21 Sep 2013 12:19:34 -0700
Message-ID: <1379791174-2369-3-git-send-email-mikedunn@newsguy.com>
References: <1379791174-2369-1-git-send-email-mikedunn@newsguy.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379791174-2369-1-git-send-email-mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds PWM nodes for each of the four channels present on the
pxa270.

Signed-off-by: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/pxa27x.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index d7c5d72..a705469 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -10,5 +10,29 @@
 			marvell,intc-priority;
 			marvell,intc-nr-irqs = <34>;
 		};
+
+		pwm0: pwm@40b00000 {
+			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
+			reg = <0x40b00000 0x10>;
+			#pwm-cells = <1>;
+		};
+
+		pwm1: pwm@40b00010 {
+			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
+			reg = <0x40b00010 0x10>;
+			#pwm-cells = <1>;
+		};
+
+		pwm2: pwm@40c00000 {
+			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
+			reg = <0x40c00000 0x10>;
+			#pwm-cells = <1>;
+		};
+
+		pwm3: pwm@40c00010 {
+			compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";
+			reg = <0x40c00010 0x10>;
+			#pwm-cells = <1>;
+		};
 	};
 };
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
