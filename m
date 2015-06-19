From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v4 4/8] extcon: arizona: Add basic microphone detection DT/ACPI bindings
Date: Fri, 19 Jun 2015 13:37:32 +0100
Message-ID: <1434717456-31995-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434717456-31995-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434717456-31995-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds bindings for the basic microphone detection platform
data.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/extcon/extcon-arizona.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 57f5553..0e1d9c6 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1128,6 +1128,24 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 		pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
 	}
 
+	device_property_read_u32(arizona->dev, "wlf,micd-detect-debounce",
+				 &pdata->micd_detect_debounce);
+
+	device_property_read_u32(arizona->dev, "wlf,micd-bias-start-time",
+				 &pdata->micd_bias_start_time);
+
+	device_property_read_u32(arizona->dev, "wlf,micd-rate",
+				 &pdata->micd_rate);
+
+	device_property_read_u32(arizona->dev, "wlf,micd-dbtime",
+				 &pdata->micd_dbtime);
+
+	device_property_read_u32(arizona->dev, "wlf,micd-timeout",
+				 &pdata->micd_timeout);
+
+	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
+						"wlf,micd-force-micbias");
+
 	return 0;
 }
 
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
