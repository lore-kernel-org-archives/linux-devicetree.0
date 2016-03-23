From: Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 06/17] watchdog: qcom: update device tree bindings
Date: Wed, 23 Mar 2016 17:05:01 -0500
Message-ID: <1458770712-10880-7-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: qca-upstream.external-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org, Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the compatible string to align with driver

CC: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Matthew McClintock <mmcclint-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
index 4726924..60bb2f98 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
@@ -4,9 +4,8 @@ Qualcomm Krait Processor Sub-system (KPSS) Watchdog
 Required properties :
 - compatible : shall contain only one of the following:
 
-			"qcom,kpss-wdt-msm8960"
-			"qcom,kpss-wdt-apq8064"
-			"qcom,kpss-wdt-ipq8064"
+			"qcom,kpss-timer"
+			"qcom,scss-timer"
 
 - reg : shall contain base register location and length
 - clocks : shall contain the input clock
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
