From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: meson: axg-audio: fix input clock name
Date: Tue, 11 Dec 2018 13:47:51 +0100
Message-ID: <20181211124751.30108-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The name of input clock is not aligned with the rest of the tree
Because of this, the audio peripheral clocks are orphaned.

Fixes: 1222ab89328f ("clk: meson: axg-audio: use the clk input helper function")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Neil,

 Feel free to squash this with commit 1222ab89328f if you prefer

 Cheers
 Jerome

 drivers/clk/meson/axg-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 72b717e61a68..8ac3a2295473 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -752,7 +752,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	}
 
 	/* Register the peripheral input clock */
-	hw = meson_clk_hw_register_input(dev, "pclk", "audio_pclk", 0);
+	hw = meson_clk_hw_register_input(dev, "pclk", "axg_audio_pclk", 0);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-- 
2.19.2
