From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/6] clk: meson: meson8b: use of_clk_hw_register to register the clocks
Date: Sat, 21 Sep 2019 17:18:32 +0200
Message-ID: <20190921151835.770263-4-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Switch from clk_hw_register to of_clk_hw_register so we can use
clk_parent_data.fw_name. This will be used to get the "xtal", "ddr_pll"
and possibly others from the .dtb.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 15ec14fde2a0..fefb4b7185d0 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3696,7 +3696,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		if (!clk_hw_onecell_data->hws[i])
 			continue;
 
-		ret = clk_hw_register(NULL, clk_hw_onecell_data->hws[i]);
+		ret = of_clk_hw_register(np, clk_hw_onecell_data->hws[i]);
 		if (ret)
 			return;
 	}
-- 
2.23.0
