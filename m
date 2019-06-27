From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v4 11/13] dt-bindings: net: dwmac: Deprecate the PHY reset properties
Date: Thu, 27 Jun 2019 17:31:53 +0200
Message-ID: <bdec137a2b0366c88815b8d9b4880a222e359cad.1561649505.git-series.maxime.ripard@bootlin.com>
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Even though the DWMAC driver uses some driver specific properties, the PHY
core has a bunch of generic properties and can deal with them nicely.

Let's deprecate our specific properties.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 956308806c33..0bf322408500 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -172,16 +172,19 @@ properties:
           * snps,priority, TX queue priority (Range 0x0 to 0xF)
 
   snps,reset-gpio:
+    deprecated: true
     maxItems: 1
     description:
       PHY Reset GPIO
 
   snps,reset-active-low:
+    deprecated: true
     $ref: /schemas/types.yaml#definitions/flag
     description:
       Indicates that the PHY Reset is active low
 
   snps,reset-delays-us:
+    deprecated: true
     allOf:
       - $ref: /schemas/types.yaml#definitions/uint32-array
       - minItems: 3
-- 
git-series 0.9.1
