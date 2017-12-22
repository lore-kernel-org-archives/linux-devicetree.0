From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 03/11] clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU
Date: Fri, 22 Dec 2017 20:22:35 +0800
Message-ID: <20171222122243.25735-4-icenowy@aosc.io>
References: <20171222122243.25735-1-icenowy@aosc.io>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171222122243.25735-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The clocks of A64/H5 SoCs in the DE2 CCU is the same as the clocks in H3
DE2 CCU rather than the A83T DE2 CCU (the parent of them is the DE
module clock).

Fix this by change the clock descriptions to use the clocks of H3.

Fixes: 763c5bd045b1 ("clk: sunxi-ng: add support for DE2 CCU")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 2db5d4e00ea7..468d1abaf0ee 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -177,10 +177,10 @@ static const struct sunxi_ccu_desc sun8i_h3_de2_clk_desc = {
 };
 
 static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc = {
-	.ccu_clks	= sun8i_a83t_de2_clks,
-	.num_ccu_clks	= ARRAY_SIZE(sun8i_a83t_de2_clks),
+	.ccu_clks	= sun8i_h3_de2_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_h3_de2_clks),
 
-	.hw_clks	= &sun8i_a83t_de2_hw_clks,
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
 
 	.resets		= sun50i_a64_de2_resets,
 	.num_resets	= ARRAY_SIZE(sun50i_a64_de2_resets),
-- 
2.14.2

