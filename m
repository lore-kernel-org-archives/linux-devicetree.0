Return-Path: <SRS0=8s/i=WI=denx.de=sr@kernel.org>
From: Stefan Roese <sr@denx.de>
Subject: [PATCH 3/4 v4] dt-bindings: mips: Add gardena vendor prefix and board description
Date: Mon, 12 Aug 2019 12:36:54 +0200
Message-Id: <20190812103655.11070-3-sr@denx.de>
In-Reply-To: <20190812103655.11070-1-sr@denx.de>
References: <20190812103655.11070-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-mips@vger.kernel.org
Cc: Paul Burton <paul.burton@mips.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch adds the vendor prefix for gardena and a short description
including the compatible string for the "GARDENA smart Gateway" based
on the MT7688 SoC.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
v4:
- Move board description into ralink.txt instead of creating a gardena
  board file (Rob)
- Slightly changed board compatible

v3:
- New patch

 Documentation/devicetree/bindings/mips/ralink.txt   | 13 +++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml        |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/ralink.txt b/Documentation/devicetree/bindings/mips/ralink.txt
index 3341945b51d9..8cc0ab41578c 100644
--- a/Documentation/devicetree/bindings/mips/ralink.txt
+++ b/Documentation/devicetree/bindings/mips/ralink.txt
@@ -17,3 +17,16 @@ value must be one of the following values:
   ralink,mt7620n-soc
   ralink,mt7628a-soc
   ralink,mt7688a-soc
+
+2. Boards
+
+GARDENA smart Gateway (MT7688)
+
+This board is based on the MediaTek MT7688 and equipped with 128 MiB
+of DDR and 8 MiB of flash (SPI NOR) and additional 128MiB SPI NAND
+storage.
+
+------------------------------
+Required root node properties:
+- compatible = "gardena,smart-gateway-mt7688", "ralink,mt7688a-soc",
+		"ralink,mt7628a-soc";
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbbbffab..73166adfd4ad 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -337,6 +337,8 @@ patternProperties:
     description: Freescale Semiconductor
   "^fujitsu,.*":
     description: Fujitsu Ltd.
+  "^gardena,.*":
+    description: GARDENA GmbH
   "^gateworks,.*":
     description: Gateworks Corporation
   "^gcw,.*":
-- 
2.22.0
