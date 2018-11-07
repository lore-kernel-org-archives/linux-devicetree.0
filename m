Return-Path: <SRS0=7Z3r=NS=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/3] clk: renesas: r7s9210: Add USB clocks
Date: Wed,  7 Nov 2018 12:35:56 -0500
Message-Id: <20181107173558.54481-2-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-1-chris.brandt@renesas.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add USB clocks for RZ/A2

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 3922967ba811..efbbf56e6766 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -87,6 +87,8 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 	DEF_MOD_STB("scif1",	 46,	R7S9210_CLK_P1C),
 	DEF_MOD_STB("scif0",	 47,	R7S9210_CLK_P1C),
 
+	DEF_MOD_STB("usb1",	 60,	R7S9210_CLK_B),
+	DEF_MOD_STB("usb0",	 61,	R7S9210_CLK_B),
 	DEF_MOD_STB("ether1",	 64,	R7S9210_CLK_B),
 	DEF_MOD_STB("ether0",	 65,	R7S9210_CLK_B),
 
-- 
2.16.1
