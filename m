From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v7 11/18] v4l: async: Register sub-devices before calling bound callback
Date: Sun,  3 Sep 2017 20:49:51 +0300
Message-ID: <20170903174958.27058-12-sakari.ailus@linux.intel.com>
References: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se, robh@kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, pavel@ucw.cz, sre@kernel.org
List-Id: devicetree@vger.kernel.org

Register the sub-device before calling the notifier's bound callback.
Doing this the other way around is problematic as the struct v4l2_device
has not assigned for the sub-device yet and may be required by the bound
callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 91d04f00b4e4..70d02378b48f 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -107,13 +107,13 @@ static int v4l2_async_test_notify(struct v4l2_async_notifier *notifier,
 {
 	int ret;
 
-	ret = v4l2_async_notifier_call_int_op(notifier, bound, sd, asd);
+	ret = v4l2_device_register_subdev(notifier->v4l2_dev, sd);
 	if (ret < 0)
 		return ret;
 
-	ret = v4l2_device_register_subdev(notifier->v4l2_dev, sd);
+	ret = v4l2_async_notifier_call_int_op(notifier, bound, sd, asd);
 	if (ret < 0) {
-		v4l2_async_notifier_call_void_op(notifier, unbind, sd, asd);
+		v4l2_device_unregister_subdev(sd);
 		return ret;
 	}
 
-- 
2.11.0
