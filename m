From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH 1/7] NFC: trf7970a: Don't de-assert EN2 unless it was asserted
Date: Tue, 20 Dec 2016 11:06:02 -0700
Message-ID: <20161220180608.29997-2-mgreer@animalcreek.com>
References: <20161220180608.29997-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161220180608.29997-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When the trf7970a part has the 'en2-rf-quirk', EN2 will not be
asserted by the driver so there is no point in de-asserting it
when powering off.

Signed-off-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 drivers/nfc/trf7970a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 26c9dbbccb0c..92f3cf3e012a 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1914,7 +1914,9 @@ static int trf7970a_power_down(struct trf7970a *trf)
 	}
 
 	gpio_set_value(trf->en_gpio, 0);
-	gpio_set_value(trf->en2_gpio, 0);
+
+	if (!(trf->quirks & TRF7970A_QUIRK_EN2_MUST_STAY_LOW))
+		gpio_set_value(trf->en2_gpio, 0);
 
 	ret = regulator_disable(trf->regulator);
 	if (ret)
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
