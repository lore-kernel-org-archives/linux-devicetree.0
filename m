From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v2 20/21] PCI: keystone: Reorder header file in alphabetical order
Date: Wed, 17 Oct 2018 13:11:13 +0530
Message-ID: <20181017074114.28239-21-kishon@ti.com>
References: <20181017074114.28239-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017074114.28239-1-kishon@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

No functional change. Reorder header file in alphabetical order.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index e9e646acc2d5..0cfeaad1d013 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -9,19 +9,19 @@
  * Implementation based on pci-exynos.c and pcie-designware.c
  */
 
-#include <linux/irqchip/chained_irq.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
-#include <linux/init.h>
 #include <linux/mfd/syscon.h>
 #include <linux/msi.h>
-#include <linux/of_irq.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_pci.h>
-#include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/resource.h>
 #include <linux/signal.h>
-- 
2.17.1
