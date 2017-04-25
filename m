From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v5 3/9] NFC: trf7970a: Fix inaccurate comment in trf7970a_probe()
Date: Tue, 25 Apr 2017 15:43:50 -0700
Message-ID: <20170425224356.11498-4-mgreer@animalcreek.com>
References: <20170425224356.11498-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170425224356.11498-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As of commit ce69b95ca4e4 ("NFC: Make EN2 pin optional in the
TRF7970A driver"), only the GPIO for the 'EN' enable pin needs
to be specified in the device tree so update the comments that
says both 'EN' and 'EN2' must be specified.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 drivers/nfc/trf7970a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 1a87525a88cd..5d5a8b0e57d4 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2046,7 +2046,7 @@ static int trf7970a_probe(struct spi_device *spi)
 	if (of_property_read_bool(np, "irq-status-read-quirk"))
 		trf->quirks |= TRF7970A_QUIRK_IRQ_STATUS_READ;
 
-	/* There are two enable pins - both must be present */
+	/* There are two enable pins - only EN must be present in the DT */
 	trf->en_gpio = of_get_named_gpio(np, "ti,enable-gpios", 0);
 	if (!gpio_is_valid(trf->en_gpio)) {
 		dev_err(trf->dev, "No EN GPIO property\n");
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
