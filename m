Return-Path: <SRS0=Rtep=LY=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: arm: Document RZ/G2E SoC DT bindings
Date: Mon, 10 Sep 2018 12:53:48 +0100
Message-Id: <1536580430-17432-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536580430-17432-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1536580430-17432-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for Renesas RZ/G2E (r8a774c0)
SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4a03a6b..f5e0f82 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -27,6 +27,8 @@ SoCs:
     compatible = "renesas,r8a77470"
   - RZ/G2M (R8A774A1)
     compatible = "renesas,r8a774a1"
+  - RZ/G2E (RA8774C0)
+    compatible = "renesas,r8a774c0"
   - R-Car M1A (R8A77781)
     compatible = "renesas,r8a7778"
   - R-Car H1 (R8A77790)
-- 
2.7.4
