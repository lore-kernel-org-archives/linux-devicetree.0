From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] dt-bindings: net: ravb: Add support for r8a77965 SoC
Date: Mon, 16 Apr 2018 15:55:17 +0200
Message-ID: <1523886917-14491-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for r8a77965 compatible string to renesas ravb device
tree bindings documentation.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
---

Renesas R-Car M3-N support has been merged for v4.17.
Document the missing device tree bindings.

---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index c306f55..890526d 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -18,6 +18,7 @@ Required properties:

       - "renesas,etheravb-r8a7795" for the R8A7795 SoC.
       - "renesas,etheravb-r8a7796" for the R8A7796 SoC.
+      - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
       - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
       - "renesas,etheravb-r8a77980" for the R8A77980 SoC.
       - "renesas,etheravb-r8a77995" for the R8A77995 SoC.
