From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] DT: mfd: pm8xxx: Add new compatible string
Date: Tue, 23 Sep 2014 16:52:40 +0300
Message-ID: <1411480360-18091-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The rtc driver now supports PM8941 PMIC device, reflect this
in the binding document.

Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/mfd/qcom,pm8xxx.txt        |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt b/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
index 03518dc..f24f334 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8xxx.txt
@@ -61,6 +61,7 @@ The below bindings specify the set of valid subnodes.
 	Definition: must be one of:
 		    "qcom,pm8058-rtc"
 		    "qcom,pm8921-rtc"
+		    "qcom,pm8941-rtc"
 
 - reg:
 	Usage: required
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
