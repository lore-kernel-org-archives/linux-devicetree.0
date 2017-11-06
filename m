From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.16 023/294] of: device: Export of_device_{get_modalias,
 uvent_modalias} to modules
Date: Mon, 06 Nov 2017 23:03:02 +0000
Message-ID: <lsq.1510009382.734792232@decadent.org.uk>
References: <lsq.1510009377.526284287@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <lsq.1510009377.526284287@decadent.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: devicetree@vger.kernel.org

3.16.50-rc1 review patch.  If anyone has any objections, please let me know.

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
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/of/device.c | 2 ++
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
