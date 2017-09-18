From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 5/7] clocksource: sh_cmt: Mark "renesas,cmt-48-gen2" deprecated
Date: Mon, 18 Sep 2017 15:46:45 +0200
Message-ID: <1505742407-31576-6-git-send-email-geert+renesas@glider.be>
References: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document in the driver that "renesas,cmt-48-gen2" is deprecated, but
still supported for backward compatibility with old DTBs, cfr. commit
4e18111ff38f0664 ("devicetree: bindings: Remove deprecated
properties").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/clocksource/sh_cmt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index 8546736e3bc8e961..61a9225097065cc4 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -935,7 +935,11 @@ MODULE_DEVICE_TABLE(platform, sh_cmt_id_table);
 
 static const struct of_device_id sh_cmt_of_table[] __maybe_unused = {
 	{ .compatible = "renesas,cmt-48", .data = &sh_cmt_info[SH_CMT_48BIT] },
-	{ .compatible = "renesas,cmt-48-gen2", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
+	{
+		/* deprecated, preserved for backward compatibility */
+		.compatible = "renesas,cmt-48-gen2",
+		.data = &sh_cmt_info[SH_CMT0_RCAR_GEN2]
+	},
 	{ .compatible = "renesas,rcar-gen2-cmt0", .data = &sh_cmt_info[SH_CMT0_RCAR_GEN2] },
 	{ .compatible = "renesas,rcar-gen2-cmt1", .data = &sh_cmt_info[SH_CMT1_RCAR_GEN2] },
 	{ }
-- 
2.7.4
