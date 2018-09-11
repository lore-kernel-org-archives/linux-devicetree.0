From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v3 2/2] dt-bindings: Document the Synopsys GPIO via CREG bindings
Date: Tue, 11 Sep 2018 18:09:25 +0300
Message-ID: <20180911150925.19460-3-Eugeniy.Paltsev@synopsys.com>
References: <20180911150925.19460-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911150925.19460-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

This patch adds documentation of device tree bindings for the Synopsys
GPIO via CREG driver.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 .../devicetree/bindings/gpio/snps,creg-gpio.txt        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
new file mode 100644
index 000000000000..11aba2f34066
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
@@ -0,0 +1,18 @@
+Synopsys GPIO via CREG (Control REGisters) driver
+
+Required properties:
+- compatible : "snps,creg-gpio-hsdk" or "snps,creg-gpio-axs10x".
+- reg : Exactly one register range with length 0x4.
+- #gpio-cells : Should be one - the pin number.
+- gpio-controller : Marks the device node as a GPIO controller.
+- ngpios : Number of GPIO pins.
+
+Example:
+
+gpio: gpio@f00014b0 {
+	compatible = "snps,creg-gpio-hsdk";
+	reg = <0xf00014b0 0x4>;
+	gpio-controller;
+	#gpio-cells = <1>;
+	ngpios = <2>;
+};
-- 
2.14.4
