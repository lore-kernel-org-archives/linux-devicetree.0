From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: dma: Convert Allwinner A31 and A64 DMA
 to a schema
Date: Fri, 12 Jul 2019 07:07:30 -0600
Message-ID: <CAL_JsqLrVRsWM5ORM9QwjgJyVuPUauCXcY24Qvevvo7wRWgvmw@mail.gmail.com>
References: <20190711092158.14678-1-maxime.ripard@bootlin.com>
 <20190711092158.14678-3-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190711092158.14678-3-maxime.ripard@bootlin.com>
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
> The newer Allwinner SoCs have a DMA controller supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../dma/allwinner,sun50i-a64-dma.yaml         | 88 +++++++++++++++++++
>  .../bindings/dma/allwinner,sun6i-a31-dma.yaml | 62 +++++++++++++
>  .../devicetree/bindings/dma/sun6i-dma.txt     | 81 -----------------
>  3 files changed, 150 insertions(+), 81 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
>  create mode 100644 Documentation/devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/sun6i-dma.txt

Reviewed-by: Rob Herring <robh@kernel.org>
