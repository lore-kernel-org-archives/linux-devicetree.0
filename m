Return-Path: <SRS0=zDWJ=XE=cyberdimension.org=GNUtoo@kernel.org>
From: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add the Kobo Aura H2O Edition 2
Date: Mon,  9 Sep 2019 19:59:30 +0200
Message-Id: <20190909175930.5026-1-GNUtoo@cyberdimension.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
List-ID: <devicetree@vger.kernel.org>

The Aura H2O Edition 2 is an e-reader made by Kobo.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7294ac36f4c0..8029e8a14f63 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -148,6 +148,7 @@ properties:
         items:
           - enum:
               - fsl,imx6sll-evk
+              - kobo,aura-h2o-2
           - const: fsl,imx6sll
 
       - description: i.MX6SX based Boards
-- 
2.23.0
