From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 4/6] extcon: arizona: Add device binding for second jack detect pin on GPIO5
Date: Wed, 16 Sep 2015 10:56:42 +0100
Message-ID: <1442397404-7579-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some Arizona devices have the option to use the GPIO5 pin as a second
jack detection pin. This patch adds device bindings to specify to the
driver that it should use this pin. Note that the second jack detection
pin is hard wired in the chip so can only be enabled through the
binding, rather than a pin being specified.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/extcon/extcon-arizona.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index dc1910d..992f80e 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1235,6 +1235,11 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 
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
