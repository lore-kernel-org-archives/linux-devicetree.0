From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Thu, 19 Jan 2017 10:16:48 -0600
Message-ID: <20170119161648.u6tta5mogadli7ih@rob-hp-laptop>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, Carlo Caione <carlo@caione.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
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

Drop this. It's meaningless and 3 compatibles to match is the kernel is 
not a big deal.

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

Is the number of pixel processors probe-able? If not, then it needs to 
be implied by the vendor compatible string or a property.

> +    * pp: Pixel Processor broadcast interrupt (mali-450 only)
> +    * gp: Geometry Processor interrupt
> +    * gpmmu: Geometry Processor MMU interrupt

That's a lot of interrupts. Was going to ask about combining, but 
I see Linus raised that.

> +
> +
> +Optional properties:
> +  - interrupt-names:
> +    * pmu: Power Management Unit interrupt, if implemented in hardware
> +
> +Vendor-specific bindings
> +------------------------
> +
> +The Mali GPU is integrated very differently from one SoC to
> +another. In order to accommodate those differences, you have the option
> +to specify one more vendor-specific compatible, among:
> +
> +  - allwinner,sun4i-a10-mali

List this with the compatible strings. I assume one of the arm,mali-??? 
strings applies too.

> +    Required properties:
> +      * clocks: an entry for each entry in clock-names
> +      * clock-names:
> +        + bus: bus clock for the GPU
> +        + core: clock driving the GPU itself

This should be in the core binding. The number of clocks should not 
vary. We often get this wrong because the IP blocks get integrated and 
connected to the same clock source. But this should be equal to the 
number of clock inputs.

> +      * resets: phandle to the reset line for the GPU
> +
> +  - allwinner,sun7i-a20-mali
> +    Required properties:
> +      * clocks: an entry for each entry in clock-names
> +      * clock-names:
> +        + bus: bus clock for the GPU
> +        + core: clock driving the GPU itself
> +      * resets: phandle to the reset line for the GPU
> +
> +Example:
> +
> +mali: gpu@01c40000 {
> +	compatible = "allwinner,sun7i-a20-mali", "arm,mali-400",
> +		     "arm,mali-utgard";
> +	reg = <0x01c40000 0x10000>;
> +	interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-names = "gp",
> +			  "gpmmu",
> +			  "pp0",
> +			  "ppmmu0",
> +			  "pp1",
> +			  "ppmmu1",
> +			  "pmu";
> +	clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
> +	clock-names = "bus", "core";
> +	resets = <&ccu RST_BUS_GPU>;
> +};
> +
> +
> -- 
> 2.11.0
> 
