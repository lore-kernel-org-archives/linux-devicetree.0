From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 8/8] devicetree: bindings: Document qcom,lcc
Date: Mon, 19 Jan 2015 18:05:35 -0800
Message-ID: <1421719535-28398-9-git-send-email-sboyd@codeaurora.org>
References: <1421719535-28398-1-git-send-email-sboyd@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421719535-28398-1-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Document the LPASS (low power audio subsystem) clock controller
found on Qualcomm devices.

Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Rajendra Nayak <rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/clock/qcom,lcc.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lcc.txt

diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.txt b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
new file mode 100644
index 000000000000..dd755be63a01
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.txt
@@ -0,0 +1,21 @@
+Qualcomm LPASS Clock & Reset Controller Binding
+------------------------------------------------
+
+Required properties :
+- compatible : shall contain only one of the following:
+
+			"qcom,lcc-msm8960"
+			"qcom,lcc-apq8064"
+			"qcom,lcc-ipq8064"
+
+- reg : shall contain base register location and length
+- #clock-cells : shall contain 1
+- #reset-cells : shall contain 1
+
+Example:
+	clock-controller@28000000 {
+		compatible = "qcom,lcc-ipq8064";
+		reg = <0x28000000 0x1000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
