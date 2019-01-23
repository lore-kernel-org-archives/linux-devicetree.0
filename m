Return-Path: <SRS0=hxoV=P7=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2] dt-bindings: arm: renesas: Document RZ/A2M EVB
Date: Wed, 23 Jan 2019 09:30:12 -0500
Message-Id: <20190123143012.119912-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add the RZ/A2M Evaluation board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * 'enum' is supposed to go under 'items'
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 5e9d4864a600..f2ef83d473d6 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -30,6 +30,8 @@ properties:
 
       - description: RZ/A2 (R7S9210)
         items:
+          - enum:
+              - renesas,rza2mevb # RZ/A2M Eval Board (RTK7921053S00000BE)
           - const: renesas,r7s9210
 
       - description: SH-Mobile AG5 (R8A73A00/SH73A0)
-- 
2.16.1
