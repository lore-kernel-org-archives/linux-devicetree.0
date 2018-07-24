Return-Path: <SRS0=JVBZ=KI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: arm: Document RZ/G2M SoC DT bindings
Date: Tue, 24 Jul 2018 16:47:16 +0100
Message-Id: <1532447238-13486-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com>
References: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for Renesas RZ/G2M (r8a774a1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 89b4a38..8acd3cd 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -23,6 +23,8 @@ SoCs:
     compatible = "renesas,r8a7745"
   - RZ/G1C (R8A77470)
     compatible = "renesas,r8a77470"
+  - RZ/G2M (R8A774A1)
+    compatible = "renesas,r8a774a1"
   - R-Car M1A (R8A77781)
     compatible = "renesas,r8a7778"
   - R-Car H1 (R8A77790)
-- 
2.7.4
