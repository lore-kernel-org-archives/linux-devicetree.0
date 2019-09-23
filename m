From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH net-next] dt-bindings: net: ravb: Add support for r8a774b1 SoC
Date: Mon, 23 Sep 2019 14:32:46 +0100
Message-ID: <1569245566-9987-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

Document RZ/G2N (R8A774B1) SoC bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index 7ad3621..5df4aa7 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -18,6 +18,7 @@ Required properties:
 		R-Car Gen2 and RZ/G1 devices.
 
       - "renesas,etheravb-r8a774a1" for the R8A774A1 SoC.
+      - "renesas,etheravb-r8a774b1" for the R8A774B1 SoC.
       - "renesas,etheravb-r8a774c0" for the R8A774C0 SoC.
       - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
       - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
-- 
2.7.4
