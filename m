From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 05/12] gpio: dt-bindings: Add documentation for Aspeed GPIO
 controllers
Date: Wed, 20 Jul 2016 15:28:26 +0930
Message-ID: <1468994313-13538-6-git-send-email-andrew@aj.id.au>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/gpio/gpio-aspeed.txt       | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
new file mode 100644
index 000000000000..1954b288cd49
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -0,0 +1,42 @@
+Aspeed GPIO controller Device Tree Bindings
+-------------------------------------------
+
+Required properties:
+- #gpio-cells 		: Should be two
+			  - First cell is the GPIO line number
+			  - Second cell is used to specify optional
+			    parameters (unused)
+
+- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+
+- reg			: Address and length of the register set for the device
+- gpio-controller	: Marks the device node as a GPIO controller.
+- interrupts		: Interrupt specifier (see interrupt bindings for
+			  details)
+
+Optional properties:
+- interrupt-controller	: Marks the device node as an interrupt controller.
+- interrupt-parent	: The parent interrupt controller, optional if inherited
+- #interrupt-cells 	: Should be 2.  The first cell is the GPIO number.
+			  The second cell bits[3:0] is used to specify trigger
+			  type and level flags:
+			      1 = low-to-high edge triggered.
+			      2 = high-to-low edge triggered.
+			      4 = active high level-sensitive.
+			      8 = active low level-sensitive.
+
+The gpio and interrupt properties are further described in their respective
+bindings documentation:
+
+- Documentation/devicetree/bindings/gpio/gpio.txt
+- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+
+  Example:
+	gpio@1e780000 {
+		#gpio-cells = <2>;
+		compatible = "aspeed,ast2400-gpio"
+		gpio-controller;
+		interrupt-parent = <&intc>;
+		interrupts = <20>;
+		reg = <0x1e780000 0x1000>;
+	};
-- 
2.7.4
