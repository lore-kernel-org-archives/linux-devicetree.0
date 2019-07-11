From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 3/4] dt-bindings: iommu/arm,smmu: add compatible string for Marvell
Date: Thu, 11 Jul 2019 17:02:41 +0200
Message-ID: <20190711150242.25290-4-gregory.clement@bootlin.com>
References: <20190711150242.25290-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190711150242.25290-1-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>
List-Id: devicetree@vger.kernel.org

From: Hanna Hawa <hannah@marvell.com>

Add specific compatible string for Marvell usage due errata of
accessing 64bits registers of ARM SMMU, in AP806.

AP806 SoC uses the generic ARM-MMU500, and there's no specific
implementation of Marvell, this compatible is used for errata only.

Signed-off-by: Hanna Hawa <hannah@marvell.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3ba7567..7ed58d51846e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -16,6 +16,7 @@ conditions.
                         "arm,mmu-400"
                         "arm,mmu-401"
                         "arm,mmu-500"
+                        "marvell,mmu-500"
                         "cavium,smmu-v2"
                         "qcom,smmu-v2"
 
-- 
2.20.1
