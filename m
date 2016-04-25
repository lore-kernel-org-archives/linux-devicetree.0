From: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Subject: [PATCH 15/41] Documentation: dt: mfd: fix spelling mistakes
Date: Mon, 25 Apr 2016 01:24:12 +0100
Message-ID: <1461543878-3639-16-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461543878-3639-1-git-send-email-eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Engestrom <eric-op+oiCINJLTt9jDmeYuA0g@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
index 5e97a95..b98b291 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
@@ -178,7 +178,7 @@ see regulator.txt - with additional custom properties described below:
 - qcom,force-mode:
 	Usage: optional (default if no other qcom,force-mode is specified)
 	Value type: <u32>
-	Defintion: indicates that the regulator should be forced to a
+	Definition: indicates that the regulator should be forced to a
 		   particular mode, valid values are:
 		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
 		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode
@@ -204,7 +204,7 @@ see regulator.txt - with additional custom properties described below:
 - qcom,force-mode:
 	Usage: optional
 	Value type: <u32>
-	Defintion: indicates that the regulator should not be forced to any
+	Definition: indicates that the regulator should not be forced to any
 		   particular mode, valid values are:
 		   QCOM_RPM_FORCE_MODE_NONE - do not force any mode
 		   QCOM_RPM_FORCE_MODE_LPM - force into low power mode
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
