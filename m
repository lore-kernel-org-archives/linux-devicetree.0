From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/2] dt-bindings: soc: sprd: Add Spreadtrum MCDT documentation
Date: Fri, 19 Apr 2019 18:54:31 +0800
Message-ID: <f7edc4078b2d6f44ed5ad47c14dd58da5cc50f21.1555670768.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: broonie@kernel.org, orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for Spreadtrum multi-channel data transfer controller,
which is used for sound stream transmission between audio subsystem and
other AP/CP subsystems.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 .../devicetree/bindings/soc/sprd/sprd-mcdt.txt     |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sprd/sprd-mcdt.txt

diff --git a/Documentation/devicetree/bindings/soc/sprd/sprd-mcdt.txt b/Documentation/devicetree/bindings/soc/sprd/sprd-mcdt.txt
new file mode 100644
index 0000000..274ba0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sprd/sprd-mcdt.txt
@@ -0,0 +1,19 @@
+Spreadtrum Multi-Channel Data Transfer Binding
+
+The Multi-channel data transfer controller is used for sound stream
+transmission between audio subsystem and other AP/CP subsystem. It
+supports 10 DAC channel and 10 ADC channel, and each channel can be
+configured with DMA mode or interrupt mode.
+
+Required properties:
+- compatible: Should be "sprd,sc9860-mcdt".
+- reg: Should contain registers address and length.
+- interrupts: Should contain one interrupt shared by all channel.
+
+Example:
+
+mcdt@41490000 {
+	compatible = "sprd,sc9860-mcdt";
+	reg = <0 0x41490000 0 0x170>;
+	interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
1.7.9.5
