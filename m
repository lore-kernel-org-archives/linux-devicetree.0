From: <honghui.zhang@mediatek.com>
Subject: [PATCH 0/4] Cleanup un-used variant and un-used property for MediaTek PCIe
Date: Fri, 14 Dec 2018 09:25:38 +0800
Message-ID: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com, Honghui Zhang <honghui.zhang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

The "num-lanes" property in MediaTek's PCIe device node is not used by
its driver or anyone else, cleanup those related code.

Honghui Zhang (4):
  PCI: mediatek: Remove un-used variant in struct mtk_pcie_port
  dt-bindings: PCI: MediaTek: Remove un-used property
  arm: dts: mt7623: Remove un-used property for PCIe
  arm64: dts: mt7622: Remove un-used property for PCIe

 Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 8 --------
 arch/arm/boot/dts/mt7623.dtsi                           | 3 ---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi                | 2 --
 drivers/pci/controller/pcie-mediatek.c                  | 8 --------
 4 files changed, 21 deletions(-)

-- 
2.6.4
