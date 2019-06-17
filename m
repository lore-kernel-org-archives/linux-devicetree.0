Return-Path: <SRS0=bp0t=UQ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 1/3] dt-bindings: add Kontron vendor prefix
Date: Mon, 17 Jun 2019 18:14:30 +0200
Message-Id: <20190617161432.32268-2-m.felsch@pengutronix.de>
In-Reply-To: <20190617161432.32268-1-m.felsch@pengutronix.de>
References: <20190617161432.32268-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, Gilles.Buloz@kontron.com, frieder.schrempf@kontron.de, thomas.schaefer@kontron.com, Stefan.Nickl@kontron.com, Michael.Brunner@kontron.com, kernel@pengutronix.de, festevam@gmail.com, plaes@plaes.org
List-ID: <devicetree@vger.kernel.org>

Kontron is a leading embedded computer supplier. More information can be
found on: https://www.kontron.de/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
 - convert from vendor-prefixes.txt to vendor-prefixes.yaml

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 33a65a45e319..9163c5eadd2e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -449,6 +449,8 @@ patternProperties:
     description: Rakuten Kobo Inc.
   "^koe,.*":
     description: Kaohsiung Opto-Electronics Inc.
+  "^kontron,.*":
+    description: Kontron S&T AG
   "^kosagi,.*":
     description: Sutajio Ko-Usagi PTE Ltd.
   "^kyo,.*":
-- 
2.20.1
