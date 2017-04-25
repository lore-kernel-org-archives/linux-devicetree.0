From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v4 4/9] NFC: trf7970a: Only check 'en2-rf-quirk' if EN2 is specified
Date: Tue, 25 Apr 2017 11:40:31 -0700
Message-ID: <20170425184036.1212-5-mgreer@animalcreek.com>
References: <20170425184036.1212-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170425184036.1212-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The quirk indicated by the 'en2-rf-quirk' device tree property
is only relevant when there is a GPIO connected to the EN2 pin
of the trf7970a. This means we should only check for 'en2-rf-quirk'
when EN2 is specified in the 'ti,enable-gpios' property of the
device tree.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 drivers/nfc/trf7970a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 5d5a8b0e57d4..4655680b0e7b 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -2070,6 +2070,9 @@ static int trf7970a_probe(struct spi_device *spi)
 			dev_err(trf->dev, "Can't request EN2 GPIO: %d\n", ret);
 			return ret;
 		}
+
+		if (of_property_read_bool(np, "en2-rf-quirk"))
+			trf->quirks |= TRF7970A_QUIRK_EN2_MUST_STAY_LOW;
 	}
 
 	of_property_read_u32(np, "clock-frequency", &clk_freq);
@@ -2081,9 +2084,6 @@ static int trf7970a_probe(struct spi_device *spi)
 		return -EINVAL;
 	}
 
-	if (of_property_read_bool(np, "en2-rf-quirk"))
-		trf->quirks |= TRF7970A_QUIRK_EN2_MUST_STAY_LOW;
-
 	ret = devm_request_threaded_irq(trf->dev, spi->irq, NULL,
 			trf7970a_irq, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 			"trf7970a", trf);
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
