Return-Path: <SRS0=qxAe=XA=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: arm: Document RZ/G2N SoC DT bindings
Date: Thu,  5 Sep 2019 10:30:41 +0100
Message-Id: <1567675844-19247-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
References: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for Renesas RZ/G2N (r8a774b1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 28eb458..9ad31f1 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -116,6 +116,10 @@ properties:
           - const: hoperun,hihope-rzg2m
           - const: renesas,r8a774a1
 
+      - description: RZ/G2N (R8A774B1)
+        items:
+          - const: renesas,r8a774b1
+
       - description: RZ/G2E (R8A774C0)
         items:
           - enum:
-- 
2.7.4
