From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 06/13] usb: phy: msm: Fix WARNING: Prefer seq_puts to seq_printf
Date: Mon, 14 Oct 2013 18:24:33 +0300
Message-ID: <1381764280-28420-7-git-send-email-iivanov@mm-sol.com>
References: <1381764280-28420-1-git-send-email-iivanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381764280-28420-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org, bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jackp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mgautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dsegal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>

This fixes checkpatch.pl warnings.

Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-msm-usb.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index 28cab03..46800c0 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -1231,13 +1231,13 @@ static int msm_otg_mode_show(struct seq_file *s, void *unused)
 
 	switch (otg->phy->state) {
 	case OTG_STATE_A_HOST:
-		seq_printf(s, "host\n");
+		seq_puts(s, "host\n");
 		break;
 	case OTG_STATE_B_PERIPHERAL:
-		seq_printf(s, "peripheral\n");
+		seq_puts(s, "peripheral\n");
 		break;
 	default:
-		seq_printf(s, "none\n");
+		seq_puts(s, "none\n");
 		break;
 	}
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
