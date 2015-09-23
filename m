From: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 2/2] rc: gpio-ir-recv: add timeout on idle
Date: Wed, 23 Sep 2015 07:07:08 -0700
Message-ID: <1443017228-16499-1-git-send-email-eric@nelint.com>
References: <5602AE95.9000505@nelint.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5602AE95.9000505-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org, Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Many decoders require a trailing space (period without IR illumination)
to be delivered before completing a decode.

Since the gpio-ir-recv driver only delivers events on gpio transitions,
a single IR symbol (caused by a quick touch on an IR remote) will not
be properly decoded without the use of a timer to flush the tail end
state of the IR receiver.

This patch initializes and uses a timer and the timeout field of rcdev
to complete the stream and allow decode.

The timeout can be overridden through the use of the LIRC_SET_REC_TIMEOUT
ioctl.

Signed-off-by: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
---
V2 uses the timeout field of the rcdev instead of a device tree 
field to set the timeout value as suggested by Sean Young.

V3 fixes whitespace, simplifies timer setup and adds a del_timer_sync
as suggested by Sean Young.

 drivers/media/rc/gpio-ir-recv.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/rc/gpio-ir-recv.c b/drivers/media/rc/gpio-ir-recv.c
index 7dbc9ca..f62e3f1 100644
--- a/drivers/media/rc/gpio-ir-recv.c
+++ b/drivers/media/rc/gpio-ir-recv.c
@@ -30,6 +30,7 @@ struct gpio_rc_dev {
 	struct rc_dev *rcdev;
 	int gpio_nr;
 	bool active_low;
+	struct timer_list flush_timer;
 };
 
 #ifdef CONFIG_OF
@@ -93,12 +94,26 @@ static irqreturn_t gpio_ir_recv_irq(int irq, void *dev_id)
 	if (rc < 0)
 		goto err_get_value;
 
+	mod_timer(&gpio_dev->flush_timer,
+		  jiffies + nsecs_to_jiffies(gpio_dev->rcdev->timeout));
+
 	ir_raw_event_handle(gpio_dev->rcdev);
 
 err_get_value:
 	return IRQ_HANDLED;
 }
 
+static void flush_timer(unsigned long arg)
+{
+	struct gpio_rc_dev *gpio_dev = (struct gpio_rc_dev *)arg;
+	DEFINE_IR_RAW_EVENT(ev);
+
+	ev.timeout = true;
+	ev.duration = gpio_dev->rcdev->timeout;
+	ir_raw_event_store(gpio_dev->rcdev, &ev);
+	ir_raw_event_handle(gpio_dev->rcdev);
+}
+
 static int gpio_ir_recv_probe(struct platform_device *pdev)
 {
 	struct gpio_rc_dev *gpio_dev;
@@ -144,6 +159,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 	rcdev->input_id.version = 0x0100;
 	rcdev->dev.parent = &pdev->dev;
 	rcdev->driver_name = GPIO_IR_DRIVER_NAME;
+	rcdev->min_timeout = 0;
+	rcdev->timeout = IR_DEFAULT_TIMEOUT;
+	rcdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	if (pdata->allowed_protos)
 		rcdev->allowed_protocols = pdata->allowed_protos;
 	else
@@ -154,6 +172,9 @@ static int gpio_ir_recv_probe(struct platform_device *pdev)
 	gpio_dev->gpio_nr = pdata->gpio_nr;
 	gpio_dev->active_low = pdata->active_low;
 
+	setup_timer(&gpio_dev->flush_timer, flush_timer,
+		    (unsigned long)gpio_dev);
+
 	rc = gpio_request(pdata->gpio_nr, "gpio-ir-recv");
 	if (rc < 0)
 		goto err_gpio_request;
@@ -196,6 +217,7 @@ static int gpio_ir_recv_remove(struct platform_device *pdev)
 	struct gpio_rc_dev *gpio_dev = platform_get_drvdata(pdev);
 
 	free_irq(gpio_to_irq(gpio_dev->gpio_nr), gpio_dev);
+	del_timer_sync(&gpio_dev->flush_timer);
 	rc_unregister_device(gpio_dev->rcdev);
 	gpio_free(gpio_dev->gpio_nr);
 	kfree(gpio_dev);
-- 
2.5.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
