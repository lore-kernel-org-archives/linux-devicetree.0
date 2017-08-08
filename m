From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  1/3] dt-bindings: apmu: Document r8a7743 support
Date: Tue,  8 Aug 2017 11:56:31 +0100
Message-ID: <1502189793-59679-2-git-send-email-biju.das@bp.renesas.com>
References: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Document APMU and SMP enable method for RZ/G1M
(also known as r8a7743) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/power/renesas,apmu.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.txt b/Documentation/devicetree/bindings/power/renesas,apmu.txt
index 84404c9..af21502 100644
--- a/Documentation/devicetree/bindings/power/renesas,apmu.txt
+++ b/Documentation/devicetree/bindings/power/renesas,apmu.txt
@@ -1,12 +1,13 @@
 DT bindings for the Renesas Advanced Power Management Unit
 
-Renesas R-Car line of SoCs utilize one or more APMU hardware units
+Renesas R-Car and RZ/G1 SoCs utilize one or more APMU hardware units
 for CPU core power domain control including SMP boot and CPU Hotplug.
 
 Required properties:
 
 - compatible: Should be "renesas,<soctype>-apmu", "renesas,apmu" as fallback.
 	      Examples with soctypes are:
+		- "renesas,r8a7743-apmu" (RZ/G1M)
 		- "renesas,r8a7790-apmu" (R-Car H2)
 		- "renesas,r8a7791-apmu" (R-Car M2-W)
 		- "renesas,r8a7792-apmu" (R-Car V2H)
-- 
1.9.1
