From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v5 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Tue, 18 Dec 2012 20:13:02 +0530
Message-ID: <1355841786-13307-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, kgene.kim@samsung.com, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, jg1.han@samsung.com, yulgon.kim@samsung.com, kishon@ti.com, p.paneri@samsung.com
List-Id: devicetree@vger.kernel.org

Changes from v4:
 - Moved architecture side changes out of this patch-set.
 - Added support for multiple usbphy phandle parsing and
   doing all pmu_isolation() and phy_cfg_sel() related changes
   in samsung-usbphy driver only instead of architecture
   as in v4 patch-set.
 - Removed unnecessary multi line definitions for macros.

Changes from v3:
 - Moved enums S5P_USB_PHY_DEVICE, S5P_USB_PHY_HOST from machine to file
   include/linux/usb/samsung_usb_phy.h as USB_PHY_TYPE_DEVICE and
   USB_PHY_TYPE_HOST to make it more generic. Further resolve its
   dependencies.
 - Introduced a function 'samsung_usbphy_set_type()' which takes
   care of setting up the phy_type: HOST/DEVICE. This function
   can be called by host/otg drivers to setup phy_type prior to
   handling the respective PHYs.
 - Added an error-path for HOST type phy in s5p_usb_phy_pmu_isolation()
   for 'mach-s3c64xx'.
 - Moving to PHY driver as default for ehci-s5p and ohci-exynos, and only
   when failed fall back to plat-data.
 - Added samsung_usbphy_set_type() prior to doing usb_phy_init() or
   usb_phy_shutdown() so that appropriate PHY gets init or shutdown.

Based on patches for samsung-usbphy driver:
 1)http://lists.infradead.org/pipermail/linux-arm-kernel/2012-November/134476.html
 2)https://lkml.org/lkml/2012/12/18/187
 
Vivek Gautam (4):
  ARM: EXYNOS: Update & move usb-phy types to generic include layer
  usb: phy: samsung: Add host phy support to samsung-phy driver
  USB: ehci-s5p: Add phy driver support
  USB: ohci-exynos: Add phy driver support

 .../devicetree/bindings/usb/samsung-usbphy.txt     |   25 +-
 drivers/usb/host/ehci-s5p.c                        |   71 +++-
 drivers/usb/host/ohci-exynos.c                     |   71 +++-
 drivers/usb/phy/Kconfig                            |    2 +-
 drivers/usb/phy/samsung-usbphy.c                   |  465 ++++++++++++++++++--
 include/linux/usb/samsung_usb_phy.h                |   29 ++
 6 files changed, 570 insertions(+), 93 deletions(-)
 create mode 100644 include/linux/usb/samsung_usb_phy.h

-- 
1.7.6.5
