From: Jim Quinlan <jim2101024@gmail.com>
Subject: [PATCH v4 8/8] MIPS: BMIPS: Enable PCI
Date: Mon, 15 Jan 2018 18:28:45 -0500
Message-ID: <1516058925-46522-9-git-send-email-jim2101024@gmail.com>
References: <1516058925-46522-1-git-send-email-jim2101024@gmail.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1516058925-46522-1-git-send-email-jim2101024@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-pci@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Jim Quinlan <jim2101024@gmail.com>
List-Id: devicetree@vger.kernel.org

Adds the Kconfig hooks to enable the Broadcom STB PCIe root complex
driver for Broadcom MIPS systems.

Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
---
 arch/mips/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 350a990..fe17361 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -210,6 +210,9 @@ config BMIPS_GENERIC
 	select BOOT_RAW
 	select NO_EXCEPT_FILL
 	select USE_OF
+	select HW_HAS_PCI
+	select PCI_DRIVERS_GENERIC
+	select PCI
 	select CEVT_R4K
 	select CSRC_R4K
 	select SYNC_R4K
-- 
1.9.0.138.g2de3478
