From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v6 3/4] pmbus (core): Add virtual page config bit
Date: Mon, 20 Nov 2017 15:12:05 +1030
Message-ID: <57d31e056da37bab946a42c30c1aa4f0a0a595f1.1511152748.git-series.andrew@aj.id.au>
References: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew-zrmu5oMJ5Fs@public.gmane.org>
In-Reply-To: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew-zrmu5oMJ5Fs@public.gmane.org>
References: <cover.dfb0a63462b38b9384b1d077fd62d17a11a7a0dd.1511152748.git-series.andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some circumstances call for virtual pages, to expose multiple values
packed into an extended PMBus register in a manner non-compliant with
the PMBus standard. An example of this is the Maxim MAX31785 controller, which
extends the READ_FAN_SPEED_1 PMBus register from two to four bytes to support
tach readings for both rotors of a dual rotor fan. This extended register
contains two word-sized values, one reporting the rate of the fastest rotor,
the other the rate of the slowest. The concept of virtual pages aids this
situation by mapping the page number onto the value to be selected from the
vectored result.

We should not try to set virtual pages on the device as such a page explicitly
doesn't exist; add a flag so we can avoid doing so.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 27 ++++++++++++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index b54d7604d3ef..d39d506aa63e 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -372,6 +372,8 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_PWM12	BIT(20)
 #define PMBUS_HAVE_PWM34	BIT(21)
 
+#define PMBUS_PAGE_VIRTUAL	BIT(31)
+
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13 };
 
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index edc25efe7552..e215bbd403a5 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -161,18 +161,27 @@ EXPORT_SYMBOL_GPL(pmbus_clear_cache);
 int pmbus_set_page(struct i2c_client *client, int page)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	int rv = 0;
-	int newpage;
+	int rv;
+
+	if (page < 0 || page == data->currpage)
+		return 0;
 
-	if (page >= 0 && page != data->currpage) {
+	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		if (newpage != page)
-			rv = -EIO;
-		else
-			data->currpage = page;
+		if (rv < 0)
+			return rv;
+
+		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+		if (rv < 0)
+			return rv;
+
+		if (rv != page)
+			return -EIO;
 	}
-	return rv;
+
+	data->currpage = page;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_set_page);
 
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
