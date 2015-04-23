From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/4] base/platform: Only insert MEM and IO resources
Date: Thu, 23 Apr 2015 15:58:11 +0200
Message-ID: <1429797494-29242-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1429797494-29242-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429797494-29242-1-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

platform_device_del only checks the type of the resource in order to
call release_resource.

On the other hand, platform_device_add calls insert_resource for any
resource that has a parent.

Make both code branches balanced.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/base/platform.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index ebf034b..6028681 100644
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
