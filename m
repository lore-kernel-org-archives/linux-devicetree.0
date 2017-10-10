From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 2/3] of: overlay_mgr: Add ability to apply through sysfs entry
Date: Mon,  9 Oct 2017 22:34:19 -0700
Message-ID: <1507613660-27236-3-git-send-email-john.stultz@linaro.org>
References: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Dmitry Shmidt <dimitrysh@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Dmitry Shmidt <dimitrysh@google.com>

Allow pre-defined overlay_mgr DT fragments to be enabled on the
fly by writing to:
  /sys/devices/platform/overlay_mgr/current_overlay

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Dmitry Shmidt <dimitrysh@google.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
[jstultz: Slightly reworded commit message]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/of/overlay_mgr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/of/overlay_mgr.c b/drivers/of/overlay_mgr.c
index 1fdeb0a..5a082be 100644
--- a/drivers/of/overlay_mgr.c
+++ b/drivers/of/overlay_mgr.c
@@ -18,10 +18,14 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 static char *of_overlay_dt_entry;
 module_param_named(overlay_dt_entry, of_overlay_dt_entry, charp, 0644);
 
+static char *of_overlay_dt_apply;
+DEFINE_MUTEX(of_overlay_mgr_mutex);
+
 static int of_overlay_mgr_apply_overlay(struct device_node *onp)
 {
 	int ret;
@@ -61,8 +65,56 @@ static int of_overlay_mgr_apply_dt(struct device *dev, char *dt_entry)
 	return 0;
 }
 
+static ssize_t current_overlay_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	size_t len;
+
+	mutex_lock(&of_overlay_mgr_mutex);
+	if (!of_overlay_dt_apply) {
+		mutex_unlock(&of_overlay_mgr_mutex);
+		return 0;
+	}
+	len = strlen(of_overlay_dt_apply);
+	if (len >= PAGE_SIZE)
+		len = PAGE_SIZE - 1;
+	memcpy(buf, of_overlay_dt_apply, len + 1);
+	mutex_unlock(&of_overlay_mgr_mutex);
+	return len;
+}
+
+static ssize_t current_overlay_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t size)
+{
+	mutex_lock(&of_overlay_mgr_mutex);
+	kfree(of_overlay_dt_apply);
+	of_overlay_dt_apply = kmalloc(size, GFP_KERNEL);
+	if (!of_overlay_dt_apply) {
+		pr_err("overlay_mgr: fail to allocate memory\n");
+		mutex_unlock(&of_overlay_mgr_mutex);
+		return 0;
+	}
+	memcpy(of_overlay_dt_apply, buf, size);
+	of_overlay_dt_apply[size - 1] = '\0';
+
+	if (of_overlay_mgr_apply_dt(dev, of_overlay_dt_apply)) {
+		kfree(of_overlay_dt_apply);
+		of_overlay_dt_apply = NULL;
+		size = 0;
+	}
+	mutex_unlock(&of_overlay_mgr_mutex);
+	return size;
+}
+
+static DEVICE_ATTR(current_overlay, 0644, current_overlay_show,
+		   current_overlay_store);
+
 static int of_overlay_mgr_probe(struct platform_device *pdev)
 {
+	if (device_create_file(&pdev->dev, &dev_attr_current_overlay))
+		pr_err("overlay_mgr: fail to register apply entry\n");
+
 	if (!of_overlay_dt_entry)
 		return 0;
 	of_overlay_mgr_apply_dt(&pdev->dev, of_overlay_dt_entry);
-- 
2.7.4
