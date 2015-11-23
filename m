From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH] extcon: arizona: Update naming for micd-timeout DT to include units
Date: Mon, 23 Nov 2015 14:51:30 +0000
Message-ID: <1448290290-19267-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add time units of -ms (milliseconds) to wlf,micd-timeout.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 .../devicetree/bindings/extcon/extcon-arizona.txt  |    2 +-
 drivers/extcon/extcon-arizona.c                    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
index da9813b..05d85ac 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -33,7 +33,7 @@ Optional properties:
     specified as per the ARIZONA_MICD_TIME_XXX defines.
   - wlf,micd-dbtime : Microphone detection hardware debounces specified as the
     number of measurements to take, valid values being 2 and 4.
-  - wlf,micd-timeout : Timeout for microphone detection, specified in
+  - wlf,micd-timeout-ms : Timeout for microphone detection, specified in
     milliseconds.
   - wlf,micd-force-micbias : Force MICBIAS continuously on during microphone
     detection.
diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index c377030..8647533 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1230,7 +1230,7 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	device_property_read_u32(arizona->dev, "wlf,micd-dbtime",
 				 &pdata->micd_dbtime);
 
-	device_property_read_u32(arizona->dev, "wlf,micd-timeout",
+	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
 				 &pdata->micd_timeout);
 
 	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
