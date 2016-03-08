From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] regulator: pwm: Prints error number when it fails
Date: Tue, 8 Mar 2016 16:23:23 +0530
Message-ID: <1457434405-30372-4-git-send-email-ldewangan@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457434405-30372-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Prints the error number along with error message when any
error occurs. This helps on getting the reason of failure
quickly from log without any code instrument.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/pwm-regulator.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 4689d62..9db67a1 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -277,16 +277,18 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 
 	drvdata->pwm = devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(drvdata->pwm)) {
-		dev_err(&pdev->dev, "Failed to get PWM\n");
-		return PTR_ERR(drvdata->pwm);
+		ret = PTR_ERR(drvdata->pwm);
+		dev_err(&pdev->dev, "Failed to get PWM, %d\n", ret);
+		return ret;
 	}
 
 	regulator = devm_regulator_register(&pdev->dev,
 					    &drvdata->desc, &config);
 	if (IS_ERR(regulator)) {
-		dev_err(&pdev->dev, "Failed to register regulator %s\n",
-			drvdata->desc.name);
-		return PTR_ERR(regulator);
+		ret = PTR_ERR(regulator);
+		dev_err(&pdev->dev, "Failed to register regulator %s, %d\n",
+			drvdata->desc.name, ret);
+		return ret;
 	}
 
 	return 0;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
