From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH Resend v2 2/2] arm64: dts: Add PMU node for APM X-Gene Storm SOC
Date: Wed, 13 Aug 2014 11:32:10 -0700
Message-ID: <1407954730-9768-3-git-send-email-fkan@apm.com>
References: <1407954730-9768-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407954730-9768-1-git-send-email-fkan-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-qTEPVZfXA3Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>

This patch adds the PMU device tree node for APM X-Gene Storm SOC.

Please note that this patch has dependancy on a GIC driver patch [1] which is
yet to be approved by maintainers.

[1]- https://lkml.org/lkml/2014/2/27/605
(irqchip:gic: change access of gicc_ctrl register to read modify write)

Signed-off-by: Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
---
 arch/arm64/boot/dts/apm-storm.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index 40aa96c..a2bb25e 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -97,6 +97,11 @@
 		clock-frequency = <50000000>;
 	};
 
+	pmu {
+		compatible = "apm,potenza-pmu", "arm,armv8-pmuv3";
+		interrupts = <1 12 0xff04>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
