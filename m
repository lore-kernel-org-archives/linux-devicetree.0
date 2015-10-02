From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 3/5] extcon: arizona: Add device binding for jack detect polarity inversion
Date: Fri, 2 Oct 2015 17:29:21 +0100
Message-ID: <1443803363-3251-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

By default the driver expects the jackdet pin to be pulled low when a
jack is inserted. This patch adds a device binding that allows the user
to specify that the jackdet pin will be pulled high when a jack is
inserted.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/extcon/extcon-arizona.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index e8dd19cb..58e4dc9 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1239,6 +1239,9 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
 						"wlf,micd-software-compare");
 
+	pdata->jd_invert = device_property_read_bool(arizona->dev,
+						     "wlf,jd-invert");
+
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
 	return 0;
-- 
1.7.2.5
