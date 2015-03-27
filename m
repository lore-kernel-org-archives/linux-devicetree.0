From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] mtd: m25p80: bind to "nor-jedec" ID, for auto-detection
Date: Fri, 27 Mar 2015 10:29:50 -0700
Message-ID: <1427477390-24069-2-git-send-email-computersforpeace@gmail.com>
References: <1427477390-24069-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427477390-24069-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the new 'nor-jedec' binding to provide automatic detection of flash
that use the 0x9F READ ID opcode. This can help for use cases where
platforms just specify compatibility with "m25p80", and then see
messages like this:

  m25p80 spi32766.0: found s25fl256s1, expected m25p80

Instead, they can just specify the generic string and see this:

  m25p80 spi32766.0: s25fl256s1 (32768 Kbytes)

Also, update the language about m25p_ids[] to straighten out the
expectations here. We should no longer need to continuously grow the
m25p_ids[] table, and in fact, we might want to start removing entries
which are not used in device trees so far, so we can just default to
auto-detection as much as possible in the future.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: no change

 drivers/mtd/devices/m25p80.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.=
c
index 85e35467fba6..7c8b1694a134 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -223,6 +223,8 @@ static int m25p_probe(struct spi_device *spi)
 	 */
 	if (data && data->type)
 		flash_name =3D data->type;
+	else if (!strcmp(spi->modalias, "nor-jedec"))
+		flash_name =3D NULL; /* auto-detect */
 	else
 		flash_name =3D spi->modalias;
=20
@@ -247,9 +249,16 @@ static int m25p_remove(struct spi_device *spi)
 }
=20
 /*
- * XXX This needs to be kept in sync with spi_nor_ids.  We can't share
- * it with spi-nor, because if this is built as a module then modpost
- * won't be able to read it and add appropriate aliases.
+ * Do NOT add to this array without reading the following:
+ *
+ * Historically, many flash devices are bound to this driver by their =
name. But
+ * since most of these flash are compatible to some extent, and their
+ * differences can often be differentiated by the JEDEC read-ID comman=
d, we
+ * encourage new users to add support to the spi-nor library, and simp=
ly bind
+ * against a generic string here (e.g., "nor-jedec").
+ *
+ * Many flash names are kept here in this list (as well as in spi-nor.=
c) to
+ * keep them available as module aliases for existing platforms.
  */
 static const struct spi_device_id m25p_ids[] =3D {
 	{"at25fs010"},	{"at25fs040"},	{"at25df041a"},	{"at25df321a"},
@@ -291,6 +300,12 @@ static const struct spi_device_id m25p_ids[] =3D {
 	{"w25x64"},	{"w25q64"},	{"w25q80"},	{"w25q80bl"},
 	{"w25q128"},	{"w25q256"},	{"cat25c11"},
 	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
+
+	/*
+	 * Generic support for SPI NOR that can be identified by the JEDEC RE=
AD
+	 * ID opcode (0x9F). Use this, if possible.
+	 */
+	{"nor-jedec"},
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
