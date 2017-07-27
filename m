From: <honghui.zhang@mediatek.com>
Subject: [PATCH v2 0/5] PCI: MediaTek: Add support for new generation host controller
Date: Thu, 27 Jul 2017 10:58:34 +0800
Message-ID: <cover.1501122135.git.honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh@kerenl.org, robh+dt@kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com
Cc: honghui.zhang@mediatek.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

MediaTek's PCIe host controller has two generation HWs, the new
generation HW has two root ports, it shares most probing flow with the
legacy controller. But the read/write config space logical is different
from the lagacy controller.
This patchset abstract the common probing flow, and add support for the
new generation controller.

Changes since v1:
 - Fix build warnings in arm arch.
 - Using SoC specific compatible instead of generic compatible.
 - Add devicetree binding example for mt7622.
 - Unified the register define names with PCIE_ prefix.
 - Cleanup some un-necessary condition determine when starup port.
 - minor code cleanups.

Ryder Lee (5):
  PCI: mediatek: Add a structure to abstract the controller generations
  PCI: mediatek: switch to use platform_get_resource_byname()
  dt-bindings: PCI: rename and cleanup MediaTek binding text
  PCI: mediatek: Add new generation controller support
  dt-bindings: PCI: add support for new generation controller

 .../bindings/pci/mediatek,mt7623-pcie.txt          | 130 -----
 .../devicetree/bindings/pci/mediatek-pcie.txt      | 283 ++++++++++
 drivers/pci/host/Kconfig                           |   5 +-
 drivers/pci/host/pcie-mediatek.c                   | 588 +++++++++++++++++++--
 4 files changed, 829 insertions(+), 177 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt

-- 
2.6.4
