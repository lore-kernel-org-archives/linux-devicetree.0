From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] extcon: arizona: Update naming for second jack detection DT binding
Date: Fri, 20 Nov 2015 08:53:59 +0000
Message-ID: <1448009639-5331-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Update the name for the second jack detection pin binding to be a little
less confusing.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 .../devicetree/bindings/extcon/extcon-arizona.txt  |    4 ++--
 drivers/extcon/extcon-arizona.c                    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
index 03fa7b7..da9813b 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -14,9 +14,9 @@ Optional properties:
     If this node is not mentioned or if the value is unknown, then
     headphone detection mode is set to HPDETL.
 
-  - wlf,use-jd-gpio : Use GPIO input along with JD1 for dual pin jack
+  - wlf,use-jd2 : Use the additional JD input along with JD1 for dual pin jack
     detection.
-  - wlf,use-jd-gpio-nopull : Internal pull on GPIO is disabled when used for
+  - wlf,use-jd2-nopull : Internal pull on JD2 is disabled when used for
     jack detection.
   - wlf,jd-invert : Invert the polarity of the jack detection switch
 
diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 7c9598d..c377030 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1245,9 +1245,9 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
 	pdata->jd_gpio5 = device_property_read_bool(arizona->dev,
-						    "wlf,use-jd-gpio");
+						    "wlf,use-jd2");
 	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
-						"wlf,use-jd-gpio-nopull");
+						"wlf,use-jd2-nopull");
 
 	return 0;
 }
-- 
1.7.2.5
