From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/6] extcon: arizona: Add device binding for the general purpose switch
Date: Wed, 16 Sep 2015 10:56:40 +0100
Message-ID: <1442397404-7579-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The switch is generally used in conjunction with the MICDET clamp to
suppress pops and clicks associated with jack insertion. This patch adds
a binding that allows the user to select the mode of operation for this
switch.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 869a920..5b4bc2f 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1230,6 +1230,8 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
 						"wlf,micd-software-compare");
 
+	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
+
 	return 0;
 }
 
-- 
1.7.2.5
