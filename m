From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 3/7] clocksource: sh_cmt: Support separate R-Car Gen2 CMT0/1
Date: Mon, 18 Sep 2017 15:46:43 +0200
Message-ID: <1505742407-31576-4-git-send-email-geert+renesas@glider.be>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505742407-31576-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>

Add support for the new R-Car Gen2 CMT0 and CMT1 bindings. Support
for the old DT binding is still kept around, however devices using
such binding will be treated as a low-feature CMT0 device. If users
want to make use of CMT1-specific features then they need to update
their DTBs. No special CMT1-specific features are however implemented
by his patch, only DT bindings are redone as groundwork for future
feature patches.

Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v3:
  - Take over from Magnus,
  - Update compatible values,

v2:
  - Added Acked-by and Tested-by from Geert,
  - Added Acked-by from Laurent.
---
 drivers/clocksource/sh_cmt.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index c104c80424c88f08..45af436483f39cb0 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -39,16 +39,16 @@ struct sh_cmt_device;
  * SoC but also on the particular instance. The following table lists the main
  * characteristics of those flavours.
  *
- *			16B	32B	32B-F	48B	48B-2
+ *			16B	32B	32B-F	48B	R-Car Gen2
  * -----------------------------------------------------------------------------
  * Channels		2	1/4	1	6	2/8
  * Control Width	16	16	16	16	32
  * Counter Width	16	32	32	32/48	32/48
  * Shared Start/Stop	Y	Y	Y	Y	N
  *
- * The 48-bit gen2 version has a per-channel start/stop register located in the
- * channel registers block. All other versions have a shared start/stop register
- * located in the global space.
+ * The r8a73a4 / R-Car Gen2 version has a per-channel start/stop register
+ * located in the channel registers block. All other versions have a shared
+ * start/stop register located in the global space.
  *
  * Channels are indexed from 0 to N-1 in the documentation. The channel index
  * infers the start/stop bit position in the control register and the channel
@@ -68,7 +68,8 @@ enum sh_cmt_model {
 	SH_CMT_32BIT,
 	SH_CMT_32BIT_FAST,
 	SH_CMT_48BIT,
-	SH_CMT_48BIT_GEN2,
+	SH_CMT0_RCAR_GEN2,
+	SH_CMT1_RCAR_GEN2,
 };
 
 struct sh_cmt_info {
@@ -223,8 +224,20 @@ static const struct sh_cmt_info sh_cmt_info[] = {
 		.read_count = sh_cmt_read32,
 		.write_count = sh_cmt_write32,
 	},
-	[SH_CMT_48BIT_GEN2] = {
-		.model = SH_CMT_48BIT_GEN2,
+	[SH_CMT0_RCAR_GEN2] = {
+		.model = SH_CMT0_RCAR_GEN2,
+		.channels_mask = 0x60,
+		.width = 32,
+		.overflow_bit = SH_CMT32_CMCSR_CMF,
+		.clear_bits = ~(SH_CMT32_CMCSR_CMF | SH_CMT32_CMCSR_OVF),
+		.read_control = sh_cmt_read32,
+		.write_control = sh_cmt_write32,
+		.read_count = sh_cmt_read32,
+		.write_count = sh_cmt_write32,
+	},
+	[SH_CMT1_RCAR_GEN2] = {
+		.model = SH_CMT1_RCAR_GEN2,
+		.channels_mask = 0xff,
 		.width = 32,
 		.overflow_bit = SH_CMT32_CMCSR_CMF,
 		.clear_bits = ~(SH_CMT32_CMCSR_CMF | SH_CMT32_CMCSR_OVF),
@@ -862,6 +875,7 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 	ch->cmt = cmt;
 	ch->index = index;
 	ch->hwidx = hwidx;
+	ch->timer_bit = hwidx;
 
 	/*
 	 * Compute the address of the channel control register block. For the
@@ -883,9 +897,11 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 		 */
 		ch->ioctrl = cmt->mapbase + 0x40;
 		break;
-	case SH_CMT_48BIT_GEN2:
+	case SH_CMT0_RCAR_GEN2:
+	case SH_CMT1_RCAR_GEN2:
 		ch->iostart = cmt->mapbase + ch->hwidx * 0x100;
 		ch->ioctrl = ch->iostart + 0x10;
+		ch->timer_bit = 0;
 		break;
 	}
 
@@ -897,8 +913,6 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 	ch->match_value = ch->max_match_value;
 	raw_spin_lock_init(&ch->lock);
 
-	ch->timer_bit = cmt->info->model == SH_CMT_48BIT_GEN2 ? 0 : ch->hwidx;
-
 	ret = sh_cmt_register(ch, dev_name(&cmt->pdev->dev),
 			      clockevent, clocksource);
 	if (ret) {
@@ -941,7 +955,9 @@ static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
 	{ .compatible = "renesas,cmt-32", .data = &sh_cmt_info[SH_CMT_32BIT] },
 	{ .compatible = "renesas,cmt-32-fast", .data = &sh_cmt_info[SH_CMT_32BIT_FAST] },
 	{ .compatible = "renesas,cmt-48", .data = &sh_cmt_info[SH_CMT_48BIT] },
-	{ .compatible = "renesas,cmt-48-gen2", .data = &sh_cmt_info[SH_CMT_48BIT_GEN2] },
+	{ .compatible = "renesas,cmt-48-gen2", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
+	{ .compatible = "renesas,rcar-gen2-cmt0", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
+	{ .compatible = "renesas,rcar-gen2-cmt1", .data = &sh_cmt_info[SH_CMT1_RCAR_GEN2] },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sh_cmt_of_table);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
