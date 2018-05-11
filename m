From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: net: ravb: Add support for r8a77990 SoC
Date: Fri, 11 May 2018 12:18:56 +0900
Message-ID: <1526008736-26496-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: sergei.shtylyov@cogentembedded.com, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Add documentation for r8a77990 compatible string to renesas ravb device
tree bindings documentation.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index 890526d..fac897d 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -21,6 +21,7 @@ Required properties:
       - "renesas,etheravb-r8a77965" for the R8A77965 SoC.
       - "renesas,etheravb-r8a77970" for the R8A77970 SoC.
       - "renesas,etheravb-r8a77980" for the R8A77980 SoC.
+      - "renesas,etheravb-r8a77990" for the R8A77990 SoC.
       - "renesas,etheravb-r8a77995" for the R8A77995 SoC.
       - "renesas,etheravb-rcar-gen3" as a fallback for the above
 		R-Car Gen3 devices.
-- 
1.9.1
