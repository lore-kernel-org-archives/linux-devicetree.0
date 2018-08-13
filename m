Return-Path: <SRS0=L0cl=K4=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: sh-pfc: Document r8a774a1 PFC support
Date: Mon, 13 Aug 2018 14:52:31 +0100
Message-Id: <1534168353-4177-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1534168353-4177-1-git-send-email-biju.das@bp.renesas.com>
References: <1534168353-4177-1-git-send-email-biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document PFC support for the R8A774A1 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index abd8fbc..01c6f5f 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -16,6 +16,7 @@ Required Properties:
     - "renesas,pfc-r8a7743": for R8A7743 (RZ/G1M) compatible pin-controller.
     - "renesas,pfc-r8a7745": for R8A7745 (RZ/G1E) compatible pin-controller.
     - "renesas,pfc-r8a77470": for R8A77470 (RZ/G1C) compatible pin-controller.
+    - "renesas,pfc-r8a774a1": for R8A774A1 (RZ/G2M) compatible pin-controller.
     - "renesas,pfc-r8a7778": for R8A7778 (R-Car M1) compatible pin-controller.
     - "renesas,pfc-r8a7779": for R8A7779 (R-Car H1) compatible pin-controller.
     - "renesas,pfc-r8a7790": for R8A7790 (R-Car H2) compatible pin-controller.
-- 
2.7.4
