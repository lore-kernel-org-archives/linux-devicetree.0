From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 1/2] ASoC: rt5616: add an of_match table
Date: Tue, 22 Dec 2015 13:45:02 +0800
Message-ID: <1450763103-21073-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1UjKrWyv+zT/A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, bardliao-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device tree match table. This serves to make the driver's support
of device tree more explicit.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v2: None
Changes in v1: None

 sound/soc/codecs/rt5616.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index f4005cb..e01a32d 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1287,6 +1287,14 @@ static const struct i2c_device_id rt5616_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt5616_i2c_id);
 
+#if defined(CONFIG_OF)
+static const struct of_device_id rt5616_of_match[] = {
+	{ .compatible = "realtek,rt5616", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt5616_of_match);
+#endif
+
 static int rt5616_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
@@ -1359,6 +1367,7 @@ static void rt5616_i2c_shutdown(struct i2c_client *client)
 static struct i2c_driver rt5616_i2c_driver = {
 	.driver = {
 		.name = "rt5616",
+		.of_match_table = of_match_ptr(rt5616_of_match),
 	},
 	.probe = rt5616_i2c_probe,
 	.remove = rt5616_i2c_remove,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
