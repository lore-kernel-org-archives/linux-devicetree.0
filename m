From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V4 5/5] usb: host: Add ability to build new Broadcom STB USB drivers
Date: Fri,  9 Nov 2018 09:02:00 -0500
Message-ID: <1541772120-40394-6-git-send-email-alcooperx@gmail.com>
References: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@li>
List-Id: devicetree@vger.kernel.org

Add the build system changes needed to get the Broadcom STB XHCI,
EHCI and OHCI functionality working. The link order for XHCI was
changed in the Makefile because of the way STB XHCI, EHCI and OHCI
controllers share a port which requires that the XHCI driver be
initialized first. Also update MAINTAINERS.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 MAINTAINERS                         |  9 +++++++++
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/usb/host/Kconfig            | 26 ++++++++++++++++++++++++++
 drivers/usb/host/Makefile           | 18 ++++++++++++------
 5 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f3eba4484aa..932fcc6f8ff5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2998,6 +2998,15 @@ S:	Supported
 F:	drivers/i2c/busses/i2c-brcmstb.c
 F:	Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt
 
+BROADCOM BRCMSTB USB XHCI, EHCI and OHCI DRIVERS
+M:	Al Cooper <alcooperx@gmail.com>
+L:	linux-usb@vger.kernel.org
+L:	bcm-kernel-feedback-list@broadcom.com
+S:	Maintained
+F:	drivers/usb/host/ehci-brcm.*
+F:	drivers/usb/host/xhci-brcm.*
+F:	Documentation/devicetree/bindings/usb/brcm,bcm7445-*.txt
+
 BROADCOM BRCMSTB USB2 and USB3 PHY DRIVER
 M:	Al Cooper <alcooperx@gmail.com>
 L:	linux-kernel@vger.kernel.org
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 63af6234c1b6..64ca0edb43ed 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -726,6 +726,7 @@ CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_ISP1760=y
 CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_BRCM=y
 CONFIG_AB8500_USB=y
 CONFIG_KEYSTONE_USB_PHY=m
 CONFIG_NOP_USB_XCEIV=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9a57d11330b..89637256e7bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -520,6 +520,7 @@ CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
 CONFIG_USB_ULPI_BUS=y
+CONFIG_USB_BRCM=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 16758b12a5e9..2d0b3060ad05 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -96,6 +96,32 @@ config USB_XHCI_TEGRA
 
 endif # USB_XHCI_HCD
 
+config USB_OHCI_BRCM
+       tristate
+
+config USB_EHCI_BRCM
+       tristate
+
+config USB_XHCI_BRCM
+       tristate
+
+config BRCM_USB_PHY
+       tristate
+
+config USB_BRCM
+	tristate "Broadcom STB USB support"
+	depends on ARCH_BRCMSTB || COMPILE_TEST
+	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
+	select USB_EHCI_BRCM if USB_EHCI_HCD
+	select USB_XHCI_BRCM if USB_XHCI_HCD
+	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	help
+	  Say Y to enable support for XHCI, EHCI and OHCI host controllers
+	  found in Broadcom STB SoC's.
+
+	  Disabling this will keep the controllers and corresponding
+	  PHYs powered down.
+
 config USB_EHCI_HCD
 	tristate "EHCI HCD (USB 2.0) support"
 	depends on HAS_DMA && HAS_IOMEM
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 84514f71ae44..9bdd64b710ee 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -31,6 +31,10 @@ ifneq ($(CONFIG_USB_XHCI_RCAR), )
 	xhci-plat-hcd-y		+= xhci-rcar.o
 endif
 
+ifneq ($(CONFIG_USB_XHCI_BRCM), )
+	xhci-plat-hcd-y		+= xhci-brcm.o
+endif
+
 ifneq ($(CONFIG_DEBUG_FS),)
 	xhci-hcd-y		+= xhci-debugfs.o
 endif
@@ -39,6 +43,13 @@ obj-$(CONFIG_USB_WHCI_HCD)	+= whci/
 
 obj-$(CONFIG_USB_PCI)	+= pci-quirks.o
 
+obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
+obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
+obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
+obj-$(CONFIG_USB_XHCI_HISTB)	+= xhci-histb.o
+obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
+obj-$(CONFIG_USB_XHCI_TEGRA)	+= xhci-tegra.o
+
 obj-$(CONFIG_USB_EHCI_HCD)	+= ehci-hcd.o
 obj-$(CONFIG_USB_EHCI_PCI)	+= ehci-pci.o
 obj-$(CONFIG_USB_EHCI_HCD_PLATFORM)	+= ehci-platform.o
@@ -52,6 +63,7 @@ obj-$(CONFIG_USB_EHCI_EXYNOS)	+= ehci-exynos.o
 obj-$(CONFIG_USB_EHCI_HCD_AT91) += ehci-atmel.o
 obj-$(CONFIG_USB_EHCI_TEGRA)	+= ehci-tegra.o
 obj-$(CONFIG_USB_W90X900_EHCI)	+= ehci-w90x900.o
+obj-$(CONFIG_USB_EHCI_BRCM)	+= ehci-brcm.o
 
 obj-$(CONFIG_USB_OXU210HP_HCD)	+= oxu210hp-hcd.o
 obj-$(CONFIG_USB_ISP116X_HCD)	+= isp116x-hcd.o
@@ -72,12 +84,6 @@ obj-$(CONFIG_USB_OHCI_HCD_DAVINCI)	+= ohci-da8xx.o
 
 obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
 obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
-obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
-obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
-obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
-obj-$(CONFIG_USB_XHCI_HISTB)	+= xhci-histb.o
-obj-$(CONFIG_USB_XHCI_MTK)	+= xhci-mtk.o
-obj-$(CONFIG_USB_XHCI_TEGRA)	+= xhci-tegra.o
 obj-$(CONFIG_USB_SL811_HCD)	+= sl811-hcd.o
 obj-$(CONFIG_USB_SL811_CS)	+= sl811_cs.o
 obj-$(CONFIG_USB_U132_HCD)	+= u132-hcd.o
-- 
1.9.0.138.g2de3478
