From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings: document gpio-mt7621 bindings
Date: Thu,  5 Jul 2018 15:43:11 +0200
Message-ID: <1530798191-25471-3-git-send-email-sergio.paracuellos@gmail.com>
References: <1530798191-25471-1-git-send-email-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1530798191-25471-1-git-send-email-sergio.paracuellos@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, neil@brown.name
List-Id: devicetree@vger.kernel.org

Add a devicetree binding documentation for the mt7621 gpio.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Reviewed-by: NeilBrown <neil@brown.name>
---
 .../bindings/gpio/mediatek,mt7621-gpio.txt         | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
new file mode 100644
index 0000000..ba45558
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
@@ -0,0 +1,35 @@
+Mediatek MT7621 SoC GPIO controller bindings
+
+The IP core used inside these SoCs has 3 banks of 32 GPIOs each.
+The registers of all the banks are interwoven inside one single IO range.
+We load one GPIO controller instance per bank. Also the GPIO controller can receive
+interrupts on any of the GPIOs, either edge or level. It then interrupts the CPU
+using GIC INT12.
+
+Required properties for the top level node:
+- #gpio-cells : Should be two. The first cell is the GPIO pin number and the
+   second cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
+   Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
+- #interrupt-cells : Specifies the number of cells needed to encode an
+   interrupt. Should be 2. The first cell defines the interrupt number,
+   the second encodes the triger flags encoded as described in
+   Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+- compatible:
+  - "mediatek,mt7621-gpio" for Mediatek controllers
+- reg : Physical base address and length of the controller's registers
+- interrupt-parent : phandle of the parent interrupt controller.
+- interrupts : Interrupt specifier for the controllers interrupt.
+- interrupt-controller : Mark the device node as an interrupt controller.
+- gpio-controller : Marks the device node as a GPIO controller.
+
+Example:
+	gpio@600 {
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		compatible = "mediatek,mt7621-gpio";
+		gpio-controller;
+		interrupt-controller;
+		reg = <0x600 0x100>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.7.4
