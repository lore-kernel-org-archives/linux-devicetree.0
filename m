From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 2/7] irqchip: atmel-aic: move binding doc to
 interrupt-controller directory
Date: Fri, 20 Jun 2014 17:01:22 +0200
Message-ID: <1403276487-8792-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris BREZILLON <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Move atmel aic driver doc to the interrupt-controller directory as the new
driver now lays in drivers/irqchip/atmel-aic.c.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/arm/atmel-aic.txt          | 42 ----------------------
 .../bindings/interrupt-controller/atmel,aic.txt    | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/atmel-aic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt

diff --git a/Documentation/devicetree/bindings/arm/atmel-aic.txt b/Documentation/devicetree/bindings/arm/atmel-aic.txt
deleted file mode 100644
index 2742e9c..0000000
--- a/Documentation/devicetree/bindings/arm/atmel-aic.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* Advanced Interrupt Controller (AIC)
-
-Required properties:
-- compatible: Should be "atmel,<chip>-aic"
-  <chip> can be "at91rm9200" or "sama5d3"
-- interrupt-controller: Identifies the node as an interrupt controller.
-- interrupt-parent: For single AIC system, it is an empty property.
-- #interrupt-cells: The number of cells to define the interrupts. It should be 3.
-  The first cell is the IRQ number (aka "Peripheral IDentifier" on datasheet).
-  The second cell is used to specify flags:
-    bits[3:0] trigger type and level flags:
-      1 = low-to-high edge triggered.
-      2 = high-to-low edge triggered.
-      4 = active high level-sensitive.
-      8 = active low level-sensitive.
-      Valid combinations are 1, 2, 3, 4, 8.
-      Default flag for internal sources should be set to 4 (active high).
-  The third cell is used to specify the irq priority from 0 (lowest) to 7
-  (highest).
-- reg: Should contain AIC registers location and length
-- atmel,external-irqs: u32 array of external irqs.
-
-Examples:
-	/*
-	 * AIC
-	 */
-	aic: interrupt-controller@fffff000 {
-		compatible = "atmel,at91rm9200-aic";
-		interrupt-controller;
-		interrupt-parent;
-		#interrupt-cells = <3>;
-		reg = <0xfffff000 0x200>;
-	};
-
-	/*
-	 * An interrupt generating device that is wired to an AIC.
-	 */
-	dma: dma-controller@ffffec00 {
-		compatible = "atmel,at91sam9g45-dma";
-		reg = <0xffffec00 0x200>;
-		interrupts = <21 4 5>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
new file mode 100644
index 0000000..2742e9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
@@ -0,0 +1,42 @@
+* Advanced Interrupt Controller (AIC)
+
+Required properties:
+- compatible: Should be "atmel,<chip>-aic"
+  <chip> can be "at91rm9200" or "sama5d3"
+- interrupt-controller: Identifies the node as an interrupt controller.
+- interrupt-parent: For single AIC system, it is an empty property.
+- #interrupt-cells: The number of cells to define the interrupts. It should be 3.
+  The first cell is the IRQ number (aka "Peripheral IDentifier" on datasheet).
+  The second cell is used to specify flags:
+    bits[3:0] trigger type and level flags:
+      1 = low-to-high edge triggered.
+      2 = high-to-low edge triggered.
+      4 = active high level-sensitive.
+      8 = active low level-sensitive.
+      Valid combinations are 1, 2, 3, 4, 8.
+      Default flag for internal sources should be set to 4 (active high).
+  The third cell is used to specify the irq priority from 0 (lowest) to 7
+  (highest).
+- reg: Should contain AIC registers location and length
+- atmel,external-irqs: u32 array of external irqs.
+
+Examples:
+	/*
+	 * AIC
+	 */
+	aic: interrupt-controller@fffff000 {
+		compatible = "atmel,at91rm9200-aic";
+		interrupt-controller;
+		interrupt-parent;
+		#interrupt-cells = <3>;
+		reg = <0xfffff000 0x200>;
+	};
+
+	/*
+	 * An interrupt generating device that is wired to an AIC.
+	 */
+	dma: dma-controller@ffffec00 {
+		compatible = "atmel,at91sam9g45-dma";
+		reg = <0xffffec00 0x200>;
+		interrupts = <21 4 5>;
+	};
-- 
1.8.3.2
