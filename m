From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 2/8] syscon: dt-bindings: Add documentation for Aspeed system control units
Date: Tue, 30 Aug 2016 17:24:21 +0930
Message-ID: <20160830075427.11493-3-andrew@aj.id.au>
References: <20160830075427.11493-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160830075427.11493-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/mfd/aspeed-scu.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-scu.txt

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-scu.txt b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
new file mode 100644
index 000000000000..4fc5b83726d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aspeed-scu.txt
@@ -0,0 +1,18 @@
+The Aspeed System Control Unit manages the global behaviour of the SoC,
+configuring elements such as clocks, pinmux, and reset.
+
+Required properties:
+- compatible:	One of:
+		"aspeed,ast2400-scu", "syscon", "simple-mfd"
+		"aspeed,g4-scu", "syscon", "simple-mfd"
+		"aspeed,ast2500-scu", "syscon", "simple-mfd"
+		"aspeed,g5-scu", "syscon", "simple-mfd"
+
+- reg:		contains the offset and length of the SCU memory region
+
+Example:
+
+syscon: syscon@1e6e2000 {
+	compatible = "aspeed,ast2400-scu", "syscon", "simple-mfd";
+	reg = <0x1e6e2000 0x1a8>;
+};
-- 
2.9.3.1.g0db844e
