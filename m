From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/4] clk: meson: axg-audio: don't register inputs in the onecell data
Date: Fri, 29 Mar 2019 17:06:48 +0100
Message-ID: <20190329160649.31603-4-jbrunet@baylibre.com>
References: <20190329160649.31603-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329160649.31603-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Clock inputs should not be exported outside the controller. It is a hack
to have a stable global clock name within the clock controller, even for
clocks external to the controller.

There is an ongoing effort to replace this hack with something better.
The first step is to not register those clocks in the provider anymore,
so we can completely remove them later on.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 21 ++++++---------------
 drivers/clk/meson/axg-audio.h | 29 -----------------------------
 2 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 38fccffc171e..e8516f9c03d3 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -665,8 +665,7 @@ static int devm_clk_get_enable(struct device *dev, char *id)
 }
 
 static int axg_register_clk_hw_input(struct device *dev,
-				     const char *name,
-				     unsigned int clkid)
+				     const char *name)
 {
 	char *clk_name;
 	struct clk_hw *hw;
@@ -686,8 +685,6 @@ static int axg_register_clk_hw_input(struct device *dev,
 			if (err != -EPROBE_DEFER)
 				dev_err(dev, "failed to get %s clock", name);
 		}
-	} else {
-		axg_audio_hw_onecell_data.hws[clkid] = hw;
 	}
 
 	kfree(clk_name);
@@ -696,8 +693,7 @@ static int axg_register_clk_hw_input(struct device *dev,
 
 static int axg_register_clk_hw_inputs(struct device *dev,
 				      const char *basename,
-				      unsigned int count,
-				      unsigned int clkid)
+				      unsigned int count)
 {
 	char *name;
 	int i, ret;
@@ -707,7 +703,7 @@ static int axg_register_clk_hw_inputs(struct device *dev,
 		if (!name)
 			return -ENOMEM;
 
-		ret = axg_register_clk_hw_input(dev, name, clkid + i);
+		ret = axg_register_clk_hw_input(dev, name);
 		kfree(name);
 		if (ret)
 			return ret;
@@ -759,26 +755,21 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	axg_audio_hw_onecell_data.hws[AUD_CLKID_PCLK] = hw;
-
 	/* Register optional input master clocks */
 	ret = axg_register_clk_hw_inputs(dev, "mst_in",
-					 AUD_MST_IN_COUNT,
-					 AUD_CLKID_MST0);
+					 AUD_MST_IN_COUNT);
 	if (ret)
 		return ret;
 
 	/* Register optional input slave sclks */
 	ret = axg_register_clk_hw_inputs(dev, "slv_sclk",
-					 AUD_SLV_SCLK_COUNT,
-					 AUD_CLKID_SLV_SCLK0);
+					 AUD_SLV_SCLK_COUNT);
 	if (ret)
 		return ret;
 
 	/* Register optional input slave lrclks */
 	ret = axg_register_clk_hw_inputs(dev, "slv_lrclk",
-					 AUD_SLV_LRCLK_COUNT,
-					 AUD_CLKID_SLV_LRCLK0);
+					 AUD_SLV_LRCLK_COUNT);
 	if (ret)
 		return ret;
 
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index 644f0b0fddf2..9644c2ff0b3b 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -51,35 +51,6 @@
  * These indices are entirely contrived and do not map onto the hardware.
  */
 
-#define AUD_CLKID_PCLK			0
-#define AUD_CLKID_MST0			1
-#define AUD_CLKID_MST1			2
-#define AUD_CLKID_MST2			3
-#define AUD_CLKID_MST3			4
-#define AUD_CLKID_MST4			5
-#define AUD_CLKID_MST5			6
-#define AUD_CLKID_MST6			7
-#define AUD_CLKID_MST7			8
-#define AUD_CLKID_SLV_SCLK0		9
-#define AUD_CLKID_SLV_SCLK1		10
-#define AUD_CLKID_SLV_SCLK2		11
-#define AUD_CLKID_SLV_SCLK3		12
-#define AUD_CLKID_SLV_SCLK4		13
-#define AUD_CLKID_SLV_SCLK5		14
-#define AUD_CLKID_SLV_SCLK6		15
-#define AUD_CLKID_SLV_SCLK7		16
-#define AUD_CLKID_SLV_SCLK8		17
-#define AUD_CLKID_SLV_SCLK9		18
-#define AUD_CLKID_SLV_LRCLK0		19
-#define AUD_CLKID_SLV_LRCLK1		20
-#define AUD_CLKID_SLV_LRCLK2		21
-#define AUD_CLKID_SLV_LRCLK3		22
-#define AUD_CLKID_SLV_LRCLK4		23
-#define AUD_CLKID_SLV_LRCLK5		24
-#define AUD_CLKID_SLV_LRCLK6		25
-#define AUD_CLKID_SLV_LRCLK7		26
-#define AUD_CLKID_SLV_LRCLK8		27
-#define AUD_CLKID_SLV_LRCLK9		28
 #define AUD_CLKID_MST_A_MCLK_SEL	59
 #define AUD_CLKID_MST_B_MCLK_SEL	60
 #define AUD_CLKID_MST_C_MCLK_SEL	61
-- 
2.20.1
