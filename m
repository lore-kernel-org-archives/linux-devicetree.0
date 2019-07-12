From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: dma: Convert Allwinner A10 DMA to a
 schema
Date: Fri, 12 Jul 2019 07:09:02 -0600
Message-ID: <CAL_JsqLJkoudu3mw9wVuN1RM-VPGSWj+Vv6L=C=N-DtW_vOAdA@mail.gmail.com>
References: <20190711092158.14678-1-maxime.ripard@bootlin.com>
 <20190711092158.14678-2-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190711092158.14678-2-maxime.ripard@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Vinod Koul <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 11, 2019 at 3:36 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The older Allwinner SoCs have a DMA controller supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../bindings/dma/allwinner,sun4i-a10-dma.yaml | 55 +++++++++++++++++++
>  .../devicetree/bindings/dma/sun4i-dma.txt     | 45 ---------------
>  2 files changed, 55 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/sun4i-dma.txt

Reviewed-by: Rob Herring <robh@kernel.org>
