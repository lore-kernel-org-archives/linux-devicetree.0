From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add MediaTek Command-Queue
 DMA controller bindings
Date: Mon, 17 Sep 2018 01:44:54 -0400
Message-ID: <5b9f3f57.1c69fb81.17be4.3001@mx.google.com>
References: <1536050626-21927-1-git-send-email-shun-chih.yu@mediatek.com>
 <1536050626-21927-2-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1536050626-21927-2-git-send-email-shun-chih.yu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com, dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Shun-Chih Yu <shun-chih.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 4 Sep 2018 16:43:45 +0800, <shun-chih.yu@mediatek.com> wrote:
> From: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> 
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6765 SoC or other similar Mediatek SoCs.
> 
> Signed-off-by: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> ---
>  .../devicetree/bindings/dma/mtk-cqdma.txt          |   31 ++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
