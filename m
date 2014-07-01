From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v8 7/9] pci: of: Parse and map the IRQ when adding the PCI
 device.
Date: Tue,  1 Jul 2014 19:43:32 +0100
Message-ID: <1404240214-9804-8-git-send-email-Liviu.Dudau@arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>
Cc: Device Tree ML <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Enhance the default implementation of pcibios_add_device() to
parse and map the IRQ of the device if a DT binding is available.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 drivers/pci/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 63a54a3..8e65dc3 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/log2.h>
+#include <linux/of_pci.h>
 #include <linux/pci-aspm.h>
 #include <linux/pm_wakeup.h>
 #include <linux/interrupt.h>
@@ -1453,6 +1454,9 @@ EXPORT_SYMBOL(pcim_pin_device);
  */
 int __weak pcibios_add_device(struct pci_dev *dev)
 {
+#ifdef CONFIG_OF
+	dev->irq = of_irq_parse_and_map_pci(dev, 0, 0);
+#endif
 	return 0;
 }
 
-- 
2.0.0
