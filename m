From: Richard Tresidder <rtresidd@electromag.com.au>
Subject: [RESEND v2 2/2] power/supply/sbs-battery: Add ability to force load a battery via the devicetree
Date: Tue, 30 Jul 2019 18:10:04 +0800
Message-ID: <1564481404-39505-3-git-send-email-rtresidd@electromag.com.au>
References: <1564481404-39505-1-git-send-email-rtresidd@electromag.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564481404-39505-1-git-send-email-rtresidd@electromag.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, rtresidd@electromag.com.au, kstewart@linuxfoundation.org, gregkh@linuxfoundation.org, tglx@linutronix.de, rfontana@redhat.com, allison@lohutok.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the ability to force load a hot pluggable battery during boot where
there is no gpio detect method available and the module is statically
built. Normal polling will then occur on that battery when it is inserted.

Signed-off-by: Richard Tresidder <rtresidd@electromag.com.au>
---
 drivers/power/supply/sbs-battery.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/sbs-battery.c b/drivers/power/supply/sbs-battery.c
index 048d205..b55721d 100644
--- a/drivers/power/supply/sbs-battery.c
+++ b/drivers/power/supply/sbs-battery.c
@@ -816,6 +816,7 @@ static int sbs_probe(struct i2c_client *client,
 	struct power_supply_config psy_cfg = {};
 	int rc;
 	int irq;
+	bool dt_force_load;
 
 	sbs_desc = devm_kmemdup(&client->dev, &sbs_default_desc,
 			sizeof(*sbs_desc), GFP_KERNEL);
@@ -852,6 +853,9 @@ static int sbs_probe(struct i2c_client *client,
 	if (rc)
 		chip->poll_retry_count = 0;
 
+	dt_force_load = of_property_read_bool(client->dev.of_node,
+						"sbs,force-load");
+
 	if (pdata) {
 		chip->poll_retry_count = pdata->poll_retry_count;
 		chip->i2c_retry_count  = pdata->i2c_retry_count;
@@ -890,7 +894,7 @@ static int sbs_probe(struct i2c_client *client,
 	 * Before we register, we might need to make sure we can actually talk
 	 * to the battery.
 	 */
-	if (!(force_load || chip->gpio_detect)) {
+	if (!(force_load || chip->gpio_detect || dt_force_load)) {
 		rc = sbs_read_word_data(client, sbs_data[REG_STATUS].addr);
 
 		if (rc < 0) {
-- 
1.8.3.1
