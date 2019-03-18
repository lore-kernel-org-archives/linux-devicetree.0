From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v1 6/6] clk: hi6220: use CLK_OF_DECLARE_DRIVER
Date: Mon, 18 Mar 2019 19:38:51 +0000
Message-ID: <1552937931-23050-7-git-send-email-peter.griffin@linaro.org>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, yuq825@gmail.com
List-Id: devicetree@vger.kernel.org

As now we also need to probe in the reset driver as well.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/hisilicon/clk-hi6220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/clk-hi6220.c b/drivers/clk/hisilicon/clk-hi6220.c
index a87809d..952ffe2 100644
--- a/drivers/clk/hisilicon/clk-hi6220.c
+++ b/drivers/clk/hisilicon/clk-hi6220.c
@@ -89,7 +89,7 @@ static void __init hi6220_clk_ao_init(struct device_node *np)
 	hisi_clk_register_gate_sep(hi6220_separated_gate_clks_ao,
 				ARRAY_SIZE(hi6220_separated_gate_clks_ao), clk_data_ao);
 }
-CLK_OF_DECLARE(hi6220_clk_ao, "hisilicon,hi6220-aoctrl", hi6220_clk_ao_init);
+CLK_OF_DECLARE_DRIVER(hi6220_clk_ao, "hisilicon,hi6220-aoctrl", hi6220_clk_ao_init);
 
 
 /* clocks in sysctrl */
-- 
2.7.4
