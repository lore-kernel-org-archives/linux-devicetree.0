From: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: [v2,0/2] PCI: mediatek: Add support for MT7629
Date: Fri, 28 Jun 2019 15:34:23 +0800
Message-ID: <20190628073425.25165-1-jianjun.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

These series patches modify pcie-mediatek.c and dt-bindings compatible
string to support MT7629 PCIe host.

Jianjun Wang (2):
  dt-bindings: PCI: Add support for MT7629
  PCI: mediatek: Add controller support for MT7629

 .../devicetree/bindings/pci/mediatek-pcie.txt  |  1 +
 drivers/pci/controller/pcie-mediatek.c         | 18 ++++++++++++++++++
 include/linux/pci_ids.h                        |  1 +
 3 files changed, 20 insertions(+)

-- 
2.18.0
