Return-Path: <SRS0=Eo6U=FY=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: net: renesas-ravb: Make stream buffer optional
Date: Fri,  2 Mar 2018 16:01:48 +0100
Message-Id: <1520002908-24947-1-git-send-email-geert+renesas@glider.be>
To: "David S . Miller" <davem@davemloft.net>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The Stream Buffer for EtherAVB-IF (STBE) is an optional component, and
is not present on all SoCs.

Document this in the DT bindings, including a list of SoCs that do have
it.

Fixes: 785ec87483d1e24a ("ravb: document R8A77970 bindings")
Fixes: f231c4178a655b09 ("dt-bindings: net: renesas-ravb: Add support for R8A77995 RAVB")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Reviewed-by, Acked-by,
  - Add R-Car M3-N.
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index bf071a58f2926ad3..2b5cb655b0e93bfd 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -27,7 +27,11 @@ Required properties:
 	SoC-specific version corresponding to the platform first followed by
 	the generic version.
 
-- reg: offset and length of (1) the register block and (2) the stream buffer.
+- reg: Offset and length of (1) the register block and (2) the stream buffer.
+       The region for the register block is mandatory.
+       The region for the stream buffer is optional, as it is only present on
+       R-Car Gen2 and RZ/G1 SoCs, and on R-Car H3 (R8A7795), M3-W (R8A7796),
+       and M3-N (R8A77965).
 - interrupts: A list of interrupt-specifiers, one for each entry in
 	      interrupt-names.
 	      If interrupt-names is not present, an interrupt specifier
-- 
2.7.4
