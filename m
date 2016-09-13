From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH v4] mfd: arizona: Add DT options for max_channels_clocked and PDM speaker config
Date: Tue, 13 Sep 2016 10:05:44 +0100
Message-ID: <1473757544-6490-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org
Cc: patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds DT settings for the max_channels_clocked, spk_fmt and
spk_mute pdata.

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt | 18 ++++++++++++++
 drivers/mfd/arizona-core.c                        | 30 +++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index a6e2ea41..8f2e282 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -85,6 +85,24 @@ Optional properties:
     present, the number of values should be less than or equal to the
     number of inputs, unspecified inputs will use the chip default.
 
+  - wlf,max-channels-clocked : The maximum number of channels to be clocked on
+    each AIF, useful for I2S systems with multiple data lines being mastered.
+    Specify one cell for each AIF to be configured, specify zero for AIFs that
+    should be handled normally.
+    If present, number of cells must be less than or equal to the number of
+    AIFs. If less than the number of AIFs, for cells that have not been
+    specified the corresponding AIFs will be treated as default setting.
+
+  - wlf,spk-fmt : PDM speaker data format, must contain 2 cells (OUT5 and OUT6).
+    See the datasheet for values.
+    The second cell is ignored for codecs that do not have OUT6 (wm5102, wm8997,
+      wm8998, wm1814)
+
+  - wlf,spk-mute : PDM speaker mute setting, must contain 2 cells (OUT5 and OUT6).
+    See the datasheet for values.
+    The second cell is ignored for codecs that do not have OUT6 (wm5102, wm8997,
+    wm8998, wm1814)
+
   - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
     they are being externally supplied. As covered in
     Documentation/devicetree/bindings/regulator/regulator.txt
diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index b95ff2d..3687e5f 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -760,6 +760,7 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 	struct property *prop;
 	const __be32 *cur;
 	u32 val;
+	u32 pdm_val[ARIZONA_MAX_PDM_SPK];
 	int ret, i;
 	int count = 0;
 
@@ -816,6 +817,35 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 		count++;
 	}
 
+	count = 0;
+	of_property_for_each_u32(arizona->dev->of_node,
+				 "wlf,max-channels-clocked",
+				 prop, cur, val) {
+		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
+			break;
+
+		pdata->max_channels_clocked[count] = val;
+		count++;
+	}
+
+	ret = of_property_read_u32_array(arizona->dev->of_node,
+					 "wlf,spk-fmt",
+					 pdm_val,
+					 ARRAY_SIZE(pdm_val));
+
+	if (ret >= 0)
+		for (count = 0; count < ARRAY_SIZE(pdata->spk_fmt); ++count)
+			pdata->spk_fmt[count] = pdm_val[count];
+
+	ret = of_property_read_u32_array(arizona->dev->of_node,
+					 "wlf,spk-mute",
+					 pdm_val,
+					 ARRAY_SIZE(pdm_val));
+
+	if (ret >= 0)
+		for (count = 0; count < ARRAY_SIZE(pdata->spk_mute); ++count)
+			pdata->spk_mute[count] = pdm_val[count];
+
 	return 0;
 }
 
-- 
1.9.1
