From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/5] gnss: sirf: write data to gnss only when the gnss device is open
Date: Sun, 18 Nov 2018 22:57:57 +0100
Message-ID: <20181118215801.12280-2-andreas@kemnade.info>
References: <20181118215801.12280-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118215801.12280-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

The api forbids writing data there otherwise. Prepare for the
serdev_open()/close() being a part of runtime pm.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gnss/sirf.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index 79cb98950013..b5efbb062316 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -34,6 +34,7 @@ struct sirf_data {
 	struct gpio_desc *wakeup;
 	int irq;
 	bool active;
+	bool opened;
 	wait_queue_head_t power_wait;
 };
 
@@ -43,6 +44,7 @@ static int sirf_open(struct gnss_device *gdev)
 	struct serdev_device *serdev = data->serdev;
 	int ret;
 
+	data->opened = true;
 	ret = serdev_device_open(serdev);
 	if (ret)
 		return ret;
@@ -54,6 +56,7 @@ static int sirf_open(struct gnss_device *gdev)
 	if (ret < 0) {
 		dev_err(&gdev->dev, "failed to runtime resume: %d\n", ret);
 		pm_runtime_put_noidle(&serdev->dev);
+		data->opened = false;
 		goto err_close;
 	}
 
@@ -73,6 +76,7 @@ static void sirf_close(struct gnss_device *gdev)
 	serdev_device_close(serdev);
 
 	pm_runtime_put(&serdev->dev);
+	data->opened = false;
 }
 
 static int sirf_write_raw(struct gnss_device *gdev, const unsigned char *buf,
@@ -105,7 +109,17 @@ static int sirf_receive_buf(struct serdev_device *serdev,
 	struct sirf_data *data = serdev_device_get_drvdata(serdev);
 	struct gnss_device *gdev = data->gdev;
 
-	return gnss_insert_raw(gdev, buf, count);
+	/*
+	 * we might come here everytime when runtime is resumed
+	 * and data is received. Two cases are possible
+	 * 1. device is opened during initialisation
+	 * 2. kernel is compiled without runtime pm
+	 *    and device is opened all the time
+	 */
+	if (data->opened)
+		return gnss_insert_raw(gdev, buf, count);
+
+	return 0;
 }
 
 static const struct serdev_device_ops sirf_serdev_ops = {
-- 
2.11.0
