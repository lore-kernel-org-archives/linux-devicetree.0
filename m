Return-Path: <SRS0=MCz1=MI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: arm: Document iW-RainboW-G20D-Qseven-RZG1N board
Date: Wed, 26 Sep 2018 11:44:46 +0100
Message-Id: <1537958686-10062-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document the iW-RainboW-G20D-Qseven-RZG1N device tree bindings,
listing it as a supported board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
*) This patch is tested against linux-next and depend upon the below patch
   https://patchwork.kernel.org/patch/10615399/
*) Details of this board can be found in below link
   https://www.iwavesystems.com/rz-g1m-qseven-development-kit.html
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 4cfb567..144f045a 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -101,6 +101,8 @@ Boards:
     compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
   - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7743"
+  - iWave Systems RZ/G1N Qseven Development Platform (iW-RainboW-G20D-Qseven)
+    compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7744"
   - iWave Systems RZ/G1N Qseven System On Module (iW-RainboW-G20M-Qseven)
     compatible = "iwave,g20m", "renesas,r8a7744"
   - Kingfisher (SBEV-RCAR-KF-M03)
-- 
2.7.4
