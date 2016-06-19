From: Chris Lapa <chris@lapa.com.au>
Subject: [PATCH v4 6/7] max8903: remove unnecessary 'out of memory' error message.
Date: Mon, 20 Jun 2016 08:27:21 +1000
Message-ID: <1466375242-38354-7-git-send-email-chris@cpdesign.com.au>
References: <1464849897-21527-3-git-send-email-chris@lapa.com.au>
 <1466375242-38354-1-git-send-email-chris@cpdesign.com.au>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1466375242-38354-1-git-send-email-chris@cpdesign.com.au>
In-Reply-To: <1464849897-21527-3-git-send-email-chris@lapa.com.au>
References: <1464849897-21527-3-git-send-email-chris@lapa.com.au>
Sender: linux-pm-owner@vger.kernel.org
To: k.kozlowski@samsung.com, dwmw2@infradead.org, dbaryshkov@gmail.com, sre@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Chris Lapa <chris@lapa.com.au>
List-Id: devicetree@vger.kernel.org

From: Chris Lapa <chris@lapa.com.au>

Remove the 'out of memory' error message as it is printed by the core.

Signed-off-by: Chris Lapa <chris@lapa.com.au>
---
 drivers/power/max8903_charger.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/power/max8903_charger.c b/drivers/power/max8903_charger.c
index 643a87a..9453bbf 100644
--- a/drivers/power/max8903_charger.c
+++ b/drivers/power/max8903_charger.c
@@ -304,10 +304,8 @@ static int max8903_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(dev, sizeof(struct max8903_data), GFP_KERNEL);
-	if (data == NULL) {
-		dev_err(dev, "Cannot allocate memory.\n");
+	if (!data)
 		return -ENOMEM;
-	}
 
 	data->pdata = pdev->dev.platform_data;
 	data->dev = dev;
-- 
1.9.1

