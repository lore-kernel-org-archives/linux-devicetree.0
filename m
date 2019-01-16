From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 3/6] gnss: sirf: add support for configurations without wakeup signal
Date: Wed, 16 Jan 2019 22:18:09 +0100
Message-ID: <20190116211812.6337-4-andreas@kemnade.info>
References: <20190116211812.6337-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116211812.6337-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

Some Wi2Wi devices do not have a wakeup output, so device state can
only be indirectly detected by looking whether there is communitcation
over the serial lines.
This approach requires a report cycle set to a low value to be reliable.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v3:
 - was 2/5 earlier
 - changed commit headline
 - more style cleanup
 - split out initial power off as 2/6
 - introduced SIRF_REPORT_CYCLE constant
 - added documentation about limitations
 - ignore first data after power state on so no
   shutdown meassages are treated as power on success
 - clearer logic in sirf_wait_for_power_state

Changes in v2:
 - style cleanup
 - do not keep serdev open just because runtime is active,
   only when needed (gnss device is opened or state is changed)
 - clearer timeout semantics


 drivers/gnss/sirf.c | 117 +++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 93 insertions(+), 24 deletions(-)

diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index c7706b91f6f0..943a2ec9b708 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -25,6 +25,16 @@
 #define SIRF_ON_OFF_PULSE_TIME		100
 #define SIRF_ACTIVATE_TIMEOUT		200
 #define SIRF_HIBERNATE_TIMEOUT		200
