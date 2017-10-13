From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/4] clk: renesas: cpg-mssr: Add du1 clock to R8A7745
Date: Fri, 13 Oct 2017 16:22:21 +0100
Message-ID: <1507908142-13142-4-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1507908142-13142-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507908142-13142-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/clk/renesas/r8a7745-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c b/drivers/clk/renesas/r8a7745-cpg-mssr.c
index 9e2360a..2859504 100644
--- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
@@ -129,6 +129,7 @@ static const struct mssr_mod_clk r8a7745_mod_clks[] __initconst = {
 	DEF_MOD("scif2",		 719,	R8A7745_CLK_P),
 	DEF_MOD("scif1",		 720,	R8A7745_CLK_P),
 	DEF_MOD("scif0",		 721,	R8A7745_CLK_P),
+	DEF_MOD("du1",			 723,	R8A7745_CLK_ZX),
 	DEF_MOD("du0",			 724,	R8A7745_CLK_ZX),
 	DEF_MOD("ipmmu-sgx",		 800,	R8A7745_CLK_ZX),
 	DEF_MOD("vin1",			 810,	R8A7745_CLK_ZG),
-- 
2.7.4
