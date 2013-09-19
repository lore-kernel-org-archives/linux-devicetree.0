From: Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 3/10] iio: at91_adc: Cocci spatch "noderef"
Date: Thu, 19 Sep 2013 23:42:22 +0200
Message-ID: <1379604755852-604229709-3-diffsplit-thomas@m3y3r.de>
References: <1379604755850-858421494-0-diffsplit-thomas@m3y3r.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379604755850-858421494-0-diffsplit-thomas@m3y3r.de>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@cam.ac.uk, grant.likely@linaro.org, rob.herring@calxeda.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

sizeof when applied to a pointer typed expression gives the size of the
pointer.
Found by coccinelle spatch "misc/noderef.cocci"

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

diff -u -p a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -279,7 +279,7 @@ static int at91_adc_trigger_init(struct
 	int i, ret;
 
 	st->trig = devm_kzalloc(&idev->dev,
-				st->trigger_number * sizeof(st->trig),
+				st->trigger_number * sizeof(*st->trig),
 				GFP_KERNEL);
 
 	if (st->trig == NULL) {
