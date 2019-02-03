From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 09/17 v1] irqchip: ixp4xx: Add DT bindings
Date: Sun,  3 Feb 2019 22:41:57 +0100
Message-ID: <20190203214205.13594-10-linus.walleij@linaro.org>
References: <20190203214205.13594-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203214205.13594-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Tim Harvey <tharvey@gateworks.com>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the IXP4xx interrupt
controller. It's a standard 2-cell controller.

Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
irqchip maintainers: I am requesting an ACK for this once
you're happy with the bindings, as I intend to merge all of
this IXP4xx rework through ARM SoC.
---
 .../intel,ixp4xx-interrupt.txt                | 33 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
new file mode 100644
index 000000000000..70ee93b9a6c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
@@ -0,0 +1,33 @@
+* Intel IXP4xx XScale Networking Processors Interrupt Controller
+
+This interrupt controller is found in the Intel IXP4xx processors.
+Some processors have 32 interrupts, some have up to 64 interrupts.
+The exact number of interrupts is determined from the compatible
+string.
+
+The distinct IXP4xx families with different interrupt controller
+variations are IXP42x, IXP43x, IXP45x and IXP46x. Those four
+families were the only ones to reach the developer and consumer
+market.
+
+Required properties:
+- compatible: must be one of
+  "intel,ixp42x-interrupt"
+  "intel,ixp43x-interrupt"
+  "intel,ixp45x-interrupt"
+  "intel,ixp46x-interrupt"
+- reg: The register bank for the interrupt controller.
+- interrupt-controller: Identifies the node as an interrupt controller
+- #interrupt-cells: The number of cells to define the interrupts.
+  Must be <2>. The bindings follows the standard binding for controllers
+  with two cells specified in
+  interrupt-controller/interrupts.txt
+
+Example:
+
+intcon: interrupt-controller@c8003000 {
+	compatible = "intel,ixp43x-interrupt";
+	reg = <0xc8003000 0x100>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index a2fb67b75026..ec318f09540c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1650,6 +1650,7 @@ M:	Imre Kaloz <kaloz@openwrt.org>
 M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.txt
 F:	arch/arm/mach-ixp4xx/
 F:	drivers/clocksource/timer-ixp4xx.c
 F:	drivers/gpio/gpio-ixp4xx.c
-- 
2.20.1
