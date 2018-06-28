Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 1/6] dt-bindings: power: reset: Add qcom pon binding
Date: Thu, 28 Jun 2018 20:38:45 +0530
Message-Id: <20180628150850.15358-2-vkoul@kernel.org>
In-Reply-To: <20180628150850.15358-1-vkoul@kernel.org>
References: <20180628150850.15358-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

The Power On device for Qcom PM 8xxx is a MFD supporting pwrkey and
resin along with the Android reboot-mode.

Add the binding describing this.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/power/reset/qcom,pon.txt   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
new file mode 100644
index 000000000000..f32cdd358267
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
@@ -0,0 +1,35 @@
+Qualcomm PON Device
+
+The Power On device for Qualcomm PM8xxx is MFD supporting pwrkey
+along with the Android reboot-mode.
+
+This DT node has pwrkey as sub node.
+
+Required Properties:
+-compatible: "qcom,pm8916-pon"
+-reg: Specifies the physical address of the pon register
+
+Optional subnode:
+-pwrkey: Specifies the subnode pwrkey and should follow the
+ qcom,pm8941-pwrkey.txt description.
+
+The rest of the properties should follow the generic reboot-mode description
+found in reboot-mode.txt
+
+Example:
+
+	pon@800 {
+		compatible = "qcom,pm8916-pon";
+
+		reg = <0x800>;
+		mode-bootloader = <0x2>;
+		mode-recovery = <0x1>;
+
+		pwrkey {
+			compatible = "qcom,pm8941-pwrkey";
+			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+			debounce = <15625>;
+			bias-pull-up;
+			linux,code = <KEY_POWER>;
+		};
+	};
-- 
2.14.4
