From: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 10/10] NFC: st95hf: add of match table
Date: Tue, 24 Jul 2018 10:54:26 +0200
Message-ID: <20180724085426.23999-11-daniel@zonque.org>
References: <20180724085426.23999-1-daniel@zonque.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180724085426.23999-1-daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, shikha.singh-qxv4g6HH51o@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a match table for device tree compatible strings. Interestingly, a
document describing the bindings already exists since a while, but users
currently rely on the implicit matching in the drivers core. Let's be
explicit and add a real match table.

Signed-off-by: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/nfc/st95hf/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 4db3c020921c..5a01b454fbc4 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1012,6 +1012,12 @@ static const struct spi_device_id st95hf_id[] = {
 };
 MODULE_DEVICE_TABLE(spi, st95hf_id);
 
+static const struct of_device_id st95hf_of_match[] = {
+	{ .compatible = "st,st95hf", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, st95hf_of_match);
+
 static int st95hf_probe(struct spi_device *nfc_spi_dev)
 {
 	int ret;
@@ -1189,6 +1195,7 @@ static struct spi_driver st95hf_driver = {
 	.driver = {
 		.name = "st95hf",
 		.owner = THIS_MODULE,
+		.of_match_table = st95hf_of_match,
 	},
 	.id_table = st95hf_id,
 	.probe = st95hf_probe,
-- 
2.17.1
