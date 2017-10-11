From: Jim Quinlan <jim2101024@gmail.com>
Subject: [PATCH 4/9] arm64: dma-mapping: export symbol arch_setup_dma_ops
Date: Wed, 11 Oct 2017 18:34:24 -0400
Message-ID: <1507761269-7017-5-git-send-email-jim2101024@gmail.com>
References: <1507761269-7017-1-git-send-email-jim2101024@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507761269-7017-1-git-send-email-jim2101024@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gregory Fong <gregory.0xf0@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Jim Quinlan <jim2101024@gmail.com>
List-Id: devicetree@vger.kernel.org

The BrcmSTB driver needs to get ahold of a pointer to swiotlb_dma_ops.
However, that variable is defined as static.  Instead, we use
arch_setup_dma_ops() to get the pointer to swiotlb_dma_ops.  Since
we also want our driver to be a separate module, we need to
export this function.

Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
---
 arch/arm64/mm/dma-mapping.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 614af88..dae572f 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -936,3 +936,4 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	}
 #endif
 }
+EXPORT_SYMBOL(arch_setup_dma_ops);
-- 
1.9.0.138.g2de3478
