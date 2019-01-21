From: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: [v1,0/2] PCI: mediatek: Add support for MT7629
Date: Mon, 21 Jan 2019 19:11:00 +0800
Message-ID: <1548069062-12430-1-git-send-email-jianjun.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com, ryder.lee@mediatek.com, mark.rutland@arm.com
Cc: matthias.bgg@gmail.com, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, honghui.zhang@mediatek.com, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

These series patches modify pcie-mediatek.c and dt-bindings compatible
string to support MT7629 PCIe host.

Jianjun Wang (2):
  dt-bindings: PCI: Add support for MT7629
  PCI: mediatek: Add controller support for MT7629

 .../devicetree/bindings/pci/mediatek-pcie.txt |  1 +
 drivers/pci/controller/pcie-mediatek.c        | 28 +++++++++++++++++++
 include/linux/pci_ids.h                       |  1 +
 3 files changed, 30 insertions(+)

-- 
2.20.1
