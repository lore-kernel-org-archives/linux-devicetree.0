From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 0/4]  Add system mmu support for Armada-806
Date: Thu, 11 Jul 2019 17:02:38 +0200
Message-ID: <20190711150242.25290-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hello,

last year a first version of this series was submitted to add support
for IOMMU for AP806, including workaround for accessing ARM SMMU 64bit
registers[1].

For the record, AP-806 can't access SMMU registers with 64bit width,
this patches split the readq/writeq for 32bit access, due to erratanum
#582743.

Based on the feedback from Robin Murphy, I also add code ensuring that
we won't try to use AArch64 format with 32 bits acces.

It was also discussed to not use compatible but propertu to support
this workaround. I agree to make this change if needed, but for now I
would like to have a feedback on the current code to know if it is
acceptable if there is still potential issue.

The series was tested on a vanilla v5.1 kernel, and without the
series, an USB stick was not detected under QEMU whereas with this
series it worked as expected.

Greogry

[1]: https://lkml.org/lkml/2018/10/15/373

Gregory CLEMENT (1):
  arm64: dts: marvell: armada-ap806: add smmu support

Hanna Hawa (3):
  iommu/arm-smmu: Introduce wrapper for writeq/readq
  iommu/arm-smmu: Workaround for Marvell Armada-AP806 SoC erratum
    #582743
  dt-bindings: iommu/arm,smmu: add compatible string for Marvell

 Documentation/arm64/silicon-errata.txt        |  2 +
 .../devicetree/bindings/iommu/arm,smmu.txt    |  1 +
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 17 +++++
 drivers/iommu/arm-smmu.c                      | 74 ++++++++++++++++---
 4 files changed, 83 insertions(+), 11 deletions(-)

-- 
2.20.1
