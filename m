Return-Path: <SRS0=PFKL=TX=bootlin.com=maxime.ripard@kernel.org>
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] dt-bindings: Add vendor prefix for Espressif
Date: Thu, 23 May 2019 10:14:15 +0200
Message-Id: <20190523081415.29870-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Add Espressif Systems DT vendor prefix. That prefix has been used for quite
some time for WiFi chips, but has never been documented.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c0881d51aa91..19cc3240a445 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -277,6 +277,8 @@ patternProperties:
     description: Ecole Polytechnique Fédérale de Lausanne
   "^epson,.*":
     description: Seiko Epson Corp.
+  "^esp,.*":
+    description: Espressif Systems Co. Ltd.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^ettus,.*":
-- 
2.21.0
