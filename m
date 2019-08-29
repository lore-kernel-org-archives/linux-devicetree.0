From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/2] iommu: Support reserved-memory regions
Date: Thu, 29 Aug 2019 13:14:05 +0200
Message-ID: <20190829111407.17191-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <joro@8bytes.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

These two patches implement support for retrieving a list of reserved
regions for a device from its device tree node. These regions are
described by the reserved-memory bindings:

	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

These reserved memory regions will be used to establish 1:1 mappings.
One case where this is useful is when the Linux kernel wants to take
over the display controller configuration from a bootloader. In order
to ensure that the display controller can keep scanning out from the
framebuffer allocated by the bootloader without faulting after the
IOMMU has been enabled, a 1:1 mapping needs to be established.

Thierry

Thierry Reding (2):
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()

 drivers/iommu/dma-iommu.c |  3 +++
 drivers/iommu/of_iommu.c  | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_iommu.h  |  8 ++++++++
 3 files changed, 50 insertions(+)

-- 
2.22.0
