Return-Path: <SRS0=SxbK=JL=linaro.org=vinod.koul@kernel.org>
From: Vinod Koul <vinod.koul@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: power: reset: Add qcom pon binding
Date: Mon, 25 Jun 2018 12:08:36 +0530
Message-Id: <20180625063840.30173-2-vkoul@kernel.org>
In-Reply-To: <20180625063840.30173-1-vkoul@kernel.org>
References: <20180625063840.30173-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

The Power On driver for Qcom PM 8xxx is a MFD supporting pwrkey and
resin along with the Android reboot-mode.
Add the binding describing this.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/power/reset/qcom,pon.txt   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
new file mode 100644
index 000000000000..0dc24c9b93d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
@@ -0,0 +1,45 @@
+Qualcomm PON Driver
+
+The Power On driver for Qualcomm PM8xxx is MFD supporting pwrkey and
+resin along with the Android reboot-mode.
+
+This DT node has pwrkey and resin as sub nodes.
+
+Required Properties:
+-compatible: "qcom,pm8916-pon"
+-reg: Specifies the physical address of the pon register
+
+Optional subnodes:
+-prwrkey: Specifies the subnode pwrkey and should follow the
+ qcom,pm8xxx-pwrkey.txt description.
+-resin: Specifies the subnode resin and should follow the
+ qcom,pm8xxx-pwrkey.txt description.
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
+
+		resin {
+			compatible = "qcom,pm8941-resin";
+			interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+			debounce = <15625>;
+			bias-pull-up;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
-- 
2.14.4