+/*
+ * If no data arrives for this time, we expect the chip to be off.
+ * REVISIT: The report cycle is configurable and can be several minutes long,
+ * so this will only work reliably if the report cycle is set to a reasonable
+ * low value. Also power saving settings (like send data only on movement)
+ * might things work even worse.
+ * Workaround might be to parse shutdown or bootup messages.
+ * This problem mainly makes error checking uncertain.
+ */
+#define SIRF_REPORT_CYCLE	2000
 
 struct sirf_data {
 	struct gnss_device *gdev;
@@ -39,9 +49,45 @@ struct sirf_data {
 	struct mutex gdev_mutex;
 	bool open;
 
+	/*
+	 * Using the same mutex inside a serdev callback
+	 * and around a serdev call leads to lockdep problems.
+	 */
+	struct mutex serdev_mutex;
+	int serdev_count;
+
 	wait_queue_head_t power_wait;
 };
 
+static int sirf_serdev_open(struct sirf_data *data)
+{
+	int ret = 0;
+
+	mutex_lock(&data->serdev_mutex);
+	if (++data->serdev_count == 1) {
+		ret = serdev_device_open(data->serdev);
+		if (ret) {
+			data->serdev_count--;
+			mutex_unlock(&data->serdev_mutex);
+			return ret;
+		}
+
+		serdev_device_set_baudrate(data->serdev, data->speed);
+		serdev_device_set_flow_control(data->serdev, false);
+	}
+	mutex_unlock(&data->serdev_mutex);
+
+	return ret;
+}
+
+static void sirf_serdev_close(struct sirf_data *data)
+{
+	mutex_lock(&data->serdev_mutex);
+	if (--data->serdev_count == 0)
+		serdev_device_close(data->serdev);
+	mutex_unlock(&data->serdev_mutex);
+}
+
 static int sirf_open(struct gnss_device *gdev)
 {
 	struct sirf_data *data = gnss_get_drvdata(gdev);
@@ -52,7 +98,7 @@ static int sirf_open(struct gnss_device *gdev)
 	data->open = true;
 	mutex_unlock(&data->gdev_mutex);
 
-	ret = serdev_device_open(serdev);
+	ret = sirf_serdev_open(data);
 	if (ret) {
 		mutex_lock(&data->gdev_mutex);
 		data->open = false;
@@ -60,10 +106,6 @@ static int sirf_open(struct gnss_device *gdev)
 		return ret;
 	}
 
-
-	serdev_device_set_baudrate(serdev, data->speed);
-	serdev_device_set_flow_control(serdev, false);
-
 	ret = pm_runtime_get_sync(&serdev->dev);
 	if (ret < 0) {
 		dev_err(&gdev->dev, "failed to runtime resume: %d\n", ret);
@@ -74,7 +116,7 @@ static int sirf_open(struct gnss_device *gdev)
 	return 0;
 
 err_close:
-	serdev_device_close(serdev);
+	sirf_serdev_close(data);
 
 	mutex_lock(&data->gdev_mutex);
 	data->open = false;
@@ -88,7 +130,7 @@ static void sirf_close(struct gnss_device *gdev)
 	struct sirf_data *data = gnss_get_drvdata(gdev);
 	struct serdev_device *serdev = data->serdev;
 
-	serdev_device_close(serdev);
+	sirf_serdev_close(data);
 
 	pm_runtime_put(&serdev->dev);
 
@@ -128,6 +170,11 @@ static int sirf_receive_buf(struct serdev_device *serdev,
 	struct gnss_device *gdev = data->gdev;
 	int ret = 0;
 
+	if (!data->wakeup && !data->active) {
+		data->active = true;
+		wake_up_interruptible(&data->power_wait);
+	}
+
 	mutex_lock(&data->gdev_mutex);
 	if (data->open)
 		ret = gnss_insert_raw(gdev, buf, count);
@@ -163,6 +210,24 @@ static int sirf_wait_for_power_state(struct sirf_data *data, bool active,
 {
 	int ret;
 
+	if (!data->wakeup) {
+		/* Wait for boot or shutdown messages */
+		msleep(timeout);
+		data->active = false;
+		/* Now check if it is really off. */
+		ret = wait_event_interruptible_timeout(data->power_wait,
+					data->active,
+					msecs_to_jiffies(SIRF_REPORT_CYCLE));
+		if (ret < 0)
+			return ret;
+
+		if ((ret > 0 && !active) ||
+		    (ret == 0 && active))
+			return -ETIMEDOUT;
+
+		return 0;
+	}
+
 	ret = wait_event_interruptible_timeout(data->power_wait,
 			data->active == active, msecs_to_jiffies(timeout));
 	if (ret < 0)
@@ -195,18 +260,29 @@ static int sirf_set_active(struct sirf_data *data, bool active)
 	else
 		timeout = SIRF_HIBERNATE_TIMEOUT;
 
+	if (!data->wakeup) {
+		ret = sirf_serdev_open(data);
+		if (ret)
+			return ret;
+	}
+
 	do {
-		sirf_pulse_on_off(data);
+		/*
+		 * Try to avoid unneeded, time-consuming state toggles
+		 * in the configurations without wakeup signal. This counts
+		 * especially for the initial off state check.
+		 */
+		if (data->wakeup || data->active || active)
+			sirf_pulse_on_off(data);
+
 		ret = sirf_wait_for_power_state(data, active, timeout);
-		if (ret < 0) {
-			if (ret == -ETIMEDOUT)
-				continue;
+	} while (ret == -ETIMEDOUT && retries--);
 
-			return ret;
-		}
+	if (!data->wakeup)
+		sirf_serdev_close(data);
 
-		break;
-	} while (retries--);
+	if (ret)
+		return ret;
 
 	if (retries < 0)
 		return -ETIMEDOUT;
@@ -303,6 +379,7 @@ static int sirf_probe(struct serdev_device *serdev)
 	data->gdev = gdev;
 
 	mutex_init(&data->gdev_mutex);
+	mutex_init(&data->serdev_mutex);
 	init_waitqueue_head(&data->power_wait);
 
 	serdev_device_set_drvdata(serdev, data);
@@ -329,15 +406,6 @@ static int sirf_probe(struct serdev_device *serdev)
 		if (IS_ERR(data->wakeup))
 			goto err_put_device;
 
-		/*
-		 * Configurations where WAKEUP has been left not connected,
-		 * are currently not supported.
-		 */
-		if (!data->wakeup) {
-			dev_err(dev, "no wakeup gpio specified\n");
-			ret = -ENODEV;
-			goto err_put_device;
-		}
 	}
 
 	if (data->wakeup) {
@@ -421,6 +489,7 @@ static void sirf_remove(struct serdev_device *serdev)
 static const struct of_device_id sirf_of_match[] = {
 	{ .compatible = "fastrax,uc430" },
 	{ .compatible = "linx,r4" },
+	{ .compatible = "wi2wi,w2sg0004" },
 	{ .compatible = "wi2wi,w2sg0008i" },
 	{ .compatible = "wi2wi,w2sg0084i" },
 	{},
-- 
2.11.0
