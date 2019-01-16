From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 1/6] gnss: sirf: write data to gnss only when the gnss device is open
Date: Wed, 16 Jan 2019 22:18:07 +0100
Message-ID: <20190116211812.6337-2-andreas@kemnade.info>
References: <20190116211812.6337-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116211812.6337-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

The api forbids writing data there otherwise. Prepare for the
serdev_open()/close() being a part of sirf_set_active.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v3:
 - add more locking
 - style cleanup 
 - mutex *not* renamed since we need a second one

Changes in v2:
 - add locking

 drivers/gnss/sirf.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index 226f6e6fe01b..b21e14351b82 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -35,6 +35,10 @@ struct sirf_data {
 	struct gpio_desc *wakeup;
 	int irq;
 	bool active;
+
+	struct mutex gdev_mutex;
+	bool open;
+
 	wait_queue_head_t power_wait;
 };
 
@@ -44,9 +48,18 @@ static int sirf_open(struct gnss_device *gdev)
 	struct serdev_device *serdev = data->serdev;
 	int ret;
 
+	mutex_lock(&data->gdev_mutex);
+	data->open = true;
+	mutex_unlock(&data->gdev_mutex);
+
 	ret = serdev_device_open(serdev);
-	if (ret)
+	if (ret) {
+		mutex_lock(&data->gdev_mutex);
+		data->open = false;
+		mutex_unlock(&data->gdev_mutex);
 		return ret;
+	}
+
 
 	serdev_device_set_baudrate(serdev, data->speed);
 	serdev_device_set_flow_control(serdev, false);
@@ -63,6 +76,10 @@ static int sirf_open(struct gnss_device *gdev)
 err_close:
 	serdev_device_close(serdev);
 
+	mutex_lock(&data->gdev_mutex);
+	data->open = false;
+	mutex_unlock(&data->gdev_mutex);
+
 	return ret;
 }
 
@@ -74,6 +91,10 @@ static void sirf_close(struct gnss_device *gdev)
 	serdev_device_close(serdev);
 
 	pm_runtime_put(&serdev->dev);
+
+	mutex_lock(&data->gdev_mutex);
+	data->open = false;
+	mutex_unlock(&data->gdev_mutex);
 }
 
 static int sirf_write_raw(struct gnss_device *gdev, const unsigned char *buf,
@@ -105,8 +126,14 @@ static int sirf_receive_buf(struct serdev_device *serdev,
 {
 	struct sirf_data *data = serdev_device_get_drvdata(serdev);
 	struct gnss_device *gdev = data->gdev;
+	int ret = 0;
 
-	return gnss_insert_raw(gdev, buf, count);
+	mutex_lock(&data->gdev_mutex);
+	if (data->open)
+		ret = gnss_insert_raw(gdev, buf, count);
+	mutex_unlock(&data->gdev_mutex);
+
+	return ret;
 }
 
 static const struct serdev_device_ops sirf_serdev_ops = {
@@ -275,6 +302,7 @@ static int sirf_probe(struct serdev_device *serdev)
 	data->serdev = serdev;
 	data->gdev = gdev;
 
+	mutex_init(&data->gdev_mutex);
 	init_waitqueue_head(&data->power_wait);
 
 	serdev_device_set_drvdata(serdev, data);
-- 
2.11.0
