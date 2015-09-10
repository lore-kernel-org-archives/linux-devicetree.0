From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 4/6] extcon: arizona: Add device binding for jack detect polarity inversion
Date: Thu, 10 Sep 2015 12:41:45 +0100
Message-ID: <1441885307-24499-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
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
 drivers/extcon/extcon-arizona.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 6d030a0..34b5a3b 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1228,6 +1228,9 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
 						"wlf,micd-software-compare");
 
+	pdata->jd_invert = device_property_read_bool(arizona->dev,
+						     "wlf,jd-invert");
+
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
 	return 0;
-- 
1.7.2.5
