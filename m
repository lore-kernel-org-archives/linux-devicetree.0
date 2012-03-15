From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] max17042_battery: fix a couple buffer overflows
Date: Thu, 15 Mar 2012 14:37:32 +0300
Message-ID: <20120315113732.GA364@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Anton Vorontsov <anton.vorontsov@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philip Rakity <prakity@marvell.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There are a couple issues here caused by confusion between sizeof()
and ARRAY_SIZE().  "table_size" should be the number of elements, but we
should allocate it with kcalloc() so that we allocate the correct number
of bytes.

In max17042_init_model() we don't allocate enough space so we go past
the end of the array in max17042_read_model_data() and
max17042_model_data_compare().

In max17042_verify_model_lock() we allocate the right amount of space
but we call max17042_read_model_data() with the wrong number of elements
and also in the for loop we go past the end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have this hardware.  The original code is clearly buggy, but I
can't test that my fix is correct.  Please review carefully.

diff --git a/drivers/power/max17042_battery.c b/drivers/power/max17042_battery.c
index e36763a..f8cd48c 100644
--- a/drivers/power/max17042_battery.c
+++ b/drivers/power/max17042_battery.c
@@ -328,11 +328,10 @@ static inline int max17042_model_data_compare(struct max17042_chip *chip,
 static int max17042_init_model(struct max17042_chip *chip)
 {
 	int ret;
-	int table_size =
-		sizeof(chip->pdata->config_data->cell_char_tbl)/sizeof(u16);
+	int table_size = ARRAY_SIZE(chip->pdata->config_data->cell_char_tbl);
 	u16 *temp_data;
 
-	temp_data = kzalloc(table_size, GFP_KERNEL);
+	temp_data = kcalloc(table_size, sizeof(*temp_data), GFP_KERNEL);
 	if (!temp_data)
 		return -ENOMEM;
 
@@ -357,12 +356,11 @@ static int max17042_init_model(struct max17042_chip *chip)
 static int max17042_verify_model_lock(struct max17042_chip *chip)
 {
 	int i;
-	int table_size =
-		sizeof(chip->pdata->config_data->cell_char_tbl);
+	int table_size = ARRAY_SIZE(chip->pdata->config_data->cell_char_tbl);
 	u16 *temp_data;
 	int ret = 0;
 
-	temp_data = kzalloc(table_size, GFP_KERNEL);
+	temp_data = kcalloc(table_size, sizeof(*temp_data), GFP_KERNEL);
 	if (!temp_data)
 		return -ENOMEM;
 
