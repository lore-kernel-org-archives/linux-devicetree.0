From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/3] regulator: add support for user space controlled regulators
Date: Fri, 16 Dec 2016 16:52:28 +0100
Message-ID: <1481903550-3582-2-git-send-email-bgolaszewski@baylibre.com>
References: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add a new flag to struct regulator_desc indicating whether a regulator
can be controlled from user space and implement a routine in regulator
core allowing to toggle the regulator state via the sysfs 'state'
attribute.

This is useful for gpio power switches.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/regulator/core.c         | 38 +++++++++++++++++++++++++++++++++++++-
 include/linux/regulator/driver.h |  5 +++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 5c1519b..f77de8f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -99,6 +99,7 @@ struct regulator_supply_alias {
 };
 
 static int _regulator_is_enabled(struct regulator_dev *rdev);
+static int _regulator_enable(struct regulator_dev *rdev);
 static int _regulator_disable(struct regulator_dev *rdev);
 static int _regulator_get_voltage(struct regulator_dev *rdev);
 static int _regulator_get_current_limit(struct regulator_dev *rdev);
@@ -401,7 +402,42 @@ static ssize_t regulator_state_show(struct device *dev,
 
 	return ret;
 }
-static DEVICE_ATTR(state, 0444, regulator_state_show, NULL);
+static ssize_t regulator_state_set(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t len)
+{
+	struct regulator_dev *rdev = dev_get_drvdata(dev);
+	bool enable;
+	ssize_t ret;
+
+	if (!rdev->desc->userspace_control)
+		return -EPERM;
+
+	if (sysfs_streq(buf, "enabled\n") || sysfs_streq(buf, "1"))
+		enable = true;
+	else if (sysfs_streq(buf, "disabled\n") || sysfs_streq(buf, "0"))
+		enable = false;
+	else
+		return -EINVAL;
+
+	mutex_lock(&rdev->mutex);
+
+	if ((enable && _regulator_is_enabled(rdev)) ||
+	    (!enable && !_regulator_is_enabled(rdev))) {
+		mutex_unlock(&rdev->mutex);
+		return -EBUSY;
+	}
+
+	ret = enable ? _regulator_enable(rdev) : _regulator_disable(rdev);
+
+	mutex_unlock(&rdev->mutex);
+
+	if (ret)
+		return ret;
+
+	return len;
+}
+static DEVICE_ATTR(state, 0644, regulator_state_show, regulator_state_set);
 
 static ssize_t regulator_status_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 37b5324..0e7ad95 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -293,6 +293,9 @@ enum regulator_type {
  * @off_on_delay: guard time (in uS), before re-enabling a regulator
  *
  * @of_map_mode: Maps a hardware mode defined in a DeviceTree to a standard mode
+ *
+ * @userspace_control: A flag to indicate whether this regulator can be
+ *                     controlled from user-space.
  */
 struct regulator_desc {
 	const char *name;
@@ -347,6 +350,8 @@ struct regulator_desc {
 	unsigned int off_on_delay;
 
 	unsigned int (*of_map_mode)(unsigned int mode);
+
+	unsigned int userspace_control;
 };
 
 /**
-- 
2.9.3
