From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/2] iommu/arm-smmu: Add an optional "input-address-size" property
Date: Thu, 10 Oct 2019 20:46:07 -0700
Message-ID: <20191011034609.13319-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, will@kernel.org, robin.murphy@arm.com
Cc: vdumpa@nvidia.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series of patches add an optional DT property to allow an SoC to
specify how many bits being physically connected to its SMMU instance,
depending on the SoC design.

Nicolin Chen (2):
  dt-bindings: arm-smmu: Add an optional "input-address-size" property
  iommu/arm-smmu: Read optional "input-address-size" property

 Documentation/devicetree/bindings/iommu/arm,smmu.txt |  7 +++++++
 drivers/iommu/arm-smmu.c                             | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.17.1
