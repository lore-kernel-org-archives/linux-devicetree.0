Return-Path: <SRS0=xn9O=GR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  03/12] soc: renesas: rcar-rst: Add support for RZ/G1C
Date: Tue, 27 Mar 2018 15:37:14 +0100
Message-Id: <1522161443-54428-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
 drivers/soc/renesas/rcar-rst.c                          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
index 294a0da..7be61ef 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -17,6 +17,7 @@ Required properties:
 		Examples with soctypes are:
 		  - "renesas,r8a7743-rst" (RZ/G1M)
 		  - "renesas,r8a7745-rst" (RZ/G1E)
+		  - "renesas,r8a77470-rst" (RZ/G1C)
 		  - "renesas,r8a7778-reset-wdt" (R-Car M1A)
 		  - "renesas,r8a7779-reset-wdt" (R-Car H1)
 		  - "renesas,r8a7790-rst" (R-Car H2)
diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 8e9cb79..66d7dba 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -44,6 +44,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	/* RZ/G is handled like R-Car Gen2 */
 	{ .compatible = "renesas,r8a7743-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7745-rst", .data = &rcar_rst_gen2 },
+	{ .compatible = "renesas,r8a77470-rst", .data = &rcar_rst_gen2 },
 	/* R-Car Gen1 */
 	{ .compatible = "renesas,r8a7778-reset-wdt", .data = &rcar_rst_gen1 },
 	{ .compatible = "renesas,r8a7779-reset-wdt", .data = &rcar_rst_gen1 },
-- 
2.7.4
