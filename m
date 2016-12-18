From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v6 4/6] [media] rc-ir-raw: do not generate any receiving thread
 for raw transmitters
Date: Sun, 18 Dec 2016 20:11:36 +0900
Message-ID: <20161218111138.12831-5-andi.shyti@samsung.com>
References: <20161218111138.12831-1-andi.shyti@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
In-reply-to: <20161218111138.12831-1-andi.shyti@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>
List-Id: devicetree@vger.kernel.org

Raw IR transmitters do not need any thread listening for
occurring events. Check the driver type before running the
thread.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Reviewed-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-ir-raw.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 1c42a9f2f290..9938e42e0c0b 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -270,12 +270,19 @@ int ir_raw_event_register(struct rc_dev *dev)
 	INIT_KFIFO(dev->raw->kfifo);
 
 	spin_lock_init(&dev->raw->lock);
-	dev->raw->thread = kthread_run(ir_raw_event_thread, dev->raw,
-				       "rc%u", dev->minor);
 
-	if (IS_ERR(dev->raw->thread)) {
-		rc = PTR_ERR(dev->raw->thread);
-		goto out;
+	/*
+	 * raw transmitters do not need any event registration
+	 * because the event is coming from userspace
+	 */
+	if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
+		dev->raw->thread = kthread_run(ir_raw_event_thread, dev->raw,
+					       "rc%u", dev->minor);
+
+		if (IS_ERR(dev->raw->thread)) {
+			rc = PTR_ERR(dev->raw->thread);
+			goto out;
+		}
 	}
 
 	mutex_lock(&ir_raw_handler_lock);
-- 
2.11.0
