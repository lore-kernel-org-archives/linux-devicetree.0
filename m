From: <gregkh@linuxfoundation.org>
Subject: Patch "of: device: Export of_device_{get_modalias, uvent_modalias} to modules" has been added to the 4.4-stable tree
Date: Tue, 25 Jul 2017 11:29:44 -0700
Message-ID: <150100738419215@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: stephen.boyd@linaro.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, peter.chen@nxp.com, robh@kernel.org
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org
List-Id: devicetree@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    of: device: Export of_device_{get_modalias, uvent_modalias} to modules

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     of-device-export-of_device_-get_modalias-uvent_modalias-to-modules.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 7a3b7cd332db08546f3cdd984f11773e0d1999e7 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <stephen.boyd@linaro.org>
Date: Wed, 28 Dec 2016 14:56:48 -0800
Subject: of: device: Export of_device_{get_modalias, uvent_modalias} to modules

From: Stephen Boyd <stephen.boyd@linaro.org>

commit 7a3b7cd332db08546f3cdd984f11773e0d1999e7 upstream.

The ULPI bus can be built as a module, and it will soon be
calling these functions when it supports probing devices from DT.
Export them so they can be used by the ULPI module.

Acked-by: Rob Herring <robh@kernel.org>
Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/of/device.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -225,6 +225,7 @@ ssize_t of_device_get_modalias(struct de
 
 	return tsize;
 }
+EXPORT_SYMBOL_GPL(of_device_get_modalias);
 
 /**
  * of_device_uevent - Display OF related uevent information
@@ -287,3 +288,4 @@ int of_device_uevent_modalias(struct dev
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_device_uevent_modalias);


Patches currently in stable-queue which might be from stephen.boyd@linaro.org are

queue-4.4/of-device-export-of_device_-get_modalias-uvent_modalias-to-modules.patch
