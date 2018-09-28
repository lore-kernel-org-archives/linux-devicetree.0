From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v4 2/2] dt-bindings: Document the Synopsys GPIO via CREG bindings
Date: Fri, 28 Sep 2018 16:15:31 +0300
Message-ID: <20180928131531.4598-2-Eugeniy.Paltsev@synopsys.com>
References: <20180928131531.4598-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928131531.4598-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <vineet.gupta1@synopsys.com>, Alexey Brodkin <alexey.brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the Synopsys
GPIO via CREG driver.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v3->v4:
 * Fix #gpio-cells description as driver is used generic GPIO binding.

Chnages v2->v3:
 * None.

 .../devicetree/bindings/gpio/snps,creg-gpio.txt     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
new file mode 100644
index 000000000000..1b30812b015b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
@@ -0,0 +1,21 @@
+Synopsys GPIO via CREG (Control REGisters) driver
+
+Required properties:
+- compatible : "snps,creg-gpio-hsdk" or "snps,creg-gpio-axs10x".
+- reg : Exactly one register range with length 0x4.
+- #gpio-cells : Since the generic GPIO binding is used, the
+  amount of cells must be specified as 2. The first cell is the
+  pin number, the second cell is used to specify optional parameters:
+  See "gpio-specifier" in .../devicetree/bindings/gpio/gpio.txt.
+- gpio-controller : Marks the device node as a GPIO controller.
+- ngpios: Number of GPIO pins.
+
+Example:
+
+gpio: gpio@f00014b0 {
+	compatible = "snps,creg-gpio-hsdk";
+	reg = <0xf00014b0 0x4>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	ngpios = <2>;
+};
-- 
2.14.4
