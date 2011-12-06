From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5 v2] power: sbs-battery: Change power supply name
Date: Mon,  5 Dec 2011 17:50:49 -0800
Message-ID: <1323136249-4134-5-git-send-email-rklein@nvidia.com>
References: <1323136249-4134-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323136249-4134-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The power supply name used to be fixed as "battery". This change allows
for multiple batteries by generating the name rather than using a fixed
value.

v2: simplified kasprintf and cleaned up unneeded member of sbs_info.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/power/sbs-battery.c |   19 ++++++++++++++++---
 1 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/power/sbs-battery.c b/drivers/power/sbs-battery.c
index 00bd9e0..b677b88 100644
--- a/drivers/power/sbs-battery.c
+++ b/drivers/power/sbs-battery.c
@@ -682,15 +682,24 @@ static int __devinit sbs_probe(struct i2c_client *client,
 	struct sbs_platform_data *pdata = client->dev.platform_data;
 	int rc;
 	int irq;
+	char *name;
 
-	chip = kzalloc(sizeof(struct sbs_info), GFP_KERNEL);
-	if (!chip)
+	name = kasprintf(GFP_KERNEL, "sbs-%s", dev_name(&client->dev));
+	if (!name) {
+		dev_err(&client->dev, "Failed to allocate device name\n");
 		return -ENOMEM;
+	}
+
+	chip = kzalloc(sizeof(struct sbs_info), GFP_KERNEL);
+	if (!chip) {
+		rc = -ENOMEM;
+		goto exit_free_name;
+	}
 
 	chip->client = client;
 	chip->enable_detection = false;
 	chip->gpio_detect = false;
-	chip->power_supply.name = "battery";
+	chip->power_supply.name = name;
 	chip->power_supply.type = POWER_SUPPLY_TYPE_BATTERY;
 	chip->power_supply.properties = sbs_properties;
 	chip->power_supply.num_properties = ARRAY_SIZE(sbs_properties);
@@ -775,6 +784,9 @@ exit_psupply:
 
 	kfree(chip);
 
+exit_free_name:
+	kfree(name);
+
 	return rc;
 }
 
@@ -791,6 +803,7 @@ static int __devexit sbs_remove(struct i2c_client *client)
 
 	cancel_delayed_work_sync(&chip->work);
 
+	kfree(chip->power_supply.name);
 	kfree(chip);
 	chip = NULL;
 
-- 
1.7.0.4
