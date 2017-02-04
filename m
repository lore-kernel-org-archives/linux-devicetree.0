From: <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: patch "of: device: Export of_device_{get_modalias, uvent_modalias} to" added to usb-testing
Date: Sat, 04 Feb 2017 09:14:46 +0100
Message-ID: <1486196086207228@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    of: device: Export of_device_{get_modalias, uvent_modalias} to

to my usb git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
in the usb-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the usb-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


>From 7a3b7cd332db08546f3cdd984f11773e0d1999e7 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Wed, 28 Dec 2016 14:56:48 -0800
Subject: of: device: Export of_device_{get_modalias, uvent_modalias} to
 modules

The ULPI bus can be built as a module, and it will soon be
calling these functions when it supports probing devices from DT.
Export them so they can be used by the ULPI module.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
---
 drivers/of/device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 8a22a253a830..b1e6bebda3f3 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -225,6 +225,7 @@ ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 
 	return tsize;
 }
+EXPORT_SYMBOL_GPL(of_device_get_modalias);
 
 int of_device_request_module(struct device *dev)
 {
@@ -310,3 +311,4 @@ int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_device_uevent_modalias);
-- 
2.11.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
