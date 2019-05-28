From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v2 05/11] dt-bindings: rtc: sun6i: Add the R40 RTC compatible
Date: Tue, 28 May 2019 22:30:35 +0200
Message-ID: <543acf9aa96a6ef384fe99913335532e9730547e.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The R40 has a pretty different RTC compared to the other SoCs we've
encountered so far, the most important difference being that it now has
only a single interrupt, compared to the previous SoCs having two.

Let's add a compatible for that.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f154bbba6a69..924622f39c44 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,9 +19,7 @@ properties:
       - const: allwinner,sun6i-a31-rtc
       - const: allwinner,sun8i-a23-rtc
       - const: allwinner,sun8i-h3-rtc
-      - items:
-          - const: allwinner,sun8i-r40-rtc
-          - const: allwinner,sun8i-h3-rtc
+      - const: allwinner,sun8i-r40-rtc
       - const: allwinner,sun8i-v3-rtc
       - const: allwinner,sun50i-h5-rtc
       - items:
@@ -32,6 +30,8 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 1
+    maxItems: 2
     items:
       - description: RTC Alarm 0
       - description: RTC Alarm 1
@@ -69,6 +69,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
     then:
@@ -91,6 +92,24 @@ allOf:
           minItems: 3
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun8i-r40-rtc
+
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+    else:
+      properties:
+        interrupts:
+          minItems: 2
+          maxItems: 2
+
 required:
   - "#clock-cells"
   - compatible
-- 
git-series 0.9.1
