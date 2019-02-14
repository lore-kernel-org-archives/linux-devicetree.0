From: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: [PATCH v4 2/3] PCI: altera: Enable driver on ARM64
Date: Thu, 14 Feb 2019 23:20:37 +0800
Message-ID: <1550157638-25112-3-git-send-email-ley.foon.tan@intel.com>
References: <1550157638-25112-1-git-send-email-ley.foon.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550157638-25112-1-git-send-email-ley.foon.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, lftan.linux@gmail.com, Ley Foon Tan <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

Enable PCIE_ALTERA on ARM64 platform.

Signed-off-by: Ley Foon Tan <ley.foon.tan@intel.com>
---
 drivers/pci/controller/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 6671946..6012f30 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -175,7 +175,7 @@ config PCIE_IPROC_MSI
 
 config PCIE_ALTERA
 	bool "Altera PCIe controller"
-	depends on ARM || NIOS2 || COMPILE_TEST
+	depends on ARM || NIOS2 || ARM64 || COMPILE_TEST
 	help
 	  Say Y here if you want to enable PCIe controller support on Altera
 	  FPGA.
-- 
1.7.1
