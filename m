From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 4/4] ARM: vexpress/tc2: Add interrupt-affinity to the PMU node
Date: Thu,  7 May 2015 15:45:05 +0100
Message-ID: <1431009905-29265-5-git-send-email-sudeep.holla@arm.com>
References: <1431009905-29265-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431009905-29265-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 9fd85eb502a7 ("ARM: pmu: add support for interrupt-affinity
property") added an optional "interrupt-affinity" property, to specify
the CPU affinity for each SPI listed in the interrupts property.

Without this property, we get this boot warning:

  CPU PMU: Failed to parse <no-node>/interrupt-affinity[0]

This patch adds interrupt-affinity to the PMU node in the
vexpress-ca15_a7(a.k.a TC2) device tree.

Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
index 7a2aeacd62c0..107395c32d82 100644
--- a/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/vexpress-v2p-ca15_a7.dts
@@ -191,6 +191,7 @@
 		compatible = "arm,cortex-a15-pmu";
 		interrupts = <0 68 4>,
 			     <0 69 4>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
 	oscclk6a: oscclk6a {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
