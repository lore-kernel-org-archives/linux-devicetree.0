From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] mtd: bcm47xxpart: add of_match_table with a new DT binding
Date: Fri, 12 Jan 2018 10:33:54 +0100
Message-ID: <20180112093354.17593-2-zajec5@gmail.com>
References: <20180112093354.17593-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180112093354.17593-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This allows using bcm47xxpart parser to support DT describing partitions
on a flash using "brcm,bcm947xx-cfe-partitions" compatible property. It
means this parser doesn't have to be explicitly selected by a flash
driver anymore. It can be used e.g. together with a generic m25p80 /
spi-nor if device is just properly described.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 drivers/mtd/bcm47xxpart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index fe2581d9d882..4bc2ad842eee 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -290,9 +290,16 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	return curr_part;
 };
 
+static const struct of_device_id bcm47xxpart_of_match_table[] = {
+	{ .compatible = "brcm,bcm947xx-cfe-partitions" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bcm47xxpart_of_match_table);
+
 static struct mtd_part_parser bcm47xxpart_mtd_parser = {
 	.parse_fn = bcm47xxpart_parse,
 	.name = "bcm47xxpart",
+	.of_match_table = bcm47xxpart_of_match_table,
 };
 module_mtd_part_parser(bcm47xxpart_mtd_parser);
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
