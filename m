From: <honghui.zhang@mediatek.com>
Subject: [PATCH 0/5] PCI: MediaTek: Add support for new generation host controller
Date: Fri, 21 Jul 2017 10:32:42 +0800
Message-ID: <cover.1500601172.git.honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kerenl.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com
Cc: honghui.zhang@mediatek.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

MediaTek's PCIe host controller has two generation HWs, the new
generation HW has two root ports, it shares most probing flow with the
legacy controller. But the read/write config space logical is different
from the lagacy controller.
This patchset abstract the common probing flow, and add support for the
new generation controller.

Ryder Lee (5):
  PCI: mediatek: Add a structure to abstract the controller generations
  PCI: mediatek: switch to use platform_get_resource_byname()
  dt-bindings: PCI: rename and cleanup MediaTek binding text
  PCI: mediatek: Add new generation controller support
  dt-bindings: PCI: add support for new generation controller

 ...{mediatek,mt7623-pcie.txt => mediatek-pcie.txt} | 113 +++-
 drivers/pci/host/Kconfig                           |   5 +-
 drivers/pci/host/pcie-mediatek.c                   | 578 +++++++++++++++++++--
 3 files changed, 629 insertions(+), 67 deletions(-)
 rename Documentation/devicetree/bindings/pci/{mediatek,mt7623-pcie.txt => mediatek-pcie.txt} (59%)

-- 
2.6.4
