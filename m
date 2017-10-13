From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add Spreadtrum SC27xx PMIC
 documentation
Date: Fri, 13 Oct 2017 10:07:26 +0100
Message-ID: <20171013090726.y6mzuf7fdynnp2rj@dell>
References: <73965e7fb34d6a96529589cdf48e54e95ed666b8.1507723345.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73965e7fb34d6a96529589cdf48e54e95ed666b8.1507723345.git.baolin.wang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Oct 2017, Baolin Wang wrote:

> This patch adds the binding documentation for Spreadtrum SC27xx series
> PMIC device.
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
>  .../devicetree/bindings/mfd/sprd,sc27xx-pmic.txt   |   23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
> new file mode 100644
> index 0000000..333c818
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
> @@ -0,0 +1,23 @@
> +Spreadtrum SC27xx Power Management Integrated Circuit (PMIC)

More info please.

What does the ship do and what other devices are available.

> +Required properties:
> +- compatible: Should be "sprd,sc2731".
> +- reg: SPI chip select.

Really?  Not an address?

What is the range?

> +- spi-max-frequency: Typically set to 26000000.
> +- interrupts: The interrupt line the device is connected to.
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells: The number of cells to describe an PMIC IRQ, should be 2.

What if it's not 2?  Will it still work?

> +- #address-cells: Child device offset number of cells, should be 1.

Same.

> +- #size-cells: Child device size number of cells, should be 0.

Same.

> +
> +Example:
> +pmic: pmic@0 {

What other nodes are you referencing this one from?

> +	compatible = "sprd,sc2731";
> +	reg = <0>;
> +	spi-max-frequency = <26000000>;
> +	interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-controller;
> +	#interrupt-cells = <2>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
