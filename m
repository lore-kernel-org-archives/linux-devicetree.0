From: <shun-chih.yu@mediatek.com>
Subject: [PATCH] remove redundant queue structure for Mediatek Command-Queue
 DMA controller
Date: Thu, 24 Jan 2019 18:44:38 +0800
Message-ID: <1548326680-16454-1-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com, linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patchset introduces support for MediaTek Command-Queue DMA controller in dt-bindings, and simplifies the controller by removing redundant structures.

Main changes to the initial version:
- remove redundant queue structure in mtk_cqdma_pchan
- remove redundant completion management
- remove redundant tasklet management
- fix wrong residue assignment in mtk_cqdma_tx_status
- fix typos

The result of dmatest shown below:
dmatest: dma0chan0-copy2: summary 5000 tests, 0 failures 3500 iops 28037 KB/s
dmatest: dma0chan0-copy4: summary 5000 tests, 0 failures 3494 iops 27612 KB/s
dmatest: dma0chan0-copy1: summary 5000 tests, 0 failures 3491 iops 27749 KB/s
dmatest: dma0chan0-copy7: summary 5000 tests, 0 failures 3673 iops 29092 KB/s 
dmatest: dma0chan0-copy6: summary 5000 tests, 0 failures 3763 iops 30237 KB/s 
dmatest: dma0chan0-copy0: summary 5000 tests, 0 failures 3730 iops 30131 KB/s
dmatest: dma0chan0-copy3: summary 5000 tests, 0 failures 3717 iops 29569 KB/s
dmatest: dma0chan0-copy5: summary 5000 tests, 0 failures 3699 iops 29302 KB/s

Shun-Chih Yu (2):
  dt-bindings: dmaengine: Add MediaTek Command-Queue DMA controller
    bindings
  dmaengine: mediatek-cqdma: remove redundant queue structure

 .../devicetree/bindings/dma/mtk-cqdma.txt          |   31 ++
 drivers/dma/mediatek/mtk-cqdma.c                   |  399 +++++---------------
 2 files changed, 129 insertions(+), 301 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.txt
