From: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/5] PCIe Xilinx generic driver for Microblaze and
Date: Tue, 12 Jan 2016 23:06:08 +0530
Message-ID: <1452620173-4905-1-git-send-email-bharatku@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, russell.joyce-3oYoeGyd3e21Qrn1Bg8BZw@public.gmane.org, sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series does modifications to pcie-xilinx.c, to support common
driver on both Zynq and Microblaze architectures.
Microblaze pci-common.c has been modified to support generic driver.

I'm aware Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> has also sent patches
related to pcie-xilinx.c, but I'm unable to comment on them. 
I request Paul Burton to please add me in cc list so that I can comment on
those patches.

Bharat Kumar Gogada (5):
  PCI: xilinx: Removing xilinx_pcie_parse_and_add_res function
  PCI: xilinx: Removing struct hw_irq structure.
  PCI: xilinx: Modifying AXI PCIe Host Bridge driver to      work on
    both  Zynq and Microblaze
  PCI: xilinx: Updating Zynq PCI binding documentation with     
    Microblaze node.
  Microblaze: Modifying microblaze PCI subsytem to support      generic
    Xilinx  AXI PCIe Host Bridge IP driver

 .../devicetree/bindings/pci/xilinx-pcie.txt        |  36 +++-
 arch/microblaze/Kconfig                            |   3 +
 arch/microblaze/pci/pci-common.c                   |  61 +++---
 drivers/pci/host/Kconfig                           |   2 +-
 drivers/pci/host/pcie-xilinx.c                     | 210 ++++-----------------
 5 files changed, 98 insertions(+), 214 deletions(-)

-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
