From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v7 0/6] PCI: hisi: Add PCIe host support for HiSilicon SoC Hip05
Date: Mon, 17 Aug 2015 19:55:48 +0800
Message-ID: <1439812554-180426-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds PCIe host support for HiSilicon SoC Hip05. The PCIe hosts
use PCIe IP core from Synopsys, So this driver is base on designware PCIe driver.

Hip05 is an ARMv8 architecture SoC. It should be able to use ARM64 PCIe API in
designeware PCIe driver. So this patch also adds ARM64 support for designware
pcie.

This patchset is based on v4.2-rc1.

Change from v6:
- Add Pratyush's Acked-by for 1/6 and 2/6.
- Add James' Tested-by for 3/6.

Change from v5:
- Merge 1/6 in this series, discussion about this can be found in [1]

Change from v4:
- Change the author of 1/5 to Gabriele.
- Modify problems in 3/5 pointed by Bjorn.
- Modify spelling problems in 4/5.

Change from v3:
- Change 1/5 to what Gabriele suggested.
- Use win->__res.start to get *_mod_base in 2/5, this fix a bug in v3 series.

Change from v2:
- Move struct pci_dev *dev and struct pci_sys_data *sys in
  pcibios_align_resource in 1/5.
- Add Gabriele's codes in 2/5 which delete unnecessary information parse and
  use of_pci_get_host_bridge_resources for both ARM32 and ARM64.
- Add maintainer patch 5/5.

Change from RFC v1:
- Add 1/4 patch by Arnd which removes align_resource callback in ARM
  pcibios_align_resource.
- Change head file in pcie-designware from asm/hardirq.h to linux/hardirq.h.
- Set pp->root_bus_nr = 0 in dra7xx, exynos, imx6, keystone, layerscape,
  spear13xx.
- Remove unnecessary parentheses of some macros in pcie-hisi.
- Use macro to replace some magic values.
- Merge two loops together and add some comments about it in context_config
  function in pcie-hisi.
- Modify some value of items in pcie node example in binding document. 

Change from RFC:
- delete dw_pcie_setup, dw_pcie_scan_bus, dw_pcie_map_irq and struct hw_pci,
  merge related operations into dw_pcie_host_init.

Link of v6:
- http://www.spinics.net/lists/linux-pci/msg43669.html
Link of v5:
- http://www.spinics.net/lists/devicetree/msg87959.html
Link of v4:
- http://www.spinics.net/lists/arm-kernel/msg433050.html
Link of v3:
- http://www.spinics.net/lists/linux-pci/msg42539.html
Link of v2:
- http://www.spinics.net/lists/linux-pci/msg41844.html
Link of RFC v1:
- http://www.spinics.net/lists/linux-pci/msg41305.html
Link of RFC:
- http://www.spinics.net/lists/linux-pci/msg40434.html

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/359741.html

Zhou Wang (4):
  PCI: designware: Add ARM64 support
  PCI: hisi: Add PCIe host support for HiSilicon SoC Hip05
  Documentation: DT: Add HiSilicon PCIe host binding
  MAINTAINERS: Add pcie-hisi maintainer

gabriele paoloni (2):
  PCI: designware: move calculation of bus addresses to DRA7xx
  ARM/PCI: remove align_resource in pci_sys_data

 .../devicetree/bindings/pci/hisilicon-pcie.txt     |  46 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/include/asm/mach/pci.h                    |   5 -
 arch/arm/kernel/bios32.c                           |  12 +-
 drivers/pci/host/Kconfig                           |   8 +
 drivers/pci/host/Makefile                          |   1 +
 drivers/pci/host/pci-dra7xx.c                      |  14 ++
 drivers/pci/host/pci-exynos.c                      |   2 +-
 drivers/pci/host/pci-imx6.c                        |   2 +-
 drivers/pci/host/pci-keystone-dw.c                 |   2 +-
 drivers/pci/host/pci-keystone.c                    |   2 +-
 drivers/pci/host/pci-layerscape.c                  |   2 +-
 drivers/pci/host/pcie-designware.c                 | 236 ++++++-------------
 drivers/pci/host/pcie-designware.h                 |  14 +-
 drivers/pci/host/pcie-hisi.c                       | 254 +++++++++++++++++++++
 drivers/pci/host/pcie-spear13xx.c                  |   2 +-
 16 files changed, 425 insertions(+), 184 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
 create mode 100644 drivers/pci/host/pcie-hisi.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
