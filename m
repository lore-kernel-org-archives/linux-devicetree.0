From: Krzysztof Wilczynski <kw-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] PCI: Remove unused includes and superfluous struct declaration
Date: Sun,  1 Sep 2019 13:25:06 +0200
Message-ID: <20190901112506.8469-1-kw@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove <linux/pci.h> and <linux/msi.h> from being included
directly as part of the include/linux/of_pci.h, and remove
superfluous declaration of struct of_phandle_args.

Move users of include <linux/of_pci.h> to include <linux/pci.h>
and <linux/msi.h> directly rather than rely on both being
included transitively through <linux/of_pci.h>.

Signed-off-by: Krzysztof Wilczynski <kw-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
---
 drivers/iommu/of_iommu.c                          | 2 ++
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 drivers/pci/controller/pci-aardvark.c             | 1 +
 drivers/pci/pci.c                                 | 1 +
 drivers/pci/probe.c                               | 1 +
 include/linux/of_pci.h                            | 4 +---
 6 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 614a93aa5305..026ad2b29dcd 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -8,6 +8,8 @@
 #include <linux/export.h>
 #include <linux/iommu.h>
 #include <linux/limits.h>
+#include <linux/pci.h>
+#include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_iommu.h>
 #include <linux/of_pci.h>
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index d3156446ff27..7a9bef993e57 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -10,6 +10,7 @@
 
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/pci_regs.h>
diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index fc0fe4d4de49..3a05f6ca95b0 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -16,6 +16,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/msi.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 484e35349565..571e7e00984b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/init.h>
+#include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 169943f17a4c..11b11a652d18 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/msi.h>
 #include <linux/of_device.h>
 #include <linux/of_pci.h>
 #include <linux/pci_hotplug.h>
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 21a89c4880fa..7929b4c0e886 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -2,11 +2,9 @@
 #ifndef __OF_PCI_H
 #define __OF_PCI_H
 
-#include <linux/pci.h>
-#include <linux/msi.h>
+#include <linux/types.h>
 
 struct pci_dev;
-struct of_phandle_args;
 struct device_node;
 
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PCI)
-- 
2.23.0
