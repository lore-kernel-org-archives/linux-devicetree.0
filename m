From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] regulator: pwm: Fix calculation of voltage-to-duty cycle
Date: Tue, 8 Mar 2016 16:23:21 +0530
Message-ID: <1457434405-30372-2-git-send-email-ldewangan@nvidia.com>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457434405-30372-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With following equation for calculating
voltage_to_duty_cycle_percentage
	100 - (((req_uV * 100) - (min_uV * 100)) / diff);

we get 0% for max_uV and 100% for min_uV.

Correcting this to
	((req_uV * 100) - (min_uV * 100)) / diff;
 to get proper duty cycle.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/pwm-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 3aca067..4d8eb35 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -115,7 +115,7 @@ static int pwm_voltage_to_duty_cycle_percentage(struct regulator_dev *rdev, int
 	int max_uV = rdev->constraints->max_uV;
 	int diff = max_uV - min_uV;
 
-	return 100 - (((req_uV * 100) - (min_uV * 100)) / diff);
+	return ((req_uV * 100) - (min_uV * 100)) / diff;
 }
 
 static int pwm_regulator_get_voltage(struct regulator_dev *rdev)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
