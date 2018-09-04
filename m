From: <shun-chih.yu@mediatek.com>
Subject: [PATCH] add support for Mediatek Command-Queue DMA controller on MT6765 SoC
Date: Tue, 4 Sep 2018 16:43:44 +0800
Message-ID: <1536050626-21927-1-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com
List-Id: devicetree@vger.kernel.org


This patchset introduces support for MediaTek Command-Queue DMA controller.

MediaTek Command-Queue DMA controller (CQDMA) on MT6765 SoC is dedicated to memory-to-memory transfer through queue-based descriptor management.

There are only 3 physical channels inside CQDMA, while the driver is extended to support 32 virtual channels for multiple dma users to issue dma requests onto the CQDMA simultaneously.

Shun-Chih Yu (2):
  dt-bindings: dmaengine: Add MediaTek Command-Queue DMA controller
    bindings
  dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for
    MT6765 SoC

 .../devicetree/bindings/dma/mtk-cqdma.txt          |  31 +
 drivers/dma/mediatek/Kconfig                       |  12 +
 drivers/dma/mediatek/Makefile                      |   1 +
 drivers/dma/mediatek/mtk-cqdma.c                   | 952 +++++++++++++++++++++
 4 files changed, 996 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.txt
 create mode 100644 drivers/dma/mediatek/mtk-cqdma.c
