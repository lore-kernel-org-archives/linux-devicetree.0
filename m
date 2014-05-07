From: Frank Rowand <frowand.list@gmail.com>
Subject: [RFC PATCH 2/3] devicetree: provide hook to allow setting devicetree
 device name
Date: Tue, 06 May 2014 17:52:32 -0700
Message-ID: <536983D0.8090307@gmail.com>
References: <536982E3.10303@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <536982E3.10303@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, Josh Cartwright <joshc@codeaurora.org>, Courtney Cavin <courtney.cavin@sonymobile.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sonymobile.com>

Optionally push devicetree device naming into a function called dynamically by
of_device_alloc().

TODO:
   Change made to of_device_alloc() could also be made to
   of_amba_device_create()

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
---
 drivers/of/platform.c |    2 ++
 include/linux/of.h    |    2 ++
 3 files changed, 43 insertions(+)

Index: b/drivers/of/platform.c
===================================================================
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -179,6 +179,8 @@ struct platform_device *of_device_alloc(
 
 	if (bus_id)
 		dev_set_name(&dev->dev, "%s", bus_id);
+	else if (np->parent->of_device_make_bus_id)
+		np->parent->of_device_make_bus_id(&dev->dev);
 	else
 		of_device_make_bus_id(&dev->dev);
 
Index: b/include/linux/of.h
===================================================================
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -17,6 +17,7 @@
  */
 #include <linux/types.h>
 #include <linux/bitops.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kobject.h>
 #include <linux/mod_devicetable.h>
@@ -60,6 +61,7 @@ struct device_node {
 	struct	kobject kobj;
 	unsigned long _flags;
 	void	*data;
+	void    (*of_device_make_bus_id)(struct device *dev);
 #if defined(CONFIG_SPARC)
 	const char *path_component_name;
 	unsigned int unique_id;
