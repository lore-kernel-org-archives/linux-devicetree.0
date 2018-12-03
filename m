From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH 0/8] add dts nodes to MT2712 SoC
Date: Mon, 3 Dec 2018 19:35:54 +0800
Message-ID: <1543836962-18293-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, YT Shen <yt.shen@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch series based on v4.20-rc1, include MT2712 usb/iommu/smi/i2c/spi/pwm/mmc/nand/pcie device nodes

Chunfeng Yun (1):
  arm64: dts: Add USB3 related nodes for MT2712

Honghui Zhang (1):
  arm64: dts: add pcie nodes for MT2712

YT Shen (6):
  arm64: dts: add iommu/smi nodes for MT2712
  arm64: dts: add i2c nodes for MT2712
  arm64: dts: add spi nodes for MT2712
  arm64: dts: add pwm nodes for MT2712
  arm64: dts: add mmc nodes for MT2712
  arm64: dts: add nand nodes for MT2712

 arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  98 +++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 555 ++++++++++++++++++++++++++++
 2 files changed, 653 insertions(+)

-- 
1.9.1
