From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 5/7] [media] ir-lirc-codec: don't wait any transmitting
 time for tx only devices
Date: Tue, 01 Nov 2016 15:51:11 +0900
Message-ID: <20161101065111.hofyxjps2iwmxpzj@gangnam.samsung>
References: <20161027143601.GA5103@gofer.mess.org>
 <20160901171629.15422-1-andi.shyti@samsung.com>
 <20160901171629.15422-6-andi.shyti@samsung.com>
 <CGME20160902084206epcas1p26e535506ec1c418ede9ba230d40f0656@epcas1p2.samsung.com>
 <20160902084158.GA25342@gofer.mess.org>
 <20161027074401.wxg5icc6hcpwnfsf@gangnam.samsung>
 <7e2f88ed83c4044c30bc03aaea9f09e1@hardeman.nu>
 <20161031170526.GA8183@gofer.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-disposition: inline
In-reply-to: <20161031170526.GA8183-3XSxi2G4b3iXFJAUJl40Xg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: David =?iso-8859-15?Q?H=E4rdeman?= <david-0WFrdVpeebksCylrc8G9yg@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sean,

> Andi, it would be good to know what the use-case for the original change is.

the use case is the ir-spi itself which doesn't need the lirc to
perform any waiting on its behalf.

To me it just doesn't look right to simulate a fake transmission
period and wait unnecessary time. Of course, the "over-wait" is not
a big deal and at the end we can decide to drop it.

Otherwise, an alternative could be to add the boolean
'tx_no_wait' in the rc_dev structure. It could be set by the
device driver during the initialization and the we can follow
your approach.

Something like this:

diff --git a/drivers/media/rc/ir-lirc-codec.c b/drivers/media/rc/ir-lirc-codec.c
index c327730..4553d04 100644
--- a/drivers/media/rc/ir-lirc-codec.c
+++ b/drivers/media/rc/ir-lirc-codec.c
@@ -161,15 +161,19 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char __user *buf,
 
        ret *= sizeof(unsigned int);
 
-       /*
-        * The lircd gap calculation expects the write function to
-        * wait for the actual IR signal to be transmitted before
-        * returning.
-        */
-       towait = ktime_us_delta(ktime_add_us(start, duration), ktime_get());
-       if (towait > 0) {
-               set_current_state(TASK_INTERRUPTIBLE);
-               schedule_timeout(usecs_to_jiffies(towait));
+       if (!dev->tx_no_wait) {
+               /*
+                * The lircd gap calculation expects the write function to
+                * wait for the actual IR signal to be transmitted before
+                * returning.
+                */
+               towait = ktime_us_delta(ktime_add_us(start, duration),
+                                                               ktime_get());
+               if (towait > 0) {
+                       set_current_state(TASK_INTERRUPTIBLE);
+                       schedule_timeout(usecs_to_jiffies(towait));
+               }
+
        }
 
 out:
diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index fcda1e4..e44abfa 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -149,6 +149,7 @@ static int ir_spi_probe(struct spi_device *spi)
        if (!idata->rc)
                return -ENOMEM;
 
+       idata->rc->tx_no_wait      = true;
        idata->rc->tx_ir           = ir_spi_tx;
        idata->rc->s_tx_carrier    = ir_spi_set_tx_carrier;
        idata->rc->s_tx_duty_cycle = ir_spi_set_duty_cycle;
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index fe0c9c4..c3ced9b 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -85,6 +85,9 @@ enum rc_filter_type {
  * @input_dev: the input child device used to communicate events to userspace
  * @driver_type: specifies if protocol decoding is done in hardware or software
  * @idle: used to keep track of RX state
+ * @tx_no_wait: decides whether to perform or not a sync write or not. The
+ *      device driver setting it to true must make sure to not break the ABI
+ *      which requires a sync transfer.
  * @allowed_protocols: bitmask with the supported RC_BIT_* protocols
  * @enabled_protocols: bitmask with the enabled RC_BIT_* protocols
  * @allowed_wakeup_protocols: bitmask with the supported RC_BIT_* wakeup protocols
@@ -147,6 +150,7 @@ struct rc_dev {
        struct input_dev                *input_dev;
        enum rc_driver_type             driver_type;
        bool                            idle;
+       bool                            tx_no_wait;
        u64                             allowed_protocols;
        u64                             enabled_protocols;
        u64                             allowed_wakeup_protocols;

Thanks,
Andi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
