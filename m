From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 1/2] kernel/resource: Add new flag IORESOURCE_SHARED
Date: Fri,  5 Jun 2015 12:51:17 +0200
Message-ID: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Vivek Goyal <vgoyal@redhat.com>, Jakub Sitnicki <jsitnicki@gmail.com>, Mike Travis <travis@sgi.com>, Jiang Liu <jiang.liu@linux.intel.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Tejun Heo <tj@kernel.org>, Cliff Wickman <cpw@sgi.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

Some device tree platforms have not defined correctly their memory
resources (i.e. Overlapping or duplication of resources).
To avoid this issue we have historically avoided to add their resources to
the resource tree. This leads to code duplication and oops when trying to
unload dynamically a device tree (feature introduced recently).

This new flag tells the resource system that a resource can be shared by
multiple owners, so we can support device trees with problems at the
same time that we do not duplicate code or crash when unloading the
device tree.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 include/linux/ioport.h | 1 +
 kernel/resource.c      | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 388e3ae94f7a..f4d992381529 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -49,6 +49,7 @@ struct resource {
 #define IORESOURCE_WINDOW	0x00200000	/* forwarded by bridge */
 #define IORESOURCE_MUXED	0x00400000	/* Resource is software muxed */
 
+#define IORESOURCE_SHARED	0x04000000	/* Resource can be shared */
 #define IORESOURCE_EXCLUSIVE	0x08000000	/* Userland may not map this resource */
 #define IORESOURCE_DISABLED	0x10000000
 #define IORESOURCE_UNSET	0x20000000	/* No address assigned yet */
diff --git a/kernel/resource.c b/kernel/resource.c
index 90552aab5f2d..4a3626489b62 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -210,6 +210,7 @@ static struct resource * __request_resource(struct resource *root, struct resour
 	resource_size_t start = new->start;
 	resource_size_t end = new->end;
 	struct resource *tmp, **p;
+	bool root_shared = root && root->flags & IORESOURCE_SHARED;
 
 	if (end < start)
 		return root;
@@ -220,14 +221,15 @@ static struct resource * __request_resource(struct resource *root, struct resour
 	p = &root->child;
 	for (;;) {
 		tmp = *p;
-		if (!tmp || tmp->start > end) {
+		if (!tmp || tmp->start > end ||
+			(root_shared && tmp->start > start)) {
 			new->sibling = tmp;
 			*p = new;
 			new->parent = root;
 			return NULL;
 		}
 		p = &tmp->sibling;
-		if (tmp->end < start)
+		if (tmp->end < start || root_shared)
 			continue;
 		return tmp;
 	}
-- 
2.1.4
