From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 02/10] PCI: cadence: Move cadence drivers back to
 controller directory
Date: Mon,  2 Apr 2018 09:02:12 +0800
Message-ID: <1522630932-151438-1-git-send-email-shawn.lin@rock-chips.com>
References: <1522630865-151344-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1522630865-151344-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

No functional change intended.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 MAINTAINERS                                        |  2 +-
 drivers/pci/Kconfig                                |  1 -
 drivers/pci/Makefile                               |  1 -
 drivers/pci/cadence/Kconfig                        | 27 ---------------------
 drivers/pci/cadence/Makefile                       |  4 ----
 drivers/pci/controller/Kconfig                     | 28 ++++++++++++++++++++++
 drivers/pci/controller/Makefile                    |  3 +++
 .../pci/{cadence => controller}/pcie-cadence-ep.c  |  0
 .../{cadence => controller}/pcie-cadence-host.c    |  0
 drivers/pci/{cadence => controller}/pcie-cadence.c |  0
 drivers/pci/{cadence => controller}/pcie-cadence.h |  0
 11 files changed, 32 insertions(+), 34 deletions(-)
 delete mode 100644 drivers/pci/cadence/Kconfig
 delete mode 100644 drivers/pci/cadence/Makefile
 rename drivers/pci/{cadence => controller}/pcie-cadence-ep.c (100%)
 rename drivers/pci/{cadence => controller}/pcie-cadence-host.c (100%)
 rename drivers/pci/{cadence => controller}/pcie-cadence.c (100%)
 rename drivers/pci/{cadence => controller}/pcie-cadence.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a4e5971..42c02e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10667,7 +10667,7 @@ M:	Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
 L:	linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/cdns,*.txt
-F:	drivers/pci/cadence/pcie-cadence*
+F:	drivers/pci/controller/pcie-cadence*
 
 PCI DRIVER FOR FREESCALE LAYERSCAPE
 M:	Minghuan Lian <minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index b759b29..49e4d18 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -137,7 +137,6 @@ config PCI_HYPERV
           PCI devices from a PCI backend to support PCI driver domains.
 
 source "drivers/pci/hotplug/Kconfig"
-source "drivers/pci/cadence/Kconfig"
 source "drivers/pci/controller/Kconfig"
 source "drivers/pci/dwc/Kconfig"
 source "drivers/pci/endpoint/Kconfig"
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 7769641..5a8a015 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -33,7 +33,6 @@ obj-y				+= switch/
 # Endpoint library must be initialized before its users
 obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
 
-obj-$(CONFIG_PCIE_CADENCE)	+= cadence/
 # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
 obj-y				+= dwc/
 
diff --git a/drivers/pci/cadence/Kconfig b/drivers/pci/cadence/Kconfig
deleted file mode 100644
index e6824cb..0000000
--- a/drivers/pci/cadence/Kconfig
+++ /dev/null
@@ -1,27 +0,0 @@
-menu "Cadence PCIe controllers support"
-
-config PCIE_CADENCE
-	bool
-
-config PCIE_CADENCE_HOST
-	bool "Cadence PCIe host controller"
-	depends on OF
-	depends on PCI
-	select IRQ_DOMAIN
-	select PCIE_CADENCE
-	help
-	  Say Y here if you want to support the Cadence PCIe controller in host
-	  mode. This PCIe controller may be embedded into many different vendors
-	  SoCs.
-
-config PCIE_CADENCE_EP
-	bool "Cadence PCIe endpoint controller"
-	depends on OF
-	depends on PCI_ENDPOINT
-	select PCIE_CADENCE
-	help
-	  Say Y here if you want to support the Cadence PCIe  controller in
-	  endpoint mode. This PCIe controller may be embedded into many
-	  different vendors SoCs.
-
-endmenu
diff --git a/drivers/pci/cadence/Makefile b/drivers/pci/cadence/Makefile
deleted file mode 100644
index 719392b..0000000
--- a/drivers/pci/cadence/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_PCIE_CADENCE) += pcie-cadence.o
-obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
-obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 7af83af..6a569a1 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -19,6 +19,34 @@ config PCI_AARDVARK
 	 controller is part of the South Bridge of the Marvel Armada
 	 3700 SoC.
 
+menu "Cadence PCIe controllers support"
+
+config PCIE_CADENCE
+	bool
+
+config PCIE_CADENCE_HOST
+	bool "Cadence PCIe host controller"
+	depends on OF
+	depends on PCI
+	select IRQ_DOMAIN
+	select PCIE_CADENCE
+	help
+	  Say Y here if you want to support the Cadence PCIe controller in host
+	  mode. This PCIe controller may be embedded into many different vendors
+	  SoCs.
+
+config PCIE_CADENCE_EP
+	bool "Cadence PCIe endpoint controller"
+	depends on OF
+	depends on PCI_ENDPOINT
+	select PCIE_CADENCE
+	help
+	  Say Y here if you want to support the Cadence PCIe  controller in
+	  endpoint mode. This PCIe controller may be embedded into many
+	  different vendors SoCs.
+
+endmenu
+
 config PCIE_XILINX_NWL
 	bool "NWL PCIe Core"
 	depends on ARCH_ZYNQMP
diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
index 3b10591..6474638 100644
--- a/drivers/pci/controller/Makefile
+++ b/drivers/pci/controller/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PCIE_CADENCE) += pcie-cadence.o
+obj-$(CONFIG_PCIE_CADENCE_HOST) += pcie-cadence-host.o
+obj-$(CONFIG_PCIE_CADENCE_EP) += pcie-cadence-ep.o
 obj-$(CONFIG_PCI_FTPCI100) += pci-ftpci100.o
 obj-$(CONFIG_PCI_HYPERV) += pci-hyperv.o
 obj-$(CONFIG_PCI_MVEBU) += pci-mvebu.o
diff --git a/drivers/pci/cadence/pcie-cadence-ep.c b/drivers/pci/controller/pcie-cadence-ep.c
similarity index 100%
rename from drivers/pci/cadence/pcie-cadence-ep.c
rename to drivers/pci/controller/pcie-cadence-ep.c
diff --git a/drivers/pci/cadence/pcie-cadence-host.c b/drivers/pci/controller/pcie-cadence-host.c
similarity index 100%
rename from drivers/pci/cadence/pcie-cadence-host.c
rename to drivers/pci/controller/pcie-cadence-host.c
diff --git a/drivers/pci/cadence/pcie-cadence.c b/drivers/pci/controller/pcie-cadence.c
similarity index 100%
rename from drivers/pci/cadence/pcie-cadence.c
rename to drivers/pci/controller/pcie-cadence.c
diff --git a/drivers/pci/cadence/pcie-cadence.h b/drivers/pci/controller/pcie-cadence.h
similarity index 100%
rename from drivers/pci/cadence/pcie-cadence.h
rename to drivers/pci/controller/pcie-cadence.h
-- 
1.9.1
