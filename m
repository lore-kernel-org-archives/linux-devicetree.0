From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 1/6] clk: sunxi-ng: a83t: Add pll-video0 as parent of csi-mclk
Date: Tue,  9 Apr 2019 00:57:39 +0800
Message-ID: <20190408165744.11672-2-wens@kernel.org>
References: <20190408165744.11672-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408165744.11672-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Allwinner's BSP for the A83T lists pll-video0 as the first parent to
csi-mclk with index 0. This parent is not listed in the datasheet, but
actually works, and makes more sense considering the index is the
default value out of reset.

Add pll-video0 as a parent to csi-mclk with index 0.

Fixes: 05359be1176b ("clk: sunxi-ng: Add driver for A83T CCU")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index 2d6555d73170..5f714b4d8ee4 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -513,8 +513,9 @@ static SUNXI_CCU_GATE(csi_misc_clk, "csi-misc", "osc24M", 0x130, BIT(16), 0);
 
 static SUNXI_CCU_GATE(mipi_csi_clk, "mipi-csi", "osc24M", 0x130, BIT(31), 0);
 
-static const char * const csi_mclk_parents[] = { "pll-de", "osc24M" };
-static const u8 csi_mclk_table[] = { 3, 5 };
+static const char * const csi_mclk_parents[] = { "pll-video0", "pll-de",
+						 "osc24M" };
+static const u8 csi_mclk_table[] = { 0, 3, 5 };
 static SUNXI_CCU_M_WITH_MUX_TABLE_GATE(csi_mclk_clk, "csi-mclk",
 				       csi_mclk_parents, csi_mclk_table,
 				       0x134,
-- 
2.20.1
