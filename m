From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: Add YAML schemas for the generic
 DMA bindings
Date: Mon, 22 Jul 2019 07:50:40 -0600
Message-ID: <CAL_JsqL2dxZMpwP08xMjwdkv5kdeZGrTYwdHuvqAcY-nBuZ+fA@mail.gmail.com>
References: <20190720092607.31095-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190720092607.31095-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Vinod Koul <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 20, 2019 at 3:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The DMA controllers and consumers have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Added a select statement.
>
> Changes from v1:
>   - Dropped the dma consumer schemas
>   - Fixed the node name of the examples
>   - Enhanced a bit the description for dma-requests in case of a router
>   - Split the bindings in two to handle the router and controller case
>     separately
>   - Made #dma-cells required
> ---
>  .../devicetree/bindings/dma/dma-common.yaml   |  45 +++++++
>  .../bindings/dma/dma-controller.yaml          |  35 ++++++
>  .../devicetree/bindings/dma/dma-router.yaml   |  50 ++++++++
>  Documentation/devicetree/bindings/dma/dma.txt | 114 +-----------------
>  4 files changed, 131 insertions(+), 113 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/dma-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/dma/dma-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/dma/dma-router.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
