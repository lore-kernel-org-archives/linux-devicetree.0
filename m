From: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 1/1] dt-binding: remoteproc: Fixup ADSP loader bindings
Date: Wed,  2 Nov 2016 14:38:09 -0700
Message-ID: <1478122689-5117-1-git-send-email-spjoshi@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Trilok Soni <tsoni-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixup "dt-binding: remoteproc: Introduce ADSP loader binding"
patch to include XO clock required for booting up Qualcomm ADSP
Processor.

Signed-off-by: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 3820151..69f185f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -21,6 +21,16 @@ on the Qualcomm ADSP core.
 	Value type: <stringlist>
 	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
 
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the xo clock
+
+- clock-names = "xo";
+	Usage: required
+	Value type: <stringlist>
+	Definition: must list the xo clock name
+
 - cx-supply:
 	Usage: required
 	Value type: <phandle>
@@ -61,6 +71,9 @@ ADSP, as it is found on MSM8974 boards.
 				  "handover",
 				  "stop-ack";
 
+		clocks = <&rpmcc RPM_CXO_CLK>;
+		clock-names = "xo";
+
 		cx-supply = <&pm8841_s2>;
 
 		memory-region = <&adsp_region>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
