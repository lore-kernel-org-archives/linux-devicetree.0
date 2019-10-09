From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/8] dt-bindings: mfd: atmel,
 at91rm9200-tcb: add sama5d2 compatible
Date: Thu, 10 Oct 2019 00:40:00 +0200
Message-ID: <20191009224006.5021-3-alexandre.belloni@bootlin.com>
References: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191009224006.5021-1-alexandre.belloni@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The sama5d2 TC block TIMER_CLOCK1 is different from the at91sam9x5 one.
Instead of being MCK / 2, it is the TCB GCLK.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
Cc: Rob Herring <robh+dt@kernel.org>

 .../bindings/mfd/atmel,at91rm9200-tcb.yaml    | 36 +++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91rm9200-tcb.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91rm9200-tcb.yaml
index 4d9247fc0593..4fc5bd34d38b 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,at91rm9200-tcb.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,at91rm9200-tcb.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - atmel,at91rm9200-tcb
           - atmel,at91sam9x5-tcb
+          - atmel,sama5d2-tcb
       - const: simple-mfd
       - const: syscon
 
@@ -38,12 +39,6 @@ properties:
       t1_clk and t2_clk if a clock per channel is available.
     minItems: 2
     maxItems: 4
-    items:
-      enum:
-        - t0_clk
-        - t1_clk
-        - t2_clk
-        - slow_clk
 
   clocks:
     minItems: 2
@@ -55,6 +50,35 @@ properties:
   '#size-cells':
     const: 0
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,sama5d2-tcb
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: t0_clk
+            - const: gclk
+            - const: slow_clk
+    else:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 4
+        clock-names:
+          items:
+            enum:
+              - t0_clk
+              - t1_clk
+              - t2_clk
+              - slow_clk
+
 required:
   - compatible
   - reg
-- 
2.21.0
