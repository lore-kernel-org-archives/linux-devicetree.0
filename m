From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: arm: remove PMC bindings
Date: Thu,  7 Jun 2018 10:41:04 +0200
Message-ID: <20180607084107.4461-2-alexandre.belloni@bootlin.com>
References: <20180607084107.4461-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180607084107.4461-1-alexandre.belloni@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The PMC bindings are fully described in
Documentation/devicetree/bindings/clock/at91-clock.txt. Remove the
duplicate and incomplete documentation.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../devicetree/bindings/arm/atmel-pmc.txt          | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/atmel-pmc.txt

diff --git a/Documentation/devicetree/bindings/arm/atmel-pmc.txt b/Documentation/devicetree/bindings/arm/atmel-pmc.txt
deleted file mode 100644
index 795cc78543fe..000000000000
--- a/Documentation/devicetree/bindings/arm/atmel-pmc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* Power Management Controller (PMC)
-
-Required properties:
-- compatible: Should be "atmel,<chip>-pmc".
-	<chip> can be: at91rm9200, at91sam9260, at91sam9g45, at91sam9n12,
-	at91sam9x5, sama5d3
-
-- reg: Should contain PMC registers location and length
-
-Examples:
-	pmc: pmc@fffffc00 {
-		compatible = "atmel,at91rm9200-pmc";
-		reg = <0xfffffc00 0x100>;
-	};
-- 
2.17.1
