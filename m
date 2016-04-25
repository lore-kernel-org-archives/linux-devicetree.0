From: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Subject: [PATCH 21/41] Documentation: dt: power: fix spelling mistake
Date: Mon, 25 Apr 2016 01:24:18 +0100
Message-ID: <1461543878-3639-22-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461543878-3639-1-git-send-email-eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
---
 Documentation/devicetree/bindings/power/qcom,coincell-charger.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
index 0e6d875..7478992 100644
--- a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
+++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
@@ -29,7 +29,7 @@ IC (PMIC)
 - qcom,charger-disable:
 	Usage: optional
 	Value type: <boolean>
-	Definition: definining this property disables charging
+	Definition: defining this property disables charging
 
 This charger is a sub-node of one of the 8941 PMIC blocks, and is specified
 as a child node in DTS of that node.  See ../mfd/qcom,spmi-pmic.txt and
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
