From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v5] add support for Mediatek Command-Queue DMA controller
 on MT6765 SoC
Date: Thu, 24 Jan 2019 01:35:01 -0800
Message-ID: <CAGp9LzqMbYOXCEmHOEcCboQLfpXwxH7zcJ3snj4a8NBLiHhQdg@mail.gmail.com>
References: <1548314060-4833-1-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548314060-4833-1-git-send-email-shun-chih.yu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shun-chih.yu@mediatek.com
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com, dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Shun-Chih,

the driver seems already be applied since v5.0-rc1

I suggest these improvements you made in the recent version can be
split into several patches and then be applied on the top of the base
driver.

On Wed, Jan 23, 2019 at 11:15 PM <shun-chih.yu@mediatek.com> wrote:
>
> This patchset introduces support for MediaTek Command-Queue DMA controller.
>
> MediaTek Command-Queue DMA controller (CQDMA) on MT6765 SoC is dedicated to memory-to-memory transfer through queue-based descriptor management.
>
> There are only 3 physical channels inside CQDMA, while the driver is extended to support 32 virtual channels for multiple dma users to issue dma requests onto the CQDMA simultaneously.
>
> dmatest result:
> dmatest: dma0chan0-copy2: summary 5000 tests, 0 failures 3500 iops 28037 KB/s (0)
> dmatest: dma0chan0-copy4: summary 5000 tests, 0 failures 3494 iops 27612 KB/s (0)
> dmatest: dma0chan0-copy1: summary 5000 tests, 0 failures 3491 iops 27749 KB/s (0)
> dmatest: dma0chan0-copy7: summary 5000 tests, 0 failures 3673 iops 29092 KB/s (0)
> dmatest: dma0chan0-copy6: summary 5000 tests, 0 failures 3763 iops 30237 KB/s (0)
> dmatest: dma0chan0-copy0: summary 5000 tests, 0 failures 3730 iops 30131 KB/s (0)
> dmatest: dma0chan0-copy3: summary 5000 tests, 0 failures 3717 iops 29569 KB/s (0)
> dmatest: dma0chan0-copy5: summary 5000 tests, 0 failures 3699 iops 29302 KB/s (0)
>
> Changes since v4:
> - remove redundant queue structure in mtk_cqdma_pchan
> - remove redundant completion management
> - fix wrong residue assignment in mtk_cqdma_tx_status
> - fix typos
>
> Changes since v3:
> - simplify the ISR and management on descriptors by removing tasklet and ASYNC_TX_ENABLE_CHANNEL_SWITCH
> - remove useless field in mtk_cqdma_vdesc structure
> - change dev_info to dev_dbg
> - fix typos
>
> Changes since v2:
> - fix build warning for kernel with DMA address in 32-bit
>
> Changes since v1:
> - remove unused macros, typos
> - leverage ASYNC_TX_ENABLE_CHANNEL_SWITCH to maintain DMA descriptor list
>
> Shun-Chih Yu (2):
>   dt-bindings: dmaengine: Add MediaTek Command-Queue DMA controller
>     bindings
>   dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for
>     MT6765 SoC
>
>  .../devicetree/bindings/dma/mtk-cqdma.txt          |   31 +
>  drivers/dma/mediatek/Kconfig                       |   12 +
>  drivers/dma/mediatek/Makefile                      |    1 +
>  drivers/dma/mediatek/mtk-cqdma.c                   |  748 ++++++++++++++++++++
>  4 files changed, 792 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.txt
>  create mode 100644 drivers/dma/mediatek/mtk-cqdma.c
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
