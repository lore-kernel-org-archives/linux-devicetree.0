From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 05/12] rtc: omap: remove redundant debug message
Date: Thu,  9 Oct 2014 21:06:27 +0200
Message-ID: <1412881594-25678-6-git-send-email-johan@kernel.org>
References: <1412881594-25678-1-git-send-email-johan@kernel.org>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1412881594-25678-1-git-send-email-johan@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Tony Lindgren <tony@atomide.com>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Felipe Balbi <balbi@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Guenter Roeck <linux@roeck-us.net>, Colin Foe-Parker <colin.foeparker@logicpd.com>, AnilKumar Ch <anilkumar@ti.com>, nsekhar@ti.com, t-kristo@ti.com, j-keerthy@ti.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Remove redundant debug message.

The corresponding error has already been logged by rtc core.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/rtc/rtc-omap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index d1b5562a148b..e50ffd7063f5 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -485,11 +485,9 @@ static int __init omap_rtc_probe(struct platform_device *pdev)
 
 	rtc = devm_rtc_device_register(&pdev->dev, pdev->name,
 			&omap_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc)) {
-		pr_debug("%s: can't register RTC device, err %ld\n",
-			pdev->name, PTR_ERR(rtc));
+	if (IS_ERR(rtc))
 		goto fail0;
-	}
+
 	platform_set_drvdata(pdev, rtc);
 
 	return 0;
-- 
2.0.4

