From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2] of/platform: Mark all device tree resources as SHARED
Date: Fri,  5 Jun 2015 12:51:18 +0200
Message-ID: <1433501478-15164-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433501478-15164-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Vivek Goyal <vgoyal@redhat.com>, Jakub Sitnicki <jsitnicki@gmail.com>, Mike Travis <travis@sgi.com>, Jiang Liu <jiang.liu@linux.intel.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Tejun Heo <tj@kernel.org>, Cliff Wickman <cpw@sgi.com>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

Some device tree platform do not define their resources properly. i.e.
overlapping or repeated resources.

This patch mark all device tree resources as shareable.

In the future this should only be set for the platforms that have
problems.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/of/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index ddf8e42c9367..89cb502f8812 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -136,6 +136,8 @@ struct platform_device *of_device_alloc(struct device_node *np,
 		if (of_irq_to_resource_table(np, res, num_irq) != num_irq)
 			pr_debug("not all legacy IRQ resources mapped for %s\n",
 				 np->name);
+		for (i = 0; i < num_reg + num_irq; i++, res++)
+			dev->resource[i].flags |= IORESOURCE_SHARED;
 	}
 
 	dev->dev.of_node = of_node_get(np);
-- 
2.1.4
