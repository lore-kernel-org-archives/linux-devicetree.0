From: Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 15/17] qcom: ipq4019: add cpu operating points for cpufreq support
Date: Wed, 23 Mar 2016 17:05:10 -0500
Message-ID: <1458770712-10880-16-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: qca-upstream.external-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds some operating points for cpu frequeny scaling

Signed-off-by: Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 1937edf..db48fd3 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -40,6 +40,14 @@
 			reg = <0x0>;
 			clocks = <&gcc GCC_APPS_CLK_SRC>;
 			clock-frequency = <0>;
+			operating-points = <
+				/* kHz	uV (fixed) */
+				48000	1100000
+				200000	1100000
+				500000	1100000
+				666000	1100000
+			>;
+			clock-latency = <256000>;
 		};
 
 		cpu@1 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
