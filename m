Return-Path: <SRS0=xn9O=GR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  09/12] ARM: shmobile: Document iW-RainboW-G23S single board computer
Date: Tue, 27 Mar 2018 15:37:20 +0100
Message-Id: <1522161443-54428-10-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>


Document the iW-RainboW-G23S single board computer device tree bindings,
listing it as a supported board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 86ac320..4401369 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -80,6 +80,8 @@ Boards:
     compatible = "renesas,h3ulcb", "renesas,r8a7795"
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
+  - iWave Systems RZ/G1C Single Board Computer (iW-RainboW-G23S)
+    compatible = "iwave,g23s", "renesas,r8a77470"
   - iWave Systems RZ/G1E SODIMM SOM Development Platform (iW-RainboW-G22D)
     compatible = "iwave,g22d", "iwave,g22m", "renesas,r8a7745"
   - iWave Systems RZ/G1E SODIMM System On Module (iW-RainboW-G22M-SM)
-- 
2.7.4
