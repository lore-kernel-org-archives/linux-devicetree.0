Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date: Mon,  6 Aug 2018 16:34:15 +0530
Message-Id: <20180806110416.4288-2-vkoul@kernel.org>
In-Reply-To: <20180806110416.4288-1-vkoul@kernel.org>
References: <20180806110416.4288-1-vkoul@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Todor Tomov <todor.tomov@linaro.org>

Add DT binding document for Qualcomm Camera Control Interface (CCI)
I2C controller.

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
new file mode 100644
index 000000000000..977978dd4444
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -0,0 +1,55 @@
+Qualcomm Camera Control Interface (CCI) I2C controller
+
+Required properties:
+ - compatible: Should be one of:
+   - "qcom,cci-v1.0.8" for 8916;
+   - "qcom,cci-v1.4.0" for 8996.
+ - #address-cells: Should be <1>.
+ - #size-cells: Should be <0>.
+ - reg: Base address of the I2C controller and length of memory mapped region.
+ - interrupts: Specifier for CCI I2C interrupt.
+ - clocks: List of clock specifiers, one for each entry in clock-names.
+ - clock-names: Should contain:
+   - "mmss_mmagic_ahb" - on qcom,cci-v1.4.0 only;
+   - "camss_top_ahb";
+   - "cci_ahb";
+   - "cci";
+   - "camss_ahb".
+
+Required subnodes:
+ - i2c-bus instances:
+	 Mandatory i2c-bus0 subnode
+	 Mandatory i2c-bus1 for qcom,cci-v1.4.0
+ - Optional properties:
+	- clock-frequency: Desired I2C bus clock frequency
+	  in Hz, defaults to 100 kHz if omitted.
+
+Required properties on qcom,cci-v1.4.0:
+ - power-domains: Power domain specifier.
+
+Example:
+
+                cci@a0c000 {
+                        compatible = "qcom,cci-v1.4.0";
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        reg = <0xa0c000 0x1000>;
+                        interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
+                        power-domains = <&mmcc CAMSS_GDSC>;
+                        clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
+                                        <&mmcc CAMSS_TOP_AHB_CLK>,
+                                        <&mmcc CAMSS_CCI_AHB_CLK>,
+                                        <&mmcc CAMSS_CCI_CLK>,
+                                        <&mmcc CAMSS_AHB_CLK>;
+                        clock-names = "mmss_mmagic_ahb",
+                                        "camss_top_ahb",
+                                        "cci_ahb",
+                                        "cci",
+                                        "camss_ahb";
+			i2c-bus0 {
+	                        clock-frequency = <400000>;
+			};
+			i2c-bus1 {
+				clock-frequency = <400000>;
+			};
+                };
-- 
2.14.4
