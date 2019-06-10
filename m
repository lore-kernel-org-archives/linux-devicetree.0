From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH 0/8] iommu: Add auxiliary domain and PASID support to Arm SMMUv3
Date: Mon, 10 Jun 2019 19:47:06 +0100
Message-ID: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: will.deacon@arm.com
Cc: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, robin.murphy@arm.com, jacob.jun.pan@linux.intel.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
List-Id: devicetree@vger.kernel.org

Add substreams and PCI PASID support to the SMMUv3 driver. At the moment
the driver supports a single address space per device. PASID enables
multiple address spaces per device, up to a million in theory (1 << 20).

Two kernel features will make use of PASIDs, auxiliary domains (AUXD)
and Shared Virtual Addressing (SVA). Auxiliary domains allow to program
PASID contexts using IOMMU domains. SVA allows to bind process address
spaces to device contexts and relieve device drivers of DMA management.

Since SVA support for SMMUv3 has a lot more dependencies (new fault API,
ASID pinning, generic bind, PRI or stall support, and so on),
introducing PASID support to the SMMUv3 driver is easier with auxiliary
domains.

The AUXD API allows device drivers to easily test PASID support of their
devices, although they need to allocate IOVA and pages themselves
because the DMA API doesn't support AUXD for the moment:

	iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_AUX);
	domain = iommu_domain_alloc(dev->bus);
	iommu_aux_attach_device(domain, dev);
	iommu_map(domain, iova, phys_addr, size, prot);
	pasid = iommu_aux_get_pasid(domain);
	/* Then launch DMA with the PASID and IOVA */

Auxiliary domains also allow to split devices into multiple contexts
assignable to guest, with vfio-mdev.

Past discussions for these patches:
* Auxiliary domains (patch 6)
  [RFC PATCH 0/6] Auxiliary IOMMU domains and Arm SMMUv3
  https://www.spinics.net/lists/iommu/msg30637.html
* SSID support for the SMMU (patches 2, 3, 4, 5, 7 and 8)
  [PATCH v2 00/40] Shared Virtual Addressing for the IOMMU
  https://lists.linuxfoundation.org/pipermail/iommu/2018-May/027595.html
* I/O ASID (patch 1)
  [PATCH v3 00/16] Shared virtual address IOMMU and VT-d support
  https://lkml.kernel.org/lkml/1556922737-76313-4-git-send-email-jacob.jun.pan@linux.intel.com/

Jean-Philippe Brucker (8):
  iommu: Add I/O ASID allocator
  dt-bindings: document PASID property for IOMMU masters
  iommu/arm-smmu-v3: Support platform SSID
  iommu/arm-smmu-v3: Add support for Substream IDs
  iommu/arm-smmu-v3: Add second level of context descriptor table
  iommu/arm-smmu-v3: Support auxiliary domains
  iommu/arm-smmu-v3: Improve add_device() error handling
  iommu/arm-smmu-v3: Add support for PCI PASID

 .../devicetree/bindings/iommu/iommu.txt       |   6 +
 drivers/iommu/Kconfig                         |   5 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/arm-smmu-v3.c                   | 714 ++++++++++++++++--
 drivers/iommu/ioasid.c                        | 150 ++++
 drivers/iommu/of_iommu.c                      |   6 +-
 include/linux/ioasid.h                        |  49 ++
 include/linux/iommu.h                         |   1 +
 8 files changed, 865 insertions(+), 67 deletions(-)
 create mode 100644 drivers/iommu/ioasid.c
 create mode 100644 include/linux/ioasid.h

-- 
2.21.0
