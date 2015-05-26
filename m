From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 1/4] base/platform: Only insert MEM and IO resources
Date: Tue, 26 May 2015 09:31:23 +0200
Message-ID: <1432625486-15442-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1432625486-15442-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432625486-15442-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

platform_device_del only checks the type of the resource in order to
call release_resource.

On the other hand, platform_device_add calls insert_resource for any
resource that has a parent.

Make both code branches balanced.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/base/platform.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 063f0ab15259..46a56f694cec 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -341,19 +341,23 @@ int platform_device_add(struct platform_device *pdev)
 
 	for (i = 0; i < pdev->num_resources; i++) {
 		struct resource *p, *r = &pdev->resource[i];
+		unsigned long type = resource_type(r);
 
 		if (r->name == NULL)
 			r->name = dev_name(&pdev->dev);
 
+		if (!(type == IORESOURCE_MEM || type == IORESOURCE_IO))
+			continue;
+
 		p = r->parent;
 		if (!p) {
-			if (resource_type(r) == IORESOURCE_MEM)
+			if (type == IORESOURCE_MEM)
 				p = &iomem_resource;
-			else if (resource_type(r) == IORESOURCE_IO)
+			else if (type == IORESOURCE_IO)
 				p = &ioport_resource;
 		}
 
-		if (p && insert_resource(p, r)) {
+		if (insert_resource(p, r)) {
 			dev_err(&pdev->dev, "failed to claim resource %d\n", i);
 			ret = -EBUSY;
 			goto failed;
-- 
2.1.4
