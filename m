From: =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/2] fix format string mismatch in drivers/i2c/i2c-core.c
Date: Sun, 18 May 2014 22:43:52 +0200
Message-ID: <1400445832-30635-1-git-send-email-toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

found by cppcheck

Signed-off-by: Toralf F=C3=B6rster <toralf.foerster-Mmb7MZpHnFY@public.gmane.org>
---
 drivers/i2c/i2c-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 7c7f4b8..ad900bc 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -897,7 +897,7 @@ i2c_sysfs_delete_device(struct device *dev, struct =
device_attribute *attr,
 	int res;
=20
 	/* Parse parameters, reject extra parameters */
-	res =3D sscanf(buf, "%hi%c", &addr, &end);
+	res =3D sscanf(buf, "%hu%c", &addr, &end);
 	if (res < 1) {
 		dev_err(dev, "%s: Can't parse I2C address\n", "delete_device");
 		return -EINVAL;
--=20
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
