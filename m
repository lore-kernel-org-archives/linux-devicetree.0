From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/7] clocksource: sh_cmt: Use 0x3f mask for SH_CMT_48BIT case
Date: Mon, 18 Sep 2017 15:46:42 +0200
Message-ID: <1505742407-31576-3-git-send-email-geert+renesas@glider.be>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Always use 0x3f as channel mask for the SH_CMT_48BIT type of devices.
Once this patch is applied the "renesas,channels-mask" property will
be ignored by the driver for older devices matching SH_CMT_48BIT. In
the future when all CMT types store channel mask in the driver then
we will be able to deprecate and remove "renesas,channels-mask" from DTS.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Take over from Magnus,
  - Change channels_mask from "unsigned long" to "unsigned int, as it's
    assigned to sh_cmt_device.hw_channels, which is "unsigned int",

v2:
  - Fixed compile error,
  - Added Acked-by and Tested-by from Geert,
  - Added Acked-by from Laurent.
---
 drivers/clocksource/sh_cmt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index e09e8bf0bb9bf536..c104c80424c88f08 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -74,6 +74,8 @@ enum sh_cmt_model {
 struct sh_cmt_info {
 	enum sh_cmt_model model;
 
+	unsigned int channels_mask;
+
 	unsigned long width; /* 16 or 32 bit version of hardware block */
 	unsigned long overflow_bit;
 	unsigned long clear_bits;
@@ -212,6 +214,7 @@ static const struct sh_cmt_info sh_cmt_info[] = {
 	},
 	[SH_CMT_48BIT] = {
 		.model = SH_CMT_48BIT,
+		.channels_mask = 0x3f,
 		.width = 32,
 		.overflow_bit = SH_CMT32_CMCSR_CMF,
 		.clear_bits = ~(SH_CMT32_CMCSR_CMF | SH_CMT32_CMCSR_OVF),
@@ -966,9 +969,14 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
 		id = of_match_node(sh_cmt_of_table, pdev->dev.of_node);
 		cmt->info = id->data;
 
-		ret = sh_cmt_parse_dt(cmt);
-		if (ret < 0)
-			return ret;
+		/* prefer in-driver channel configuration over DT */
+		if (cmt->info->channels_mask) {
+			cmt->hw_channels = cmt->info->channels_mask;
+		} else {
+			ret = sh_cmt_parse_dt(cmt);
+			if (ret < 0)
+				return ret;
+		}
 	} else if (pdev->dev.platform_data) {
 		struct sh_timer_config *cfg = pdev->dev.platform_data;
 		const struct platform_device_id *id = pdev->id_entry;
-- 
2.7.4
