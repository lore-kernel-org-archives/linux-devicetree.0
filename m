From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v3 1/7] NFC: trf7970a: Don't de-assert EN2 unless it was asserted
Date: Fri, 20 Jan 2017 12:17:39 -0700
Message-ID: <20170120191745.29255-2-mgreer@animalcreek.com>
References: <20170120191745.29255-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120191745.29255-1-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When the trf7970a part has the bug related to 'en2-rf-quirk',
the GPIO connected to the EN2 pin will not be asserted by the
driver when powering up so it shouldn't be de-asserted when
powering down.

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
