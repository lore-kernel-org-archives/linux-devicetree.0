Return-Path: <SRS0=B9z3=MK=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: Document RZ/G2E SoC DT bindings
Date: Fri, 28 Sep 2018 11:16:35 +0100
Message-Id: <1538129795-26796-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <CAMuHMdVmkLSVoUPX8QcPp5AWeae7iD4Vpz8QjA3nJw=T4J7Pkg@mail.gmail.com>
References: <CAMuHMdVmkLSVoUPX8QcPp5AWeae7iD4Vpz8QjA3nJw=T4J7Pkg@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Add device tree bindings documentation for Renesas RZ/G2E (r8a774c0)
SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

---
v1->v2:
* Fixed typo within the part number, thanks Geert for spotting this

 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4a03a6b..58c4256 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -27,6 +27,8 @@ SoCs:
     compatible = "renesas,r8a77470"
   - RZ/G2M (R8A774A1)
     compatible = "renesas,r8a774a1"
+  - RZ/G2E (R8A774C0)
+    compatible = "renesas,r8a774c0"
   - R-Car M1A (R8A77781)
     compatible = "renesas,r8a7778"
   - R-Car H1 (R8A77790)
-- 
2.7.4
