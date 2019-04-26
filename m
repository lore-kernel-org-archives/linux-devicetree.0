From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 HyperBus memory controller
Date: Fri, 26 Apr 2019 15:20:25 -0500
Message-ID: <20190426202025.GA24486@bogus>
References: <20190423104814.5762-1-vigneshr@ti.com>
 <20190423104814.5762-5-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190423104814.5762-5-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, devicetree@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2019 at 04:18:13PM +0530, Vignesh Raghavendra wrote:
> Add binding documentation for TI's HyperBus memory controller present on
> AM654 SoC.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 32 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> new file mode 100644
> index 000000000000..fc87c7918389
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> @@ -0,0 +1,32 @@
> +Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
> +
> +Required properties:
> +- compatible : "ti,am654-hbmc" for AM654 SoC
> +- reg : Two entries:
> +	First entry pointed to the register space of HBMC controller
> +	Second entry pointing to the memory map region dedicated for
> +	MMIO access to attached flash devices
> +- ranges : Address range allocated for each chipselect in the MMIO space
> +
> +Optional properties:
> +- mux-controls : phandle to the multiplexer that controls selection of
> +		 HBMC vs OSPI. Mux state of 1 indicates HBMC is selected.

So 1 is also the default because your example doesn't have the property?

> +
> +Example:
> +
> +	hbmc: hbmc@47034000 {
> +		compatible = "ti,am654-hbmc";
> +		reg = <0x0 0x47034000 0x0 0x100>,
> +			<0x5 0x00000000 0x1 0x0000000>;
> +		power-domains = <&k3_pds 55>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
> +			 <0x1 0x5 0x04000000 0x4000000>; /* CS1 - 64MB

This is wrong. You need 2 cells for the child address. The first cell is 
the CS and the 2nd cell is the offset (typically 0). Otherwise you have 
overlapping addresses with child addresses 0 and 1.

> +
> +		/* Slave flash node */
> +		flash@0 {

And then the unit-address here would be '0,0'.

> +			compatible = "cypress,hyperflash";

Doesn't match what you defined for this binding.

> +			reg = <0x0 0x4000000>;
> +		};
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5f22f85c848..1ade81f9a32a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7258,6 +7258,7 @@ S:	Supported
>  F:	drivers/mtd/hyperbus/
>  F:	include/linux/mtd/hyperbus.h
>  F:	Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
> +F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  
>  HYPERVISOR VIRTUAL CONSOLE DRIVER
>  L:	linuxppc-dev@lists.ozlabs.org
> -- 
> 2.21.0
> 
