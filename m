From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.9 120/125] of: device: Export of_device_{get_modalias, uvent_modalias} to modules
Date: Tue, 25 Jul 2017 12:20:35 -0700
Message-ID: <20170725192020.880134322@linuxfoundation.org>
References: <20170725192014.314851996@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725192014.314851996@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>, Peter Chen <peter.chen@nxp.com>
List-Id: devicetree@vger.kernel.org

4.9-stable review patch.  If anyone has any objections, please let me know.

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
