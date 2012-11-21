From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: [PATCH] of: Have of_device_add call platform_device_add rather
 than device_add
Date: Wed, 21 Nov 2012 00:24:48 -0700
Message-ID: <20121121072448.GG19837@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This allows platform_device_add a chance to call insert_resource
on all of the resources from OF. At a minimum this fills in proc/iomem
and presumably makes resource tracking and conflict detection work
better.

Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
---
 drivers/of/device.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

Tested on PPC32 and ARM32 embedded kernels.

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 4c74e4f..a5b67dc 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -62,7 +62,7 @@ int of_device_add(struct platform_device *ofdev)
 	if (!ofdev->dev.parent)
 		set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
 
-	return device_add(&ofdev->dev);
+	return platform_device_add(ofdev);
 }
 
 int of_device_register(struct platform_device *pdev)
-- 
1.7.4.1
