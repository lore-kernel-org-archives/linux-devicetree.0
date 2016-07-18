From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH 03/10] of: irq: make of_msi_configure accessible from modules
Date: Mon, 18 Jul 2016 14:39:30 -0400
Message-ID: <1468867177-15007-4-git-send-email-okaya@codeaurora.org>
References: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468867177-15007-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The of_msi_configure routine is only accessible by the built-in
kernel drivers. Export this function so that modules can use it
too.

This function is useful for configuring MSI on child device tree
nodes on hierarchical objects.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6ec743f..d84b323 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -762,3 +762,4 @@ void of_msi_configure(struct device *dev, struct device_node *np)
 	dev_set_msi_domain(dev,
 			   of_msi_get_domain(dev, np, DOMAIN_BUS_PLATFORM_MSI));
 }
+EXPORT_SYMBOL_GPL(of_msi_configure);
-- 
1.8.2.1
