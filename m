From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v3 4/8] Documentation: ABI: Add aspeed-xdma sysfs documentation
Date: Wed, 29 May 2019 13:10:04 -0500
Message-ID: <1559153408-31190-5-git-send-email-eajames@linux.ibm.com>
References: <1559153408-31190-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559153408-31190-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Document the pcidev sysfs attribute used by the aspeed-xdma driver.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-devices-platform-aspeed-xdma | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-aspeed-xdma

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-aspeed-xdma b/Documentation/ABI/testing/sysfs-devices-platform-aspeed-xdma
new file mode 100644
index 0000000..27189bbd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-aspeed-xdma
@@ -0,0 +1,11 @@
+What:		/sys/bus/platform/devices/1e6e7000.xdma/pcidev
+Date:		May 2019
+KernelVersion:	5.2
+Contact:	Eddie James <eajames@linux.ibm.com>
+Description:	When written, this file sets the PCI device that will be used
+		for DMA operations by the XDMA engine. When read, it provides
+		the current PCI device being used by the XDMA engine.
+		Valid values: vga or bmc.
+		Default vga, can be set by aspeed-xdma.pcidev= module
+		parameter.
+Users:		aspeed-xdma driver
-- 
1.8.3.1
