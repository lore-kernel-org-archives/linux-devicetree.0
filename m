From: bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
Subject: [PATCH 6/8] clocksource: sh_cmt: Support separate R-car Gen3 CMT0/1
Date: Fri,  9 Sep 2016 20:43:12 +0900
Message-ID: <1473421394-9745-7-git-send-email-bd-phuc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473421394-9745-1-git-send-email-bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, ryusuke.sakato.bx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, h-inayoshi-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, cm-hiep-HEF513clHfp3+QwDJ9on6Q@public.gmane.org, nv-dung-HEF513clHfp3+QwDJ9on6Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>

Add support for the new R-Car Gen3 CMT0 and CMT1 bindings. 

Signed-off-by: Bui Duc Phuc <bd-phuc-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
---
 drivers/clocksource/sh_cmt.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 103c493..1542aef 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -69,6 +69,7 @@ enum sh_cmt_model {
 	SH_CMT_32BIT_FAST,
 	SH_CMT_48BIT,
 	SH_CMT_48BIT_GEN2,
+	SH_CMT_48BIT_GEN3,
 };
 
 struct sh_cmt_info {
@@ -230,6 +231,16 @@ static const struct sh_cmt_info sh_cmt_info[] = {
 		.read_count = sh_cmt_read32,
 		.write_count = sh_cmt_write32,
 	},
+	[SH_CMT_48BIT_GEN3] = {
+		.model = SH_CMT_48BIT_GEN3,
+		.width = 32,
+		.overflow_bit = SH_CMT32_CMCSR_CMF,
+		.clear_bits = ~(SH_CMT32_CMCSR_CMF | SH_CMT32_CMCSR_OVF),
+		.read_control = sh_cmt_read32,
+		.write_control = sh_cmt_write32,
+		.read_count = sh_cmt_read32,
+		.write_count = sh_cmt_write32,
+	},
 };
 
 #define CMCSR 0 /* channel register */
@@ -864,6 +875,7 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 	ch->cmt = cmt;
 	ch->index = index;
 	ch->hwidx = hwidx;
+	ch->timer_bit = hwidx;
 
 	/*
 	 * Compute the address of the channel control register block. For the
@@ -888,6 +900,12 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 	case SH_CMT_48BIT_GEN2:
 		ch->iostart = cmt->mapbase + ch->hwidx * 0x100;
 		ch->ioctrl = ch->iostart + 0x10;
+		ch->timer_bit = 0;
+		break;
+	case SH_CMT_48BIT_GEN3:
+		ch->iostart = cmt->mapbase + ch->hwidx * 0x100;
+		ch->ioctrl = ch->iostart + 0x10;
+		ch->timer_bit = 0;
 		break;
 	}
 
@@ -899,8 +917,6 @@ static int sh_cmt_setup_channel(struct sh_cmt_channel *ch, unsigned int index,
 	ch->match_value = ch->max_match_value;
 	raw_spin_lock_init(&ch->lock);
 
-	ch->timer_bit = cmt->info->model == SH_CMT_48BIT_GEN2 ? 0 : ch->hwidx;
-
 	ret = sh_cmt_register(ch, dev_name(&cmt->pdev->dev),
 			      clockevent, clocksource);
 	if (ret) {
@@ -944,6 +960,7 @@ static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
 	{ .compatible = "renesas,cmt-32-fast", .data = &sh_cmt_info[SH_CMT_32BIT_FAST] },
 	{ .compatible = "renesas,cmt-48", .data = &sh_cmt_info[SH_CMT_48BIT] },
 	{ .compatible = "renesas,cmt-48-gen2", .data = &sh_cmt_info[SH_CMT_48BIT_GEN2] },
+	{ .compatible = "renesas,cmt-48-gen3", .data = &sh_cmt_info[SH_CMT_48BIT_GEN3] },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sh_cmt_of_table);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
