From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 3/3] dt-bindings: regulator: add regulator-fixed-clock binding
Date: Tue, 3 Sep 2019 08:03:49 +0000
Message-ID: <20190903080336.32288-4-philippe.schenker@toradex.com>
References: <20190903080336.32288-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903080336.32288-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>, Philippe Schenker <philippe.schenker@toradex.com>
List-Id: devicetree@vger.kernel.org

This adds the documentation to the compatible regulator-fixed-clock

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

 .../bindings/regulator/fixed-regulator.yaml    | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.ya=
ml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index a650b457085d..5fd081e80b43 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -19,9 +19,19 @@ description:
 allOf:
   - $ref: "regulator.yaml#"
=20
+select:
+  properties:
+    compatible:
+      contains:
+        const: regulator-fixed-clock
+  required:
+    - clocks
+
 properties:
   compatible:
-    const: regulator-fixed
+    items:
+      - const: regulator-fixed
+      - const: regulator-fixed-clock
=20
   regulator-name: true
=20
@@ -29,6 +39,12 @@ properties:
     description: gpio to use for enable control
     maxItems: 1
=20
+  clocks:
+    description:
+      clock to use for enable control. This binding is only available if
+      the compatible is chosen to regulator-fixed-clock. The clock binding
+      is mandatory if compatible is chosen to regulator-fixed-clock.
+
   startup-delay-us:
     description: startup time in microseconds
     $ref: /schemas/types.yaml#/definitions/uint32
--=20
2.23.0
