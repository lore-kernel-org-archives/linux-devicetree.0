From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Tue, 17 Jan 2017 12:03:38 +0100
Message-ID: <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <480df61d-c949-b3b0-61a4-d9db17f09e7d-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiko Iwamoto <iwamoto-sK/J6oeM9AhgKrQr38906+qrae++aQT8@public.gmane.org>, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The MR25 family doesn't support JEDEC, so they need explicit mentioning
in the list of supported spi IDs. This makes it possible to add these
using for example:

	compatible = "everspin,mr25h40";

There was already an entry for mr25h256. Move that one out of the "keep
for compatibility" section and put in a new group for Everspin MRAMs.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Changes since (implicit) v1:

 - use Kib instead of kib

Changes since v2:

 - update dt docs
 - handle already existing mr25h256 in m25p_ids[]

Thanks to Cyrille for catching these.

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
 drivers/mtd/devices/m25p80.c                            | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 2c91c03e7eb0..3e920ec5c4d3 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -14,6 +14,8 @@ Required properties:
                  at25df641
                  at26df081a
                  mr25h256
+                 mr25h10
+                 mr25h40
                  mx25l4005a
                  mx25l1606e
                  mx25l6405d
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd28034..0e2d3a64651a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -288,7 +288,6 @@ static const struct spi_device_id m25p_ids[] = {
 	 * should be kept for backward compatibility.
 	 */
 	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
-	{"mr25h256"},
 	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
 	{"mx25l25635e"},{"mx66l51235l"},
 	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
@@ -305,6 +304,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
 	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
 
+	/* Everspin MRAMs (non-JEDEC) */
+	{ "mr25h256" }, /* 256 Kib, 40 MHz */
+	{ "mr25h10" },  /*   1 Mib, 40 MHz */
+	{ "mr25h40" },  /*   4 Mib, 40 MHz */
+
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
