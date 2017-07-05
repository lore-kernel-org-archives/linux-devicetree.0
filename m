From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/2] ravb: Document binding for r8a7743 SoC
Date: Wed,  5 Jul 2017 16:56:28 +0100
Message-ID: <1499270189-29945-2-git-send-email-biju.das@bp.renesas.com>
References: <afcd181c-c805-8f3c-955f-652d001a03d4@cogentembedded.com>
 <1499270189-29945-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1499270189-29945-1-git-send-email-biju.das@bp.renesas.com>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Add a new compatible string for the RZ/G1M (R8A7743) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/net/renesas,ravb.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ravb.txt b/Documentation/devicetree/bindings/net/renesas,ravb.txt
index b519503..bc692ab 100644
--- a/Documentation/devicetree/bindings/net/renesas,ravb.txt
+++ b/Documentation/devicetree/bindings/net/renesas,ravb.txt
@@ -4,7 +4,8 @@ This file provides information on what the device node for the Ethernet AVB
 interface contains.
 
 Required properties:
-- compatible: "renesas,etheravb-r8a7790" if the device is a part of R8A7790 SoC.
+- compatible: "renesas,etheravb-r8a7743" if the device is a part of R8A7743 SoC.
+	      "renesas,etheravb-r8a7790" if the device is a part of R8A7790 SoC.
 	      "renesas,etheravb-r8a7791" if the device is a part of R8A7791 SoC.
 	      "renesas,etheravb-r8a7792" if the device is a part of R8A7792 SoC.
 	      "renesas,etheravb-r8a7793" if the device is a part of R8A7793 SoC.
-- 
1.9.1
