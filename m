From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V3 6/6] usb: host: Add ability to build new Broadcom STB USB drivers
Date: Mon,  5 Nov 2018 16:31:33 -0500
Message-ID: <1541453493-34981-7-git-send-email-alcooperx@gmail.com>
References: <1541453493-34981-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541453493-34981-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@
List-Id: devicetree@vger.kernel.org

Add the build system changes needed to get the Broadcom STB XHCI,
EHCI and OHCI functionality working. The link order for XHCI was
changed in the Makefile because of the way STB XHCI, EHCI and OHCI
controllers share a port which requires that the XHCI driver be
initialized first. Also update MAINTAINERS.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 MAINTAINERS               |  9 +++++++++
 drivers/usb/host/Kconfig  | 29 +++++++++++++++++++++++++++++
 drivers/usb/host/Makefile | 18 ++++++++++++------
 3 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8e1d86bd505..c4e7bcb7f992 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2991,6 +2991,15 @@ S:	Supported
 F:	drivers/i2c/busses/i2c-brcmstb.c
 F:	Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt
 
+BROADCOM BRCMSTB USB XHCI, EHCI and OHCI DRIVERS
+M:	Al Cooper <alcooperx@gmail.com>
+L:	linux-usb@vger.kernel.org
+L:	bcm-kernel-feedback-list@broadcom.com
+S:	Maintained
+F:	drivers/usb/host/xhci-brcm.*
+F:	drivers/usb/host/ohci-brcm.c
+F:	Documentation/devicetree/bindings/usb/brcm,bcm7445-*.txt
+
 BROADCOM BRCMSTB USB2 and USB3 PHY DRIVER
 M:	Al Cooper <alcooperx@gmail.com>
 L:	linux-kernel@vger.kernel.org
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 16758b12a5e9..ec6b4582ab12 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -94,6 +94,35 @@ config USB_XHCI_TEGRA
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in NVIDIA Tegra124 and later SoCs.
 
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
+	depends on ARCH_BRCMSTB
+	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
+	select USB_EHCI_BRCM if USB_EHCI_HCD
+	select USB_XHCI_BRCM if USB_XHCI_HCD
+	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	select BRCM_USB_PHY if USB_OHCI_HCD || USB_EHCI_HCD || USB_XHCI_HCD
+	select GENERIC_PHY if BRCM_USB_PHY
+	default ARCH_BRCMSTB
+	help
+	  Say Y to enable support for XHCI, EHCI and OHCI host controllers
+	  found in Broadcom STB SoC's.
+
+	  Disabling this will keep the controllers and corresponding
+	  PHYs powered down.
+
 endif # USB_XHCI_HCD
 
 config USB_EHCI_HCD
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
