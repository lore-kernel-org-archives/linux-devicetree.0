From: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: [PATCH v3 0/2] Add Stratix 10 PCIe Root Port support
Date: Wed,  2 Jan 2019 14:16:47 +0800
Message-ID: <1546409810-37630-1-git-send-email-ley.foon.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, lftan.linux@gmail.com, Ley Foon Tan <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

Add PCIe Root Port support for Stratix 10 device and also update
device tree binding documentation.

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

Ley Foon Tan (2):
  PCI: altera: Add Stratix 10 PCIe support
  dt-bindings: PCI: altera: Add altr,pcie-root-port-2.0

 .../devicetree/bindings/pci/altera-pcie.txt        |    4 +-
 drivers/pci/controller/Kconfig                     |    2 +-
 drivers/pci/controller/pcie-altera.c               |  246 ++++++++++++++++++--
 3 files changed, 226 insertions(+), 26 deletions(-)
