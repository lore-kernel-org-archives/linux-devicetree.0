Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/2] dt-bindings: i2c: Add binding document for Qualcomm CCI
Date: Tue, 10 Jul 2018 18:14:42 +0530
Message-Id: <20180710124443.24932-1-vkoul@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Todor Tomov <todor.tomov@linaro.org>

Add DT binding document for Qualcomm Camera Control Interface device

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
new file mode 100644
index 000000000000..cb1fe158fba3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -0,0 +1,46 @@
+Qualcomm Camera Control Interface controller
+
+Required properties:
+ - compatible: Should be one of:
+   - "qcom,cci-v1.0.8" for 8916;
+   - "qcom,cci-v1.4.0" for 8996.
+ - #address-cells: Should be <1>.
+ - #size-cells: Should be <0>.
+ - reg: Base address of the controller and length of memory mapped region.
+ - interrupts: Specifier for CCI interrupt.
+ - clocks: List of clock specifiers, one for each entry in clock-names.
+ - clock-names: Should contain:
+   - "mmss_mmagic_ahb" - on 8996 only;
+   - "camss_top_ahb";
+   - "cci_ahb";
+   - "cci";
+   - "camss_ahb".
+
+Required properties on 8996:
+ - power-domains: Power domain specifier.
+
+Optional:
+ - clock-frequency: Desired I2C bus clock frequency in Hz, defaults to 100 kHz
+   if omitted.
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
+                        clock-frequency = <400000>;
+                };
-- 
2.14.4
