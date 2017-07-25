From: <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Patch "of: device: Export of_device_{get_modalias, uvent_modalias} to modules" has been added to the 3.18-stable tree
Date: Tue, 25 Jul 2017 11:25:18 -0700
Message-ID: <150100711852254@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, peter.chen-3arQi8VN3Tc@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    of: device: Export of_device_{get_modalias, uvent_modalias} to modules

to the 3.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     of-device-export-of_device_-get_modalias-uvent_modalias-to-modules.patch
and it can be found in the queue-3.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> know about it.


>From 7a3b7cd332db08546f3cdd984f11773e0d1999e7 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Wed, 28 Dec 2016 14:56:48 -0800
Subject: of: device: Export of_device_{get_modalias, uvent_modalias} to modules

From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

commit 7a3b7cd332db08546f3cdd984f11773e0d1999e7 upstream.

The ULPI bus can be built as a module, and it will soon be
calling these functions when it supports probing devices from DT.
Export them so they can be used by the ULPI module.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

---
 drivers/of/device.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -128,6 +128,7 @@ ssize_t of_device_get_modalias(struct de
 
 	return tsize;
 }
+EXPORT_SYMBOL_GPL(of_device_get_modalias);
 
 /**
  * of_device_uevent - Display OF related uevent information
@@ -190,3 +191,4 @@ int of_device_uevent_modalias(struct dev
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_device_uevent_modalias);


Patches currently in stable-queue which might be from stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org are

queue-3.18/of-device-export-of_device_-get_modalias-uvent_modalias-to-modules.patch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
