From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH v3 02/18] drivers/fsi: Add device & driver definitions
Date: Wed,  1 Feb 2017 10:53:42 -0600
Message-ID: <20170201165358.45415-3-cbostic@linux.vnet.ibm.com>
References: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170201165358.45415-1-cbostic@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, gregkh@linuxfoundation.org, mturquette@baylibre.com, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org
Cc: Jeremy Kerr <jk@ozlabs.org>, Chris Bostic <cbostic@us.ibm.com>
List-Id: devicetree@vger.kernel.org

From: Jeremy Kerr <jk@ozlabs.org>

Add structs for fsi devices & drivers, and struct device conversion
functions.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 include/linux/fsi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47aa181..f73886a 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -17,6 +17,17 @@
 
 #include <linux/device.h>
 
+struct fsi_device {
+	struct device dev;
+};
+
+struct fsi_driver {
+	struct device_driver drv;
+};
+
+#define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
+#define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
