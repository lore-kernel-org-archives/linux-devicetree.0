Return-Path: <SRS0=18ew=GZ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: Add r8a77470 PFC support
Date: Wed,  4 Apr 2018 13:48:34 +0100
Message-Id: <1522846114-1623-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522846114-1623-1-git-send-email-biju.das@bp.renesas.com>
References: <1522846114-1623-1-git-send-email-biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document PFC support for the R8A77470 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index 892d8fd..4f5fca1 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -15,6 +15,7 @@ Required Properties:
     - "renesas,pfc-r8a7740": for R8A7740 (R-Mobile A1) compatible pin-controller.
     - "renesas,pfc-r8a7743": for R8A7743 (RZ/G1M) compatible pin-controller.
     - "renesas,pfc-r8a7745": for R8A7745 (RZ/G1E) compatible pin-controller.
+    - "renesas,pfc-r8a77470": for R8A77470 (RZ/G1C) compatible pin-controller.
     - "renesas,pfc-r8a7778": for R8A7778 (R-Car M1) compatible pin-controller.
     - "renesas,pfc-r8a7779": for R8A7779 (R-Car H1) compatible pin-controller.
     - "renesas,pfc-r8a7790": for R8A7790 (R-Car H2) compatible pin-controller.
-- 
2.7.4
