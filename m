From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 2/2] dt-bindings: Document the Synopsys GPIO via CREG bindings
Date: Tue, 28 Aug 2018 14:27:21 +0300
Message-ID: <20180828112721.28178-3-Eugeniy.Paltsev@synopsys.com>
References: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the Synopsys
GPIO via CREG driver.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 .../devicetree/bindings/gpio/snps,creg-gpio.txt    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
new file mode 100644
index 000000000000..eb022d44ccda
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
@@ -0,0 +1,49 @@
+GPIO via CREG (Control REGisers) driver
+
+This is is single-register MMIO GPIO driver to control such strangely mapped 
+outputs:
+
+31            11        8         7        5         0   < bit number
+|              |        |         |        |         |
+[   not used   | gpio-1 | shift-1 | gpio-0 | shift-0 ]   < 32 bit MMIO register
+                   ^                  ^
+                   |                  |
+                   |           write 0x2 == set output to "1" (on)
+                   |           write 0x3 == set output to "0" (off)
+                   |
+            write 0x1 == set output to "1" (on)
+            write 0x4 == set output to "0" (off)
+
+
+Required properties:
+- compatible : "snps,creg-gpio"
+- reg : Exactly one register range with length 0x4.
+- #gpio-cells : Should be one - the pin number.
+- gpio-controller : Marks the device node as a GPIO controller.
+- snps,ngpios: Number of GPIO pins.
+- snps,bit-per-line: Number of bits per each gpio line (see picture).
+  Array the size of "snps,ngpios"
+- snps,shift: Shift (in bits) of the each GPIO field from the previous one in
+  register (see picture). Array the size of "snps,ngpios"
+- snps,on-val: Value should be set in corresponding field to set
+  output to "1" (see picture). Array the size of "snps,ngpios"
+- snps,off-val: Value should be set in corresponding field to set
+  output to "0" (see picture). Array the size of "snps,ngpios"
+
+Optional properties:
+- snps,default-val: default output field values. Array the size of "snps,ngpios"
+
+Example (see picture):
+
+gpio: gpio@f00014b0 {
+	compatible = "snps,creg-gpio";
+	reg = <0xf00014b0 0x4>;
+	gpio-controller;
+	#gpio-cells = <1>;
+	snps,ngpios = <2>;
+	snps,shift = <5 1>;
+	snps,bit-per-line = <2 3>;
+	snps,on-val = <2 1>;
+	snps,off-val = <3 4>;
+	snps,default-val = <2 1>;
+};
-- 
2.14.4
