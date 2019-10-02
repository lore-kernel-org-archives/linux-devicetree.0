From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: add the Amlogic Meson8 DDR clock
 controller binding
Date: Wed, 02 Oct 2019 09:19:11 -0500
Message-ID: <20191001235650.GA11980@bogus>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
 <20190921151835.770263-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190921151835.770263-2-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 21, 2019 at 05:18:30PM +0200, Martin Blumenstingl wrote:
> Amlogic Meson8, Meson8b and Meson8m2 SoCs have a DDR clock controller in
> the MMCBUS registers. There is no public documentation on this, but the
> GPL u-boot sources from the Amlogic BSP show that:
> - it uses the same XTAL input as the main clock controller
> - it contains a PLL which seems to be implemented just like the other
>   PLLs in this SoC
> - there is a power-of-two PLL post-divider
> 
> Add the documentation and header file for this DDR clock controller.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../clock/amlogic,meson8-ddr-clkc.yaml        | 50 +++++++++++++++++++
>  include/dt-bindings/clock/meson8-ddr-clkc.h   |  4 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
> new file mode 100644
> index 000000000000..bf3ca5888485
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0

(GPL-2.0-only OR BSD-2-Clause) for new bindings please.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,meson8-ddr-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic DDR Clock Controller Device Tree Bindings
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson8-ddr-clkc
> +      - amlogic,meson8b-ddr-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xtal
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ddr_clkc: clock-controller@400 {
> +      compatible = "amlogic,meson8-ddr-clkc";
> +      reg = <0x400 0x20>;
> +      clocks = <&xtal>;
> +      clock-names = "xtal";
> +      #clock-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/meson8-ddr-clkc.h b/include/dt-bindings/clock/meson8-ddr-clkc.h
> new file mode 100644
> index 000000000000..a8e0fa2987ab
> --- /dev/null
> +++ b/include/dt-bindings/clock/meson8-ddr-clkc.h
> @@ -0,0 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#define DDR_CLKID_DDR_PLL_DCO			0
> +#define DDR_CLKID_DDR_PLL			1
> -- 
> 2.23.0
> 
