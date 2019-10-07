From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 3/3] dt-bindings: regulator: Fix yaml verification for fixed-regulator schema
Date: Mon, 7 Oct 2019 12:25:52 +0200
Message-ID: <20191007102552.19808-4-alexandre.torgue@st.com>
References: <20191007102552.19808-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007102552.19808-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Alexandru Ardelean <alexaundru.ardelean@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-media@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This commit fixes an issue seen during yaml check ("make dt_binding_check").
Compatible didn't seem to be seen as a string.

Reported issue:
"properties:compatible:enum:0: {'const': 'regulator-fixed'}
is not of type 'string'"
And
"properties:compatible:enum:1: {'const': 'regulator-fixed-clock'}
is not of type 'string'"

Fixes: 9c86d003d620 ("dt-bindings: regulator: add regulator-fixed-clock binding")
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index a78150c47aa2..7725cedf1538 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -22,16 +22,20 @@ allOf:
 if:
   properties:
     compatible:
+      allOf:
+        - $ref: "/schemas/types.yaml#/definitions/string"
       contains:
-        const: regulator-fixed-clock
+        const: "regulator-fixed-clock"
   required:
     - clocks
 
 properties:
   compatible:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/string"
     enum:
-      - const: regulator-fixed
-      - const: regulator-fixed-clock
+      - "regulator-fixed"
+      - "regulator-fixed-clock"
 
   regulator-name: true
 
-- 
2.17.1
