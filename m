Return-Path: <SRS0=XOdB=F7=vanguardiasur.com.ar=ezequiel@kernel.org>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 06/14] mmc: dt-bindings: add MMC support to JZ4740 SoC
Date: Fri,  9 Mar 2018 12:12:11 -0300
Message-Id: <20180309151219.18723-7-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <20180309151219.18723-1-ezequiel@vanguardiasur.com.ar>
References: <20180309151219.18723-1-ezequiel@vanguardiasur.com.ar>
To: Ulf Hansson <ulf.hansson@linaro.org>, Paul Cercueil <paul@crapouillou.net>
Cc: linux-mmc@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add the devicetree binding for JZ4740/JZ4780 SoC.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 Documentation/devicetree/bindings/mmc/jz4740.txt | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/jz4740.txt

diff --git a/Documentation/devicetree/bindings/mmc/jz4740.txt b/Documentation/devicetree/bindings/mmc/jz4740.txt
new file mode 100644
index 000000000000..7cd8c432d7c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/jz4740.txt
@@ -0,0 +1,38 @@
+* Ingenic JZ47xx MMC controllers
+
+This file documents the device tree properties used for the MMC controller in
+Ingenic JZ4740/JZ4780 SoCs. These are in addition to the core MMC properties
+described in mmc.txt.
+
+Required properties:
+- compatible: Should be one of the following:
+  - "ingenic,jz4740-mmc" for the JZ4740
+  - "ingenic,jz4780-mmc" for the JZ4780
+- reg: Should contain the MMC controller registers location and length.
+- interrupts: Should contain the interrupt specifier of the MMC controller.
+- clocks: Clock for the MMC controller.
+
+Optional properties:
+- dmas: List of DMA specifiers with the controller specific format
+        as described in the generic DMA client binding. A tx and rx
+        specifier is required.
+- dma-names: RX and TX  DMA request names.
+        Should be "rx" and "tx", in that order.
+
+For additional details on DMA client bindings see ../dma/dma.txt.
+
+Example:
+
+mmc0: mmc@13450000 {
+	compatible = "ingenic,jz4780-mmc";
+	reg = <0x13450000 0x1000>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <37>;
+
+	clocks = <&cgu JZ4780_CLK_MSC0>;
+	clock-names = "mmc";
+
+	dmas = <&dma JZ4780_DMA_MSC0_RX 0xffffffff>, <&dma JZ4780_DMA_MSC0_TX 0xffffffff>;
+	dma-names = "rx", "tx";
+};
-- 
2.16.2
