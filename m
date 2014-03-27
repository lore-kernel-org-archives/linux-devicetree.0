From: Harini Katakam <harinik@xilinx.com>
Subject: [PATCH 2/2] Devicetree: Add Zynq GPIO devicetree bindings documentation
Date: Thu, 27 Mar 2014 20:55:06 +0530
Message-ID: <1395933906-2268-2-git-send-email-harinik@xilinx.com>
References: <1395933906-2268-1-git-send-email-harinik@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395933906-2268-1-git-send-email-harinik@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, grant.likely@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, michals@xilinx.com, Harini Katakam <harinik@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add gpio-zynq bindings documentation.

Signed-off-by: Harini Katakam <harinik@xilinx.com>
---
 .../devicetree/bindings/gpio/gpio-zynq.txt         |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-zynq.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
new file mode 100644
index 0000000..1b6e83f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
@@ -0,0 +1,24 @@
+Xilinx Zynq GPIO controller Device Tree Bindings
+-------------------------------------------
+
+Required properties:
+- #gpio-cells 		: Should be two. First cell is used to mention
+			  pin number.
+- compatible		: Should be "xlnx,zynq-gpio-1.0"
+- clocks		: Clock phandles (see clock bindings for details)
+- gpio-controller	: Marks the device node as a GPIO controller.
+- interrupts		: Property with a value describing the interrupt
+			  number.
+- interrupt-parent	: Must be core interrupt controller
+- reg			: Address and length of the register set for the device
+
+Example:
+		gpio@e000a000 {
+			#gpio-cells = <2>;
+			compatible = "xlnx,zynq-gpio-1.0";
+			clocks = <&clkc 42>;
+			gpio-controller ;
+			interrupt-parent = <&intc>;
+			interrupts = <0 20 4>;
+			reg = <0xe000a000 0x1000>;
+		} ;
-- 
1.7.9.5
