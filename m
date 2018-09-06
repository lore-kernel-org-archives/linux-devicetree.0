Return-Path: <SRS0=pRDT=LU=gmail.com=jim2101024@kernel.org>
From: Jim Quinlan <jim2101024@gmail.com>
Subject: [PATCH v5 11/12] ARM64: add dma remap for BrcmSTB PCIe
Date: Thu,  6 Sep 2018 16:43:00 -0400
Message-Id: <1536266581-7308-12-git-send-email-jim2101024@gmail.com>
In-Reply-To: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Russell King <linux@armlinux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Kees Cook <keescook@chromium.org>, Jinbum Park <jinb.park7@gmail.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Jim Quinlan <jim2101024@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Palmer Dabbelt <palmer@sifive.com>, Stefan Agner <stefan@agner.ch>, Eric Anholt <eric@anholt.net>, Simon Horman <horms+renesas@verge.net.au>, Tony Lindgren <tony@atomide.com>, Stefan Wahren <stefan.wahren@i2se.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Olof Johansson <olof@lixom.net>, Thomas Hellstrom <thellstrom@vmware.com>, Alex Deucher <alexander.deucher@amd.com>, "Dirk Hohndel (VMware)" <dirk@hohndel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, Justin Chen <justinpopo6@gmail.com>, Markus Mayer <markus.mayer@broadcom.com>, Gareth Powell <gpowell@broadcom.com>, Doug Berger <opendmb@gmail.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Christoph Hellwig <hch@lst.de>
List-ID: <devicetree@vger.kernel.org>

The BrcmSTB PCIe controller needs to remap DMA accesses to it because
of the requirements of its interface with the SOC memory controllers.

Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
---
 drivers/pci/controller/Kconfig        |  1 +
 drivers/pci/controller/pcie-brcmstb.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 8daa621..4394430 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -284,6 +284,7 @@ config PCIE_BRCMSTB
 	depends on OF && PCI_MSI
 	depends on SOC_BRCMSTB
 	default ARCH_BRCMSTB || BMIPS_GENERIC
+	select ARCH_HAS_PHYS_TO_DMA if ARM64
 	help
 	  Say Y here to enable PCIe host controller support for
 	  Broadcom Settop Box SOCs.  A Broadcom SOC will may have
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index a805d87..ae9df8e 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -974,6 +974,18 @@ phys_addr_t brcm_dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 	return (phys_addr_t)dev_addr;
 }
 
+#if defined(CONFIG_ARM64)
+dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
+{
+	return brcm_phys_to_dma(dev, paddr);
+}
+
+phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
+{
+	return brcm_dma_to_phys(dev, dev_addr);
+}
+#endif
+
 static int brcm_pcie_add_controller(struct brcm_pcie *pcie)
 {
 	int i, ret = 0;
-- 
1.9.0.138.g2de3478
