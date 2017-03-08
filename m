From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH 1/2] gpio: mmio: add support for NI 169445 NAND GPIO
Date: Wed, 8 Mar 2017 13:35:43 -0600
Message-ID: <1489001744-26545-2-git-send-email-nathan.sullivan@ni.com>
References: <1489001744-26545-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1489001744-26545-1-git-send-email-nathan.sullivan@ni.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, Nathan Sullivan <nathan.sullivan@ni.com>
List-Id: devicetree@vger.kernel.org

The GPIO-based NAND controller on National Instruments 169445 hardware
exposes a set of simple lines for the control signals.

Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
---
 .../bindings/gpio/ni,169445-nand-gpio.txt          | 36 ++++++++++++++++++++++
 drivers/gpio/gpio-mmio.c                           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
new file mode 100644
index 0000000..ca2c14f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
@@ -0,0 +1,36 @@
+Bindings for the National Instruments 169445 GPIO NAND controller
+
+The 169445 GPIO NAND controller has two memory mapped GPIO registers, one
+for input (the ready signal) and one for output (control signals).  It is
+intended to be used with the GPIO NAND driver.
+
+Required properties:
+	- compatible: should be "ni,169445-nand-gpio"
+	- reg-names: must contain
+		"dat" - data register
+	- reg: address + size pairs describing the GPIO register sets;
+		order must correspond with the order of entries in reg-names
+	- #gpio-cells: must be set to 2. The first cell is the pin number and
+			the second cell is used to specify the gpio polarity:
+			0 = active high
+			1 = active low
+	- gpio-controller: Marks the device node as a gpio controller.
+
+Examples:
+	gpio1: nand-gpio-out@1f300010 {
+		compatible = "ni,169445-nand-gpio";
+		reg = <0x1f300010 0x4>;
+		reg-names = "dat";
+		gpio-controller;
+		#gpio-cells = <2>;
+		ngpios = <5>;
+	};
+
+	gpio2: nand-gpio-in@1f300014 {
+		compatible = "ni,169445-nand-gpio";
+		reg = <0x1f300014 0x4>;
+		reg-names = "dat";
+		gpio-controller;
+		#gpio-cells = <2>;
+		ngpios = <1>;
+	};
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index d7d03ad..f7da40e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -575,6 +575,7 @@ static void __iomem *bgpio_map(struct platform_device *pdev,
 static const struct of_device_id bgpio_of_match[] = {
 	{ .compatible = "brcm,bcm6345-gpio" },
 	{ .compatible = "wd,mbl-gpio" },
+	{ .compatible = "ni,169445-nand-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);
-- 
2.1.4
