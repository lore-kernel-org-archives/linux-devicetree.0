From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 6/7] devicetree: bindings: Document Krait performance monitor units (PMU)
Date: Wed,  8 Jan 2014 14:59:43 -0800
Message-ID: <1389221984-10973-7-git-send-email-sboyd@codeaurora.org>
References: <1389221984-10973-1-git-send-email-sboyd@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389221984-10973-1-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the Krait PMU compatible string.

Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/pmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
index 3e1e498fea96..ce7cccb99d87 100644
--- a/Documentation/devicetree/bindings/arm/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/pmu.txt
@@ -16,6 +16,7 @@ Required properties:
 	"arm,arm11mpcore-pmu"
 	"arm,arm1176-pmu"
 	"arm,arm1136-pmu"
+	"qcom,krait-pmu"
 - interrupts : 1 combined interrupt or 1 per core.
 
 Example:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
