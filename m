From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/2] soc: amlogic: clk-measure: fix-up some clock definitions
Date: Thu,  7 Feb 2019 14:26:03 +0100
Message-ID: <20190207132603.694-3-jbrunet@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207132603.694-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

As pointed out in review, a few clock are not properly defined.

Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Fixes: 2a4c63e080cd ("soc: amlogic: clk-measure: add axg and g12a support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 drivers/soc/amlogic/meson-clk-measure.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 5570180b94a1..19d4cbc93a17 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -202,7 +202,7 @@ static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
 	CLK_MSR_ID(71, "audio_slv_sclk_a"),
 	CLK_MSR_ID(72, "pwm_d"),
 	CLK_MSR_ID(73, "pwm_c"),
-	CLK_MSR_ID(73, "wifi_beacon"),
+	CLK_MSR_ID(74, "wifi_beacon"),
 	CLK_MSR_ID(75, "tdmin_lb_lrcl"),
 	CLK_MSR_ID(76, "tdmin_lb_sclk"),
 	CLK_MSR_ID(77, "rng_ring_osc_0"),
@@ -268,6 +268,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(26, "sc_int"),
 	CLK_MSR_ID(27, "in_mac"),
 	CLK_MSR_ID(28, "sar_adc"),
+	CLK_MSR_ID(29, "pcie_inp"),
+	CLK_MSR_ID(30, "pcie_inn"),
 	CLK_MSR_ID(31, "mpll_test_out"),
 	CLK_MSR_ID(32, "vdec"),
 	CLK_MSR_ID(33, "sys_cpu_ring_osc_1"),
@@ -303,8 +305,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(65, "spicc_0"),
 	CLK_MSR_ID(66, "vid_lock"),
 	CLK_MSR_ID(67, "dsi_phy"),
-	CLK_MSR_ID(68, "hdcp22_skp"),
-	CLK_MSR_ID(69, "hdcp22_esm"),
+	CLK_MSR_ID(68, "hdcp22_esm"),
+	CLK_MSR_ID(69, "hdcp22_skp"),
 	CLK_MSR_ID(70, "pwm_f"),
 	CLK_MSR_ID(71, "pwm_e"),
 	CLK_MSR_ID(72, "pwm_d"),
-- 
2.20.1
