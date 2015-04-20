From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] regulator: max8973: make default/unset dvs gpio as invalid gpio
Date: Mon, 20 Apr 2015 18:24:16 +0530
Message-ID: <1429534457-15515-3-git-send-email-ldewangan@nvidia.com>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429534457-15515-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If platform data has dvs-gpio value 0 as default/unset then
make this as invalid gpio so that function gpio_is_valid()
can return false on this case.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
As discussed on the patch
[PATCH] regulator: max8973: get rid of extra variable for gpio validity
Adding handling of unset/default gpio on platform data which is set as
0.

 drivers/regulator/max8973-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index 1890808..85fa2de 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -408,7 +408,7 @@ static int max8973_probe(struct i2c_client *client,
 	}
 
 	if (pdata) {
-		max->dvs_gpio = pdata->dvs_gpio;
+		max->dvs_gpio = (pdata->dvs_gpio) ? pdata->dvs_gpio : -EINVAL;
 		max->enable_external_control = pdata->enable_ext_control;
 		max->curr_gpio_val = pdata->dvs_def_state;
 		max->curr_vout_reg = MAX8973_VOUT + pdata->dvs_def_state;
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
