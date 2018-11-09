From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V4 0/5] Add XHCI, EHCI and OHCI support for Broadcom STB SoS's
Date: Fri,  9 Nov 2018 09:01:55 -0500
Message-ID: <1541772120-40394-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@li>
List-Id: devicetree@vger.kernel.org

V4 - Rename hcd phy flag "suspend_without_phy_exit" to
     "phy_supplies_usb_clock" to more closely reflect
     the actaual hardware. Add the device tree property
     "suspend-without-phy-exit" to set the flag. Remove the code
     that sets the flag in the OHCI, EHCI and XHCI drivers which
     means that the ohci_platform.c driver can be used without
     any modifications.
   
V3 - Based on feedback
   - Patch 3/6
     In xhci-brcm.h, fixed incorrect function name when
     CONFIG_USB_XHCI_BRCM is not defined. Found by kbuild test robot.
   - Patch 4/6
     In ohci-platform.c, use devm_kmemdup() instead of demv_kzalloc().
   - Patch 5/6
     In ehci-platform.c, use dma_coerce_mask_and_coherent()
     instead of dma_coerce_mask_and_coherent(). Remove unneeded
     #ifdef CONFIG_OF.

V2 - Based on feedback, the functionality for XHCI and OHCI was
     moved from Broadcom platform drivers into the standard XHCI
     and OHCI platform drivers. The EHCI functionality still uses
     a Broadcom EHCI driver because of the workarounds needed for
     bugs in the EHCI controller.

This adds support for the XHCI, EHCI and OHCI host controllers found
in Broadcom STB SoC's. These drivers depend on getting access to the
new Broadcom STB USB PHY driver through a device-tree phandle and
will fail if the driver is not available.

Al Cooper (5):
  dt-bindings: Add Broadcom STB USB support
  usb: core: Add ability to skip phy exit on suspend and init on resume
  usb: xhci: xhci-plat: Add support for Broadcom STB SoC's
  usb: ehci: Add new EHCI driver for Broadcom STB SoC's
  usb: host: Add ability to build new Broadcom STB USB drivers

 .../devicetree/bindings/usb/brcm,bcm7445-ehci.txt  |  24 ++
 Documentation/devicetree/bindings/usb/usb-hcd.txt  |   3 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt |   1 +
 MAINTAINERS                                        |   9 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/usb/core/hcd.c                             |   8 +-
 drivers/usb/core/phy.c                             |  28 +-
 drivers/usb/core/phy.h                             |   9 +-
 drivers/usb/host/Kconfig                           |  26 ++
 drivers/usb/host/Makefile                          |  18 +-
 drivers/usb/host/ehci-brcm.c                       | 286 +++++++++++++++++++++
 drivers/usb/host/xhci-brcm.c                       |  16 ++
 drivers/usb/host/xhci-brcm.h                       |  16 ++
 drivers/usb/host/xhci-plat.c                       |   8 +
 include/linux/usb/hcd.h                            |   6 +
 16 files changed, 439 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.txt
 create mode 100644 drivers/usb/host/ehci-brcm.c
 create mode 100644 drivers/usb/host/xhci-brcm.c
 create mode 100644 drivers/usb/host/xhci-brcm.h

-- 
1.9.0.138.g2de3478
