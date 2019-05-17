From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: [RFC/PATCH 0/4] Initial support for modular IOMMU drivers
Date: Fri, 17 May 2019 11:47:33 -0700
Message-ID: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, robh+dt@kernel.org, frowand.list@gmail.com, bhelgaas@google.com, joro@8bytes.org, robin.murphy@arm.com, will.deacon@arm.com, kernel-team@android.com, pratikp@codeaurora.org, lmark@codeaurora.org
List-Id: devicetree@vger.kernel.org

This series adds initial support for being able to use the ARM
SMMU driver as a loadable kernel module. The series also adds
to the IOMMU framework, so that it can defer probing for devices
that depend on an IOMMU driver that may be a loadable module.

The primary reason behind these changes is that having the ARM
SMMU driver as a module allows for the same kernel image to be
used across different platforms. For example, if one platform
contains an IOMMU that implements one version of the ARM SMMU
specification, and another platform simply does not have an
IOMMU, the only way that these platforms can share the same
kernel image is if the ARM SMMU driver is compiled into the
kernel image.

This solution is not scalable, as it will lead to bloating the
kernel image with support for several future versions of the
SMMU specification to maintain a common kernel image that works
across all platforms. Having the ARM SMMU driver as a module allows
for a common kernel image to be supported across all platforms,
while yielding a smaller kernel image size, since the correct
SMMU driver can be loaded at runtime, if necessary.

Patchset Summary:

1. Since the ARM SMMU driver depends on symbols being exported from
several subsystems, the first three patches are dedicated to exporting
the necessary symbols.

2. Similar to how the pinctrl framework handles deferring probes,
the subsequent patch makes it so that the IOMMU framework will defer
probes indefinitely if there is a chance that the IOMMU driver that a
device is waiting for is a module. Otherwise, it upholds the current
behavior of stopping probe deferrals once all of the builtin drivers
have finished probing.

The ARM SMMU driver currently has support for the deprecated
"mmu-masters" binding, which relies on the notion of initcall
ordering for setting the bus ops to ensure that all SMMU devices
have been bound to the driver. This poses a problem with
making the driver a module, as there is no such notion with
loadable modules. Will support for this be completely deprecated?
If not, might it be useful to leverage the device tree ordering,
and assign a property to the last SMMU device, and set the bus ops
at that point? Or perhaps have some deferred timer based approach
to know when to set the bus ops? 

Thanks,
Isaac

Isaac J. Manjarres (4):
  of: Export of_phandle_iterator_args() to modules
  PCI: Export PCI ACS and DMA searching functions to modules
  iommu: Export core IOMMU functions to kernel modules
  iommu: Add probe deferral support for IOMMU kernel modules

 drivers/iommu/iommu-sysfs.c | 3 +++
 drivers/iommu/iommu.c       | 6 ++++++
 drivers/iommu/of_iommu.c    | 8 ++++++--
 drivers/of/base.c           | 1 +
 drivers/pci/pci.c           | 1 +
 drivers/pci/search.c        | 1 +
 6 files changed, 18 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
