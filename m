From: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: [PATCH v6 0/3] Add Stratix 10 PCIe Root Port support
Date: Thu, 28 Feb 2019 18:52:49 +0800
Message-ID: <1551351172-25424-1-git-send-email-ley.foon.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, lftan.linux@gmail.com, Ley Foon Tan <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

Add PCIe Root Port support for Stratix 10 device and also update
device tree binding documentation.

v5 -> v6:
---------
- Move udelay to SOP polling
- Move count checking to for loop condition
- Change dw[count++] to dw[0] for first DW

v4 -> v5:
---------
- Add struct altera_pcie_ops
- Add count checking in s10_tlp_read_packet()

v3 -> v4:
---------
- Separate Kconfig change to a patch
- Change cast to mask

v2 -> v3:
---------
- Rename Stratix10 to Stratix 10.
- Change bool s10_flag to enum version.

v1 -> v2:
---------
- Add define S10_TLP_FMTTYPE_* macros.
- Remove initialize structure members to NULL/zero.
- Rename *_funcs to *_data.
- Update comment and fix coding style warning from checkpatch.pl.
- Rename StratixXX to stratix10.

History:
--------
[v1]: https://lkml.org/lkml/2018/12/26/68
[v2]: https://lkml.org/lkml/2018/12/31/46
[v3]: https://lkml.org/lkml/2019/1/2/16
[v4]: https://lkml.org/lkml/2019/2/14/58
[v5]: https://lkml.org/lkml/2019/2/26/200

Ley Foon Tan (3):
  PCI: altera: Add Stratix 10 PCIe support
  PCI: altera: Enable driver on ARM64
  dt-bindings: PCI: altera: Add altr,pcie-root-port-2.0

 .../devicetree/bindings/pci/altera-pcie.txt   |   4 +-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-altera.c          | 264 ++++++++++++++++--
 3 files changed, 244 insertions(+), 26 deletions(-)

-- 
2.19.0
