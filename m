Return-Path: <SRS0=9qR4=WF=denx.de=sr@kernel.org>
From: Stefan Roese <sr@denx.de>
Subject: [PATCH 2/3 v3] dt-bindings: mips: Add gardena vendor prefix and board description
Date: Fri,  9 Aug 2019 14:19:17 +0200
Message-Id: <20190809121918.25047-2-sr@denx.de>
In-Reply-To: <20190809121918.25047-1-sr@denx.de>
References: <20190809121918.25047-1-sr@denx.de>
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
v3:
- New patch

 .../devicetree/bindings/mips/ralink/gardena.txt          | 9 +++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml   | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ralink/gardena.txt

diff --git a/Documentation/devicetree/bindings/mips/ralink/gardena.txt b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
new file mode 100644
index 000000000000..4022fe61a8ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
@@ -0,0 +1,9 @@
+GARDENA smart Gateway (MT7688)
+
+This board is based on the MediaTek MT7688 and equipped with 128 MiB
+of DDR and 8 MiB of flash (SPI NOR) and additional 128MiB SPI NAND
+storage.
+
+------------------------------
+Required root node properties:
+- compatible = "gardena,smartGatewayMT7688";
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
