From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 5/6] extcon: arizona: Add device binding for second jack detect pin on GPIO5
Date: Thu, 10 Sep 2015 12:41:46 +0100
Message-ID: <1441885307-24499-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 34b5a3b..5fbe893 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1233,6 +1233,11 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
+	pdata->jd_gpio5 = device_property_read_bool(arizona->dev,
+						    "wlf,use-jd-gpio");
+	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
+						"wlf,use-jd-gpio-nopull");
+
 	return 0;
 }
 
-- 
1.7.2.5
