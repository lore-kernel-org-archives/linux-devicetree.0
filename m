From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3 4/4] of/platform: Use platform_device interface
Date: Wed, 22 Apr 2015 18:14:21 +0200
Message-ID: <1429719261-18024-5-git-send-email-ricardo.ribalda@gmail.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

of_platform_device_create_pdata() was using of_device_add() to create
the devices, but of_platform_device_destroy was using
of_platform_device_destroy().

of_device_add(), do not call insert_resource(), which initializes the
parent field of the resource structure, needed by release_resource(),
called by of_platform_device_destroy().

This leads to a NULL pointer deference.

This patch, replaces of_device_add() with platform_device_data().

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/of/platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a01f57c..f011f57 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -183,8 +183,9 @@ static struct platform_device *of_platform_device_create_pdata(
 	dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
 	of_dma_configure(&dev->dev, dev->dev.of_node);
+	dev->name = dev_name(&dev->dev);
 
-	if (of_device_add(dev) != 0) {
+	if (platform_device_add(dev) != 0) {
 		of_dma_deconfigure(&dev->dev);
 		platform_device_put(dev);
 		goto err_clear_flag;
-- 
2.1.4
