From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] reset: sti: Add support for resetting co-processors
Date: Mon, 26 Oct 2015 10:56:08 +0000
Message-ID: <1445856969-19424-2-git-send-email-lee.jones@linaro.org>
References: <1445856969-19424-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445856969-19424-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/reset/sti/reset-stih407.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/reset/sti/reset-stih407.c b/drivers/reset/sti/reset-stih407.c
index d83db5d7..5c2d68a 100644
--- a/drivers/reset/sti/reset-stih407.c
+++ b/drivers/reset/sti/reset-stih407.c
@@ -52,6 +52,7 @@ static const struct syscfg_reset_channel_data stih407_powerdowns[] = {
 };
 
 /* Reset Generator control 0/1 */
+#define SYSCFG_5128     0x200
 #define SYSCFG_5131	0x20c
 #define SYSCFG_5132	0x210
 
@@ -96,6 +97,10 @@ static const struct syscfg_reset_channel_data stih407_softresets[] = {
 	[STIH407_ERAM_HVA_SOFTRESET] = STIH407_SRST_CORE(SYSCFG_5132, 1),
 	[STIH407_LPM_SOFTRESET] = STIH407_SRST_SBC(SYSCFG_4002, 2),
 	[STIH407_KEYSCAN_SOFTRESET] = STIH407_SRST_LPM(LPM_SYSCFG_1, 8),
+	[STIH407_ST231_AUD_SOFTRESET] = STIH407_SRST_CORE(SYSCFG_5131, 26),
+	[STIH407_ST231_DMU_SOFTRESET] = STIH407_SRST_CORE(SYSCFG_5131, 27),
+	[STIH407_ST231_GP0_SOFTRESET] = STIH407_SRST_CORE(SYSCFG_5131, 28),
+	[STIH407_ST231_GP1_SOFTRESET] = STIH407_SRST_CORE(SYSCFG_5128, 2),
 };
 
 /* PicoPHY reset/control */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
