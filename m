From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH] dt-bindings: fixed-regulator: fix compatible enum
Date: Mon, 23 Sep 2019 08:18:49 +0000
Message-ID: <20190923081840.23391-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>, Philippe Schenker <philippe.schenker@toradex.com>
List-Id: devicetree@vger.kernel.org

Remove 'const:' in the compatible enum. This was breaking
make dt_binding_check since it has more than one compatible string.

Fixes: 9c86d003d620 ("dt-bindings: regulator: add regulator-fixed-clock bin=
ding")
Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

---

 .../devicetree/bindings/regulator/fixed-regulator.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.ya=
ml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index a78150c47aa2..f32416968197 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -30,8 +30,8 @@ if:
 properties:
   compatible:
     enum:
-      - const: regulator-fixed
-      - const: regulator-fixed-clock
+      - regulator-fixed
+      - regulator-fixed-clock
=20
   regulator-name: true
=20
--=20
2.23.0
