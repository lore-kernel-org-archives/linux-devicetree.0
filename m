From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/3] rtc: honor device tree /alias entries when assigning IDs
Date: Mon,  9 Dec 2013 15:06:48 -0700
Message-ID: <1386626809-6251-2-git-send-email-swarren@wwwdotorg.org>
References: <1386626809-6251-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386626809-6251-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Assign RTC device IDs based on device tree /aliases entries if present,
falling back to the existing numbering scheme if there is no /aliases
entry (which includes when the system isn't booted using DT), or there
is a numbering conflict.

This is useful in systems with multiple RTC devices, to ensure that the
best RTC device is selected as /dev/rtc0, which provides the overall
system time.

For example, Tegra has an on-SoC RTC that is not battery backed,
typically coupled with an off-SoC RTC that is battery backed. Only the
latter is useful for populating the system time, yet the former is
useful e.g. for wakeup timing, since the time is not lost when the
system is sleeps.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
The 3 patches in this series are all independent; they can be applied
to their respective subsystems in any order. I'm simply posting them as
a series to make the use-case more obvious.
---
 drivers/rtc/class.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 02426812bebc..7989b5d030cb 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -14,6 +14,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/rtc.h>
 #include <linux/kdev_t.h>
 #include <linux/idr.h>
@@ -157,12 +158,25 @@ struct rtc_device *rtc_device_register(const char *name, struct device *dev,
 {
 	struct rtc_device *rtc;
 	struct rtc_wkalrm alrm;
-	int id, err;
+	int of_id, id = -1, err;
+
+	if (dev->of_node) {
+		of_id = of_alias_get_id(dev->of_node, "rtc");
+		if (of_id >= 0) {
+			id = ida_simple_get(&rtc_ida, of_id, of_id + 1,
+					    GFP_KERNEL);
+			if (id < 0)
+				dev_warn(dev, "/aliases ID %d not available\n",
+					 of_id);
+		}
+	}
 
-	id = ida_simple_get(&rtc_ida, 0, 0, GFP_KERNEL);
 	if (id < 0) {
-		err = id;
-		goto exit;
+		id = ida_simple_get(&rtc_ida, 0, 0, GFP_KERNEL);
+		if (id < 0) {
+			err = id;
+			goto exit;
+		}
 	}
 
 	rtc = kzalloc(sizeof(struct rtc_device), GFP_KERNEL);
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
