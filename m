From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3.18 56/60] of: device: Export of_device_{get_modalias, uvent_modalias} to modules
Date: Tue, 25 Jul 2017 12:16:47 -0700
Message-ID: <20170725191622.090725432@linuxfoundation.org>
References: <20170725191614.043749784@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725191614.043749784@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>, Peter Chen <peter.chen@nxp.com>
List-Id: devicetree@vger.kernel.org

3.18-stable review patch.  If anyone has any objections, please let me know.

------------------

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
