From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: cpu of_node links broken
Date: Wed, 05 Apr 2017 16:41:07 +1000
Message-ID: <1491374467.4166.81.camel@kernel.crashing.org>
References: <CAMgXwThQk=3V1HQ8YpoY57mpY0SrdyfAwS5szpsqwkS-r=FPAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMgXwThQk=3V1HQ8YpoY57mpY0SrdyfAwS5szpsqwkS-r=FPAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wesley Terpstra <wesley-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-04 at 23:12 -0700, Wesley Terpstra wrote:
> In commit 5590f3196b293574a12be58d06d5e1120d8856ec symlinks from
> devices to their OF node were added.

Yup. I did that ;)

> Unfortunately, the code looks for them in cpu_dev_init before they
> exist (of_core_init has not run).
> This results in:
> [    0.010000] cpu cpu0: Error -2 creating of_node link
> 
> I don't know if this code used to work and it got broken, but as of
> 4.6 it does not work and still does not work in 4.11. Moving
> of_core_init() before platform_bus_init() in driver_init()
> [drivers/base/init.c] fixes the problem for me.
> 
> Is there any downside to reordering these function calls?

Interesting. I've never seen that error, I wonder if that's because
we fail to link the CPU to an OF node to begin with on our platforms.

I agree though. of_core_init() should probably be called before
we create any device that might have an OF node reference.

In fact we should probably be able to move it right before
platform_bus_init(). Something like this (untested):

[PATCH] drivers/base: Initialize OF sysfs core before creating devices

Devices might try to create symlinks to device-tree nodes,
thus all devices that have OF node linkages should be created
after of_core_init() has been called.

This especially includes cpu_dev_init().

Reported-by: Wesley Terpstra <wesley-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Signed-off-when-somebody-tests-it-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---

diff --git a/drivers/base/init.c b/drivers/base/init.c
index 48c0e22..f65d686 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -28,6 +28,13 @@ void __init driver_init(void)
        firmware_init();
        hypervisor_init();
 
+       /*
+        * This relies on the firmware_kobj already existing
+        * and should be done before any device that might have
+        * an OF link is created
+        */
+       of_core_init();
+
        /* These are also core pieces, but must come after the
         * core core pieces.
         */
@@ -35,5 +42,4 @@ void __init driver_init(void)
        cpu_dev_init();
        memory_dev_init();
        container_dev_init();
-       of_core_init();
 }

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
