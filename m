From: Huang Shijie <b32955@freescale.com>
Subject: [PATCH v2 6/8] Documentation: add the binding file for Quadspi driver
Date: Mon, 26 Aug 2013 12:41:40 +0800
Message-ID: <1377492102-23543-7-git-send-email-b32955@freescale.com>
References: <1377492102-23543-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1377492102-23543-1-git-send-email-b32955@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@kernel.org
Cc: dwmw2@infradead.org, dedekind1@gmail.com, computersforpeace@gmail.com, shawn.guo@linaro.org, kernel@pengutronix.de, b18965@freescale.com, b44548@freescale.com, B20596@freescale.com, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Huang Shijie <b32955@freescale.com>
List-Id: devicetree@vger.kernel.org

This patch adds the binding file for Freescale Quadspi driver.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 .../devicetree/bindings/spi/fsl-quadspi.txt        |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/fsl-quadspi.txt

diff --git a/Documentation/devicetree/bindings/spi/fsl-quadspi.txt b/Documentation/devicetree/bindings/spi/fsl-quadspi.txt
new file mode 100644
index 0000000..ea834e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/fsl-quadspi.txt
@@ -0,0 +1,32 @@
+* Freescale Quad Serial Peripheral Interface(QuadSPI)
+
+Required properties:
+- compatible : Should be "fsl,vf610-qspi"
+- reg : Offset and length of the register set for the device
+- interrupts : Should contain the interrupt for the device
+- clocks : The clocks needed by the QuadSPI controller
+- clock-names : the name of the clocks
+- fsl,spi-num-chipselects : Contains the number of the chipselect
+
+Optional properties:
+- fsl,nor-size : If You set this property, it means that you connect the NOR
+                 flash to QuadSPI. This property is mainly used by the QuadSPI
+                 to map an AHB bus accessible address.
+
+Example:
+
+qspi0: quadspi@40044000 {
+	compatible = "fsl,vf610-qspi";
+	reg = <0x40044000 0x1000>;
+	interrupts = <0 24 0x04>;
+	clocks = <&clks VF610_CLK_QSPI0_EN>,
+		<&clks VF610_CLK_QSPI0>;
+	clock-names = "qspi_en", "qspi";
+	fsl,nor-size = <0x1000000>;
+	fsl,spi-num-chipselects = <1>;
+	status = "disabled";
+
+	flash0: s25fl128s@0 {
+		....
+	};
+};
-- 
1.7.1


