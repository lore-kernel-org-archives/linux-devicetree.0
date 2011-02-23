From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH] dt: add a match table pointer to struct device
Date: Tue, 22 Feb 2011 19:52:34 -0700
Message-ID: <20110223025233.25131.47193.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new .of_match field to struct device which points at the
matching device driver .of_match_table entry when a device is probed
via the device tree

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---
 include/linux/device.h    |    1 +
 include/linux/of_device.h |    5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index ca5d252..8d8e267 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -441,6 +441,7 @@ struct device {
 	struct dev_archdata	archdata;
 
 	struct device_node	*of_node; /* associated device tree node */
+	const struct of_device_id *of_match; /* matching of_device_id from driver */
 
 	dev_t			devt;	/* dev_t, creates the sysfs "dev" */
 
diff --git a/include/linux/of_device.h b/include/linux/of_device.h
index 975d347..8bfe6c1 100644
--- a/include/linux/of_device.h
+++ b/include/linux/of_device.h
@@ -18,10 +18,11 @@ extern void of_device_make_bus_id(struct device *dev);
  * @drv: the device_driver structure to test
  * @dev: the device structure to match against
  */
-static inline int of_driver_match_device(const struct device *dev,
+static inline int of_driver_match_device(struct device *dev,
 					 const struct device_driver *drv)
 {
-	return of_match_device(drv->of_match_table, dev) != NULL;
+	dev->of_match = of_match_device(drv->of_match_table, dev);
+	return dev->of_match != NULL;
 }
 
 extern struct platform_device *of_dev_get(struct platform_device *dev);
