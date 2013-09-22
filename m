From: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/4] drivers: misc: ti_dac7512: provide a SPI ID table
Date: Sun, 22 Sep 2013 21:51:48 +0200
Message-ID: <1379879509-3608-4-git-send-email-zonque@gmail.com>
References: <1379879509-3608-1-git-send-email-zonque@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379879509-3608-1-git-send-email-zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This way, the module can be autoloaded by the SPI core.

Signed-off-by: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/misc/ti_dac7512.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/ti_dac7512.c b/drivers/misc/ti_dac7512.c
index 46dfbf3..6393a68 100644
--- a/drivers/misc/ti_dac7512.c
+++ b/drivers/misc/ti_dac7512.c
@@ -72,6 +72,12 @@ static int dac7512_remove(struct spi_device *spi)
 	return 0;
 }
 
+static const struct spi_device_id dac7512_id_table[] = {
+	{ "dac7512", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, dac7512_id_table);
+
 static struct spi_driver dac7512_driver = {
 	.driver = {
 		.name	= "dac7512",
@@ -79,6 +85,7 @@ static struct spi_driver dac7512_driver = {
 	},
 	.probe	= dac7512_probe,
 	.remove	= dac7512_remove,
+	.id_table = dac7512_id_table,
 };
 
 module_spi_driver(dac7512_driver);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
