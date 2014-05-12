From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH 12/12] drivers: clk: st: Use round to closest divider flag
Date: Mon, 12 May 2014 18:06:40 +0200
Message-ID: <1399910800-12847-13-git-send-email-gabriel.fernandez@linaro.org>
References: <1399910800-12847-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1399910800-12847-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch uses CLK_DIVIDER_ROUND_CLOSEST flag to specify
the divider has to round to closest div.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 drivers/clk/st/clkgen-mux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 9bdedc8..79dc40b 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -774,7 +774,8 @@ void __init st_of_clkgen_vcc_setup(struct device_node *np)
 		div->reg = reg + VCC_DIV_OFFSET;
 		div->shift = 2 * i;
 		div->width = 2;
-		div->flags = CLK_DIVIDER_POWER_OF_TWO;
+		div->flags = CLK_DIVIDER_POWER_OF_TWO |
+			CLK_DIVIDER_ROUND_CLOSEST;
 
 		mux->reg = reg + VCC_MUX_OFFSET;
 		mux->shift = 2 * i;
-- 
1.9.1

