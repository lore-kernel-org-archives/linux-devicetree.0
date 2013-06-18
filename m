From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 5/5] clk/exynos5420: assign sclk_pixel id to pixel clock divider
Date: Tue, 18 Jun 2013 20:03:18 +0530
Message-ID: <1371565998-3642-6-git-send-email-rahul.sharma@samsung.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

sclk_pixel is used to represent pixel clock divider on all exynos
SoCs not as a gate clock. It is queried in driver to pass as the
parent to hdmi clock while switching between parents. A new ID can
be asssigned Pixel gate clock which is currently not in use. Pixel
clock gate is default 'on'.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 59cf177..edd0696 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -434,7 +434,7 @@ struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 	DIV(none, "dout_fimd1", "mout_fimd1", DIV_DISP10, 0, 4),
 	DIV(none, "dout_mipi1", "mout_mipi1", DIV_DISP10, 16, 8),
 	DIV(none, "dout_dp1", "mout_dp1", DIV_DISP10, 24, 4),
-	DIV(none, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
+	DIV(sclk_pixel, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
 
 	/* Audio Block */
 	DIV(none, "dout_maudio0", "mout_maudio0", DIV_MAU, 20, 4),
@@ -570,7 +570,7 @@ struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 		GATE_TOP_SCLK_DISP1, 3, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_hdmi, "sclk_hdmi", "mout_hdmi",
 		GATE_TOP_SCLK_DISP1, 9, CLK_SET_RATE_PARENT, 0),
-	GATE(sclk_pixel, "sclk_pixel", "dout_hdmi_pixel",
+	GATE(none, "sclk_pixel", "dout_hdmi_pixel",
 		GATE_TOP_SCLK_DISP1, 10, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_dp1, "sclk_dp1", "dout_dp1",
 		GATE_TOP_SCLK_DISP1, 20, CLK_SET_RATE_PARENT, 0),
-- 
1.7.10.4
