From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] dt-bindings: dmaengine: Add one new cell to present
 hardware slave id
Date: Wed, 30 Jan 2019 17:51:46 +0100
Message-ID: <CAK8P3a2zkhrZLMi5KZ5=fGJCt85dad3_pZC0o7GqcwJkk4es9w@mail.gmail.com>
References: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a9718ae1e97a5911f47874fe23c00ef297d7fed8.1548158832.git.baolin.wang@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, eric.long@unisoc.com, arm-soc <arm@kernel.org>, Lyra Zhang <zhang.lyra@gmail.com>, Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Orson Zhai <orsonzhai@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 2:21 PM Baolin Wang <baolin.wang@linaro.org> wrote:
>
> The DMA engine clients can trigger DMA engine automatically by setting
> the corresponding hardware slave id for the DMA engine. Thus add one
> cell to present the hardware slave id for DMA clients.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/sprd-dma.txt |   12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/sprd-dma.txt b/Documentation/devicetree/bindings/dma/sprd-dma.txt
> index 7a10fea..7812cf0 100644
> --- a/Documentation/devicetree/bindings/dma/sprd-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/sprd-dma.txt
> @@ -6,8 +6,8 @@ Required properties:
>  - compatible: Should be "sprd,sc9860-dma".
>  - reg: Should contain DMA registers location and length.
>  - interrupts: Should contain one interrupt shared by all channel.
> -- #dma-cells: must be <1>. Used to represent the number of integer
> -       cells in the dmas property of client device.
> +- #dma-cells: must be <2>. Used to represent the channel id and slave id
> +       of integer cells in the dmas property of client device.
>  - #dma-channels : Number of DMA channels supported. Should be 32.
>  - clock-names: Should contain the clock of the DMA controller.
>  - clocks: Should contain a clock specifier for each entry in clock-names.
> @@ -28,14 +28,16 @@ apdma: dma-controller@20100000 {
>
>  Client:
>  DMA clients connected to the Spreadtrum DMA controller must use the format
> -described in the dma.txt file, using a two-cell specifier for each channel.
> -The two cells in order are:
> +described in the dma.txt file, using a three-cell specifier for each channel.
> +The three cells in order are:
>  1. A phandle pointing to the DMA controller.
>  2. The channel id.
> +3. The hardware slave id which is used for clients to trigger DMA engine
> +automatically.

I notice that this is an incompatible binding change. Is that necessary?
If the current code works, I'd suggest allowing both #dma-cells=<2>
and <3>, and then implementing both in the driver.

     Arnd
