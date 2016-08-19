From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 4/8] gpio: dt-bindings: Add documentation for Aspeed GPIO controllers
Date: Fri, 19 Aug 2016 22:14:10 +0930
Message-ID: <20160819124414.24242-5-andrew@aj.id.au>
References: <20160819124414.24242-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819124414.24242-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Since v1:

Rob: I haven't added your Acked-by here as I've made the following changes and
wanted to get your input:

* Remove interrupt-controller as an optional property
* Defer to interrupt-controller bindings document for sub-node properties

I had a discussion with Joel about whether the interrupt-controller capability
should be optional and the conclusion was that it should always be configured
by the driver. This makes an optional interrupt-controller property feel
redundant (and possibly inaccurate if left out) so I've removed it.

 .../devicetree/bindings/gpio/gpio-aspeed.txt       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
new file mode 100644
index 000000000000..a5ad1eb93ce0
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -0,0 +1,34 @@
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
+
+- interrupt-parent      : The parent interrupt controller, optional if inherited
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
+		interrupts = <20>;
+		reg = <0x1e780000 0x1000>;
+	};
-- 
2.9.3
