Return-Path: <SRS0=hnDX=IS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:34377 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754372AbeEaUmx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 May 2018 16:42:53 -0400
Received: by mail-pl0-f68.google.com with SMTP id ay10-v6so13919549plb.1
        for <devicetree@vger.kernel.org>; Thu, 31 May 2018 13:42:53 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] HID: i2c-hid: Add vddl regulator control
Date: Thu, 31 May 2018 13:42:50 -0700
Message-Id: <20180531204250.209216-1-swboyd@chromium.org>
Sender: devicetree-owner@vger.kernel.org
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dtor@chromium.org>, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Some wacom w9013 devices have a vddl supply for "low voltage"
requirements. Add support in this driver to turn on this low voltage
supply.

Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dtor@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/input/hid-over-i2c.txt           |  3 ++-
 drivers/hid/i2c-hid/i2c-hid.c                 | 19 +++++++++++++++++++
 include/linux/platform_data/i2c-hid.h         |  2 ++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
index 4d3da9d91de4..89e6ab89ba38 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
@@ -26,7 +26,8 @@ device-specific compatible properties, which should be used in addition to the
 
 - compatible:
   * "wacom,w9013" (Wacom W9013 digitizer). Supports:
-    - vdd-supply
+    - vdd-supply (3.3V)
+    - vddl-supply (1.8V)
     - post-power-on-delay-ms
 
 - vdd-supply: phandle of the regulator that provides the supply voltage.
diff --git a/drivers/hid/i2c-hid/i2c-hid.c b/drivers/hid/i2c-hid/i2c-hid.c
index 6e803f361249..b6f02f98fec6 100644
--- a/drivers/hid/i2c-hid/i2c-hid.c
+++ b/drivers/hid/i2c-hid/i2c-hid.c
@@ -1032,12 +1032,29 @@ static int i2c_hid_probe(struct i2c_client *client,
 		goto err;
 	}
 
+	ihid->pdata.supply_l = devm_regulator_get(&client->dev, "vddl");
+	if (IS_ERR(ihid->pdata.supply_l)) {
+		ret = PTR_ERR(ihid->pdata.supply_l);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&client->dev, "Failed to get regulator: %d\n",
+				ret);
+		goto err;
+	}
+
 	ret = regulator_enable(ihid->pdata.supply);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to enable regulator: %d\n",
 			ret);
 		goto err;
 	}
+
+	ret = regulator_enable(ihid->pdata.supply_l);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to enable low regulator: %d\n",
+			ret);
+		goto err_regulator_l;
+	}
+
 	if (ihid->pdata.post_power_delay_ms)
 		msleep(ihid->pdata.post_power_delay_ms);
 
@@ -1124,6 +1141,8 @@ static int i2c_hid_probe(struct i2c_client *client,
 	pm_runtime_disable(&client->dev);
 
 err_regulator:
+	regulator_disable(ihid->pdata.supply_l);
+err_regulator_l:
 	regulator_disable(ihid->pdata.supply);
 
 err:
diff --git a/include/linux/platform_data/i2c-hid.h b/include/linux/platform_data/i2c-hid.h
index 1fb088239d12..1e4612751adf 100644
--- a/include/linux/platform_data/i2c-hid.h
+++ b/include/linux/platform_data/i2c-hid.h
@@ -20,6 +20,7 @@ struct regulator;
  * struct i2chid_platform_data - used by hid over i2c implementation.
  * @hid_descriptor_address: i2c register where the HID descriptor is stored.
  * @supply: regulator for powering on the device.
+ * @supply_l: regulator for powering on the low voltage supply for device.
  * @post_power_delay_ms: delay after powering on before device is usable.
  *
  * Note that it is the responsibility of the platform driver (or the acpi 5.0
@@ -36,6 +37,7 @@ struct regulator;
 struct i2c_hid_platform_data {
 	u16 hid_descriptor_address;
 	struct regulator *supply;
+	struct regulator *supply_l;
 	int post_power_delay_ms;
 };
 
-- 
Sent by a computer through tubes

