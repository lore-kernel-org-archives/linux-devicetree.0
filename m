From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 13/30 v2] gpio: ixp4xx: Add DT bindings
Date: Thu, 21 Feb 2019 16:44:41 +0100
Message-ID: <20190221154458.23763-14-linus.walleij@linaro.org>
References: <20190221154458.23763-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190221154458.23763-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

This adds DT bindings for the IXP4xx GPIO controller.

Cc: devicetree@vger.kernel.org
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collect Bartosz and Rob's review tags.
---
 .../bindings/gpio/intel,ixp4xx-gpio.txt       | 38 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt b/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
new file mode 100644
index 000000000000..8dc41ed99685
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
@@ -0,0 +1,38 @@
+Intel IXP4xx XScale Networking Processors GPIO
+
+This GPIO controller is found in the Intel IXP4xx processors.
+It supports 16 GPIO lines.
+
+The interrupt portions of the GPIO controller is hierarchical:
+the synchronous edge detector is part of the GPIO block, but the
+actual enabling/disabling of the interrupt line is done in the
+main IXP4xx interrupt controller which has a 1:1 mapping for
+the first 12 GPIO lines to 12 system interrupts.
+
+The remaining 4 GPIO lines can not be used for receiving
+interrupts.
+
+The interrupt parent of this GPIO controller must be the
+IXP4xx interrupt controller.
+
+Required properties:
+
+- compatible : Should be
+  "intel,ixp4xx-gpio"
+- reg : Should contain registers location and length
+- gpio-controller : marks this as a GPIO controller
+- #gpio-cells : Should be 2, see gpio/gpio.txt
+- interrupt-controller : marks this as an interrupt controller
+- #interrupt-cells : a standard two-cell interrupt, see
+  interrupt-controller/interrupts.txt
+
+Example:
+
+gpio0: gpio@c8004000 {
+	compatible = "intel,ixp4xx-gpio";
+	reg = <0xc8004000 0x1000>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index bd04142b1026..b44ee076d57c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1650,6 +1650,7 @@ M:	Imre Kaloz <kaloz@openwrt.org>
 M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
 F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
 F:	arch/arm/mach-ixp4xx/
-- 
2.20.1
