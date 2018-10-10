Return-Path: <SRS0=+qJk=MW=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/3] clk: renesas: r7s9210: Add SDHI clocks
Date: Wed, 10 Oct 2018 07:37:11 -0500
Message-Id: <20181010123713.67541-2-chris.brandt@renesas.com>
In-Reply-To: <20181010123713.67541-1-chris.brandt@renesas.com>
References: <20181010123713.67541-1-chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add SDHI clocks for RZ/A2

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 5135f13ec628..9056da15dc72 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -98,6 +98,11 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 	DEF_MOD_STB("spi2",	 95,	R7S9210_CLK_P1),
 	DEF_MOD_STB("spi1",	 96,	R7S9210_CLK_P1),
 	DEF_MOD_STB("spi0",	 97,	R7S9210_CLK_P1),
+
+	DEF_MOD_STB("sdhi11",	100,	R7S9210_CLK_B),
+	DEF_MOD_STB("sdhi10",	101,	R7S9210_CLK_B),
+	DEF_MOD_STB("sdhi01",	102,	R7S9210_CLK_B),
+	DEF_MOD_STB("sdhi00",	103,	R7S9210_CLK_B),
 };
 
 /* The clock dividers in the table vary based on DT and register settings */
-- 
2.16.1
