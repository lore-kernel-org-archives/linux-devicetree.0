From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] clk: ingenic: jz4725b: Add UDC PHY clock
Date: Tue, 19 Mar 2019 15:05:36 +0100
Message-ID: <20190319140536.27945-2-paul@crapouillou.net>
References: <20190319140536.27945-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319140536.27945-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add clock for the USB Device Controller PHY.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/jz4725b-cgu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index 584ff4ff81c7..8901ea0295b7 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -205,6 +205,12 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		.parents = { JZ4725B_CLK_EXT512, JZ4725B_CLK_OSC32K, -1, -1 },
 		.mux = { CGU_REG_OPCR, 2, 1},
 	},
+
+	[JZ4725B_CLK_UDC_PHY] = {
+		"udc_phy", CGU_CLK_GATE,
+		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
+		.gate = { CGU_REG_OPCR, 6, true },
+	},
 };
 
 static void __init jz4725b_cgu_init(struct device_node *np)
-- 
2.11.0
