From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 02/11] dt-bindings: timer: Add missing compatibles
Date: Mon, 22 Jul 2019 10:12:20 +0200
Message-ID: <20190722081229.22422-2-maxime.ripard@bootlin.com>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722081229.22422-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Newer Allwinner SoCs have different number of interrupts, let's add
different compatibles for all of them to deal with this properly.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../timer/allwinner,sun4i-a10-timer.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
index 7292a424092c..20adc1c8e9cc 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml
@@ -14,6 +14,8 @@ properties:
   compatible:
     enum:
       - allwinner,sun4i-a10-timer
+      - allwinner,sun8i-a23-timer
+      - allwinner,sun8i-v3s-timer
       - allwinner,suniv-f1c100s-timer
 
   reg:
@@ -39,6 +41,30 @@ allOf:
           minItems: 6
           maxItems: 6
 
+  - if:
+      properties:
+        compatible:
+          items:
+            const: allwinner,sun8i-a23-timer
+
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          items:
+            const: allwinner,sun8i-v3s-timer
+
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 3
+
   - if:
       properties:
         compatible:
-- 
2.21.0
