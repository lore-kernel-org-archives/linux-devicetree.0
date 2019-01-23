Return-Path: <SRS0=hxoV=P7=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
Date: Wed, 23 Jan 2019 08:48:33 -0500
Message-Id: <20190123134833.119031-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add the RZ/A2M Evaluation board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 5e9d4864a600..474eb2647829 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -29,6 +29,8 @@ properties:
           - const: renesas,r7s72100
 
       - description: RZ/A2 (R7S9210)
+          - enum:
+              - renesas,rza2mevb # RZ/A2M Eval Board (RTK7921053S00000BE)
         items:
           - const: renesas,r7s9210
 
-- 
2.16.1
