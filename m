From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 4/5] ARM: gic: allow irq_start to be 0
Date: Wed, 14 Sep 2011 11:31:39 -0500
Message-ID: <1316017900-19918-5-git-send-email-robherring2@gmail.com>
References: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1316017900-19918-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: grant.likely@secretlab.ca, marc.zyngier@arm.com, thomas.abraham@linaro.org, jamie@jamieiles.com, b-cousson@ti.com, shawn.guo@linaro.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

There's really no need to set irq_start per platform for the primary gic.
The SGIs and PPIs are not handled as normal irqs, so how irqs 0-31 are
setup doesn't really matter. So allow irq_start to be set to 0 to match
the linux irq numbering.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 arch/arm/common/gic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/common/gic.c b/arch/arm/common/gic.c
index 666b278..d1ccc72 100644
--- a/arch/arm/common/gic.c
+++ b/arch/arm/common/gic.c
@@ -359,7 +359,7 @@ void __init gic_init(unsigned int gic_nr, unsigned int irq_start,
 	gic = &gic_data[gic_nr];
 	gic->dist_base = dist_base;
 	gic->cpu_base = cpu_base;
-	gic->irq_offset = (irq_start - 1) & ~31;
+	gic->irq_offset = irq_start ? (irq_start - 1) & ~31 : 0;
 
 	if (gic_nr == 0)
 		gic_cpu_base_addr = cpu_base;
-- 
1.7.5.4
