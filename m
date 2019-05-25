From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 4/5] ARM: dts: sun7i: icnova-swac: Fix the model vendor
Date: Sat, 25 May 2019 15:41:39 +0200
Message-ID: <20190525134140.6220-4-maxime.ripard@bootlin.com>
References: <20190525134140.6220-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190525134140.6220-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Even though the SWAC is just a baseboard to the icnova SoM, the vendor of
the baseboard somehow ended up with the board name instead of the vendor
name. Fix that.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 2 +-
 arch/arm/boot/dts/sun7i-a20-icnova-swac.dts      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 285f4fc8519d..000a00d12d6a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -263,7 +263,7 @@ properties:
 
       - description: ICNova A20 SWAC
         items:
-          - const: swac,icnova-a20-swac
+          - const: incircuit,icnova-a20-swac
           - const: incircuit,icnova-a20
           - const: allwinner,sun7i-a20
 
diff --git a/arch/arm/boot/dts/sun7i-a20-icnova-swac.dts b/arch/arm/boot/dts/sun7i-a20-icnova-swac.dts
index 949494730aee..7449aac3f43b 100644
--- a/arch/arm/boot/dts/sun7i-a20-icnova-swac.dts
+++ b/arch/arm/boot/dts/sun7i-a20-icnova-swac.dts
@@ -49,7 +49,8 @@
 
 / {
 	model = "ICnova-A20 SWAC";
-	compatible = "swac,icnova-a20-swac", "incircuit,icnova-a20", "allwinner,sun7i-a20";
+	compatible = "incircuit,icnova-a20-swac", "incircuit,icnova-a20",
+		     "allwinner,sun7i-a20";
 
 	aliases {
 		serial0 = &uart0;
-- 
2.21.0
