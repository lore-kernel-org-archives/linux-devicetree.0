From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 1/4] rtc: ds1307: fix data pointer to m41t0
Date: Tue,  8 May 2018 16:56:08 +0200
Message-ID: <20180508145611.49072-1-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

data field points to m41t00, instead it should point to m41t0.
Driver works correctly because on both cases(m41t0 and m41t00) chip_desc
are equal.

Point to right enum m41t0 instead of m41t00.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index a13e59edff53..32aadcbc377f 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -298,7 +298,7 @@ static const struct of_device_id ds1307_of_match[] = {
 	},
 	{
 		.compatible = "st,m41t0",
-		.data = (void *)m41t00
+		.data = (void *)m41t0
 	},
 	{
 		.compatible = "st,m41t00",
-- 
2.17.0
