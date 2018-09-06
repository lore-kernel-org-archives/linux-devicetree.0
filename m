Return-Path: <SRS0=pRDT=LU=gmail.com=jim2101024@kernel.org>
From: Jim Quinlan <jim2101024@gmail.com>
Subject: [PATCH v5 06/12] MIPS: BMIPS: add dma remap for BrcmSTB PCIe
Date: Thu,  6 Sep 2018 16:42:55 -0400
Message-Id: <1536266581-7308-7-git-send-email-jim2101024@gmail.com>
In-Reply-To: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
References: <1536266581-7308-1-git-send-email-jim2101024@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Russell King <linux@armlinux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Kees Cook <keescook@chromium.org>, Jinbum Park <jinb.park7@gmail.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Jim Quinlan <jim2101024@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Palmer Dabbelt <palmer@sifive.com>, Stefan Agner <stefan@agner.ch>, Eric Anholt <eric@anholt.net>, Simon Horman <horms+renesas@verge.net.au>, Tony Lindgren <tony@atomide.com>, Stefan Wahren <stefan.wahren@i2se.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Olof Johansson <olof@lixom.net>, Thomas Hellstrom <thellstrom@vmware.com>, Alex Deucher <alexander.deucher@amd.com>, "Dirk Hohndel (VMware)" <dirk@hohndel.org>, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, Justin Chen <justinpopo6@gmail.com>, Markus Mayer <markus.mayer@broadcom.com>, Gareth Powell <gpowell@broadcom.com>, Doug Berger <opendmb@gmail.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Christoph Hellwig <hch@lst.de>
List-ID: <devicetree@vger.kernel.org>

The design of the Broadcom PCIe RC controller requires us to remap its
DMA addresses for inbound traffic.  We do this by modifying the
definitions of __phys_to_dma() and __dma_to_phys().

In arch/mips/bmips/dma.c, these functions are already in use to remap
DMA addresses for the 338x SOC chips.  We leave this code alone -- and
give its mapping priority -- but if it is not in use, the PCIe DMA
mapping is in effect.

One might think that the two DMA remapping systems of dma.c could be
combined, but they cannot: one governs only DMA addresses for the PCIe
controller of BrcmSTB ARM/ARM64/MIPs chips, while the other governs
the PCIe controller *and* other peripherals for only MIPs 338x
chips.

Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
---
 arch/mips/bmips/dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
index 3d13c77..292994f 100644
--- a/arch/mips/bmips/dma.c
+++ b/arch/mips/bmips/dma.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <asm/bmips.h>
+#include <soc/brcmstb/common.h>
 
 /*
  * BCM338x has configurable address translation windows which allow the
@@ -44,6 +45,10 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t pa)
 {
 	struct bmips_dma_range *r;
 
+#ifdef CONFIG_PCIE_BRCMSTB
+	if (!bmips_dma_ranges)
+		return brcm_phys_to_dma(dev, pa);
+#endif
 	for (r = bmips_dma_ranges; r && r->size; r++) {
 		if (pa >= r->child_addr &&
 		    pa < (r->child_addr + r->size))
@@ -56,6 +61,10 @@ phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
 {
 	struct bmips_dma_range *r;
 
+#ifdef CONFIG_PCIE_BRCMSTB
+	if (!bmips_dma_ranges)
+		return (unsigned long)brcm_dma_to_phys(dev, dma_addr);
+#endif
 	for (r = bmips_dma_ranges; r && r->size; r++) {
 		if (dma_addr >= r->parent_addr &&
 		    dma_addr < (r->parent_addr + r->size))
-- 
1.9.0.138.g2de3478
