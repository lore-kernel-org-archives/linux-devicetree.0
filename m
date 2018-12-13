From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] dt-bindings: net: ravb: Add support for r8a774c0 SoC
Date: Thu, 13 Dec 2018 20:18:34 +0000
Message-ID: <1544732314-6041-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman <horms+renesas@verge.net.au>, Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

Document RZ/G2E (R8A774C0) SoC bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index 3530256..7ad3621 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -18,6 +18,7 @@ Required properties:
 		R-Car Gen2 and RZ/G1 devices.
 
       - "renesas,etheravb-r8a774a1" for the R8A774A1 SoC.
+      - "renesas,etheravb-r8a774c0" for the R8A774C0 SoC.
       - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
       - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
       - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
-- 
2.7.4
