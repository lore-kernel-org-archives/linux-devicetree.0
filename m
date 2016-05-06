From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v7 1/3] gpio: dt-bindings: add wd,mbl-gpio bindings
Date: Fri,  6 May 2016 13:10:19 +0200
Message-ID: <9bc9349d6e13d81c6200b0cd8fa20c76263043f6.1462372360.git.chunkeey@googlemail.com>
References: <cover.1462372360.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1462372360.git.chunkeey@googlemail.com>
In-Reply-To: <cover.1462372360.git.chunkeey@googlemail.com>
References: <cover.1462372360.git.chunkeey@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Christian Lamparter <chunkeey@googlemail.com>
List-Id: devicetree@vger.kernel.org

This patch adds the device tree bindings for the Western Digital's
MyBook Live memory-mapped GPIO controllers.

The gpios will be supported by gpio-mmio code of the
GPIO generic library.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 .../devicetree/bindings/gpio/wd,mbl-gpio.txt       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
new file mode 100644
index 0000000..038c3a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
@@ -0,0 +1,38 @@
+Bindings for the Western Digital's MyBook Live memory-mapped GPIO controllers.
+
+The Western Digital MyBook Live has two memory-mapped GPIO controllers.
+Both GPIO controller only have a single 8-bit data register, where GPIO
+state can be read and/or written.
+
+Required properties:
+	- compatible: should be "wd,mbl-gpio"
+	- reg-names: must contain
+		"dat" - data register
+	- reg: address + size pairs describing the GPIO register sets;
+		order must correspond with the order of entries in reg-names
+	- #gpio-cells: must be set to 2. The first cell is the pin number and
+			the second cell is used to specify the GPIO polarity:
+			0 = active high
+			1 = active low
+	- gpio-controller: marks the device node as a GPIO controller.
+
+Optional properties:
+	- no-output: GPIOs are read-only.
+
+Examples:
+	GPIO0: gpio0@e0000000 {
+		compatible = "wd,mbl-gpio";
+		reg-names = "dat";
+		reg = <0xe0000000 0x1>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	GPIO1: gpio1@e0100000 {
+		compatible = "wd,mbl-gpio";
+		reg-names = "dat";
+		reg = <0xe0100000 0x1>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		no-output;
+	};
-- 
2.8.1
