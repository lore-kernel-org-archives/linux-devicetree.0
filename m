From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/3] dt-bindings: firmware: scm: Refactor compatibles and clocks
Date: Wed, 29 Aug 2018 16:15:03 -0700
Message-ID: <20180829231505.22660-2-bjorn.andersson@linaro.org>
References: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Sricharan R <sricharan@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

When the binding was written all "future" platforms required three
clocks, so the default compatible (qcom,scm) was defined to require
this. But as history shows all "future" platforms actually lack required
clocks. Given how the binding is written these compatibles have to be
added as an exception to the default.

Refactor the description of compatible to define that a platform
compatible should be given, followed by the fallback of qcom,scm. Also
refactor the description of the clocks in a way that this does not need
to be updated as new platform specific compatibles are added.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/firmware/qcom,scm.txt | 31 ++++++++++++-------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index fcf6979c0b6d..1c8e24530f7c 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -7,16 +7,21 @@ assorted actions.
 
 Required properties:
 - compatible: must contain one of the following:
- * "qcom,scm-apq8064" for APQ8064 platforms
- * "qcom,scm-msm8660" for MSM8660 platforms
- * "qcom,scm-msm8690" for MSM8690 platforms
- * "qcom,scm-msm8996" for MSM8996 platforms
- * "qcom,scm-ipq4019" for IPQ4019 platforms
- * "qcom,scm" for later processors (MSM8916, APQ8084, MSM8974, etc)
-- clocks: One to three clocks may be required based on compatible.
- * No clock required for "qcom,scm-msm8996", "qcom,scm-ipq4019"
- * Only core clock required for "qcom,scm-apq8064", "qcom,scm-msm8660", and "qcom,scm-msm8960"
- * Core, iface, and bus clocks required for "qcom,scm"
+ * "qcom,scm-apq8064"
+ * "qcom,scm-apq8084"
+ * "qcom,scm-msm8660"
+ * "qcom,scm-msm8916"
+ * "qcom,scm-msm8960"
+ * "qcom,scm-msm8974"
+ * "qcom,scm-msm8996"
+ * "qcom,scm-ipq4019"
+ and:
+ * "qcom,scm"
+- clocks: Specifies clocks needed by the SCM interface, if any:
+ * core clock required for "qcom,scm-apq8064", "qcom,scm-msm8660" and
+   "qcom,scm-msm8960"
+ * core, iface and bus clocks required for "qcom,scm-apq8084",
+   "qcom,scm-msm8916" and "qcom,scm-msm8974"
 - clock-names: Must contain "core" for the core clock, "iface" for the interface
   clock and "bus" for the bus clock per the requirements of the compatible.
 - qcom,dload-mode: phandle to the TCSR hardware block and offset of the
@@ -26,8 +31,10 @@ Example for MSM8916:
 
 	firmware {
 		scm {
-			compatible = "qcom,scm";
-			clocks = <&gcc GCC_CRYPTO_CLK> , <&gcc GCC_CRYPTO_AXI_CLK>, <&gcc GCC_CRYPTO_AHB_CLK>;
+			compatible = "qcom,msm8916", "qcom,scm";
+			clocks = <&gcc GCC_CRYPTO_CLK> ,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_AHB_CLK>;
 			clock-names = "core", "bus", "iface";
 		};
 	};
-- 
2.18.0
