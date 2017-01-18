From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Thu, 19 Jan 2017 00:09:37 +0100
Message-ID: <CACRpkdbU=DeZx4a8Ax8hh6iv0n1c-6XKVrts1ff=-_E5=_dc8A@mail.gmail.com>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>, Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Carlo Caione <carlo@caione.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 2:24 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> Allwinner, Amlogic, Mediatek or Rockchip.
>
> Add a binding for the GPU of that family.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> new file mode 100644
> index 000000000000..df05ba0ec357
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
> @@ -0,0 +1,76 @@
> +ARM Mali Utgard GPU
> +===================
> +
> +Required properties:
> +  - compatible:
> +    * "arm,mali-utgard" and one of the following:
> +      + "arm,mali-300"
> +      + "arm,mali-400"
> +      + "arm,mali-450"
> +
> +  - reg: Physical base address and length of the GPU registers
> +
> +  - interrupts: an entry for each entry in interrupt-names.
> +    See ../interrupt-controller/interrupts.txt for details.
> +
> +  - interrupt-names:
> +    * ppX: Pixel Processor X interrupt (X from 0 to 7)
> +    * ppmmuX: Pixel Processor X MMU interrupt (X from 0 to 7)
> +    * pp: Pixel Processor broadcast interrupt (mali-450 only)
> +    * gp: Geometry Processor interrupt
> +    * gpmmu: Geometry Processor MMU interrupt
> +
> +
> +Optional properties:
> +  - interrupt-names:
> +    * pmu: Power Management Unit interrupt, if implemented in hardware

On the MALI-400 MP in the ST-Ericsson DB8500 we have an additional interrupt
called "Mali400 combined". This is simply the HW designer's
doing an OR over all the 4 IRQ lines. Is this useful to define in the
bindings? Then it should be an optional

 * combined: all lines OR:ed together (if available)

Also you are defining "resets" below in the examples, should
this be listed as an optional property?

> +The Mali GPU is integrated very differently from one SoC to
> +another. In order to accommodate those differences, you have the option
> +to specify one more vendor-specific compatible, among:
> +
> +  - allwinner,sun4i-a10-mali
> +    Required properties:
> +      * clocks: an entry for each entry in clock-names
> +      * clock-names:
> +        + bus: bus clock for the GPU
> +        + core: clock driving the GPU itself
> +      * resets: phandle to the reset line for the GPU
> +
> +  - allwinner,sun7i-a20-mali
> +    Required properties:
> +      * clocks: an entry for each entry in clock-names
> +      * clock-names:
> +        + bus: bus clock for the GPU
> +        + core: clock driving the GPU itself
> +      * resets: phandle to the reset line for the GPU

Please add:

- stericsson,db8500-mali: also known as the "Smart Graphics
Accelerator" (SGA500)
   Required properties:
    * clocks: an entry for each entry in clock-names
    * clock-names:
      + bus: bus clock for the GPU (ICNCLK a.k.a. PRCMU_ACLK)
      + core: clock driving the GPU itself (PRCMU_SGACLK)

(It has no explicit reset line.)

With these:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
