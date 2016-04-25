From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [Patch v2 7/8] dts: qcom: apq8084: Add SCM firmware node
Date: Mon, 25 Apr 2016 18:08:44 -0500
Message-ID: <1461625725-32425-8-git-send-email-andy.gross@linaro.org>
References: <1461625725-32425-1-git-send-email-andy.gross@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461625725-32425-1-git-send-email-andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jilai wang <jilaiw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the firmware node for the SCM

Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index a33a09f..1974412 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -86,6 +86,14 @@
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-apq8084";
+			clocks = <&gcc GCC_CE1_CLK> , <&gcc GCC_CE1_AXI_CLK>, <&gcc GCC_CE1_AHB_CLK>;
+			clock-names = "core", "bus", "iface";
+		};
+	};
+
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
 		interrupts = <1 7 0xf04>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
