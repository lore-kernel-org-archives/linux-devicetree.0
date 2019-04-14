From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 HyperBus memory controller
Date: Sun, 14 Apr 2019 20:55:53 +0300
Message-ID: <6a69ce6f-66c0-3f7c-a326-d76ee717cacf@cogentembedded.com>
References: <20190412092923.24919-1-vigneshr@ti.com>
 <20190412092923.24919-5-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412092923.24919-5-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/12/2019 12:29 PM, Vignesh Raghavendra wrote:

> Add binding documentation for TI's HyperBus memory controller present on
> AM654 SoC.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 31 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> new file mode 100644
> index 000000000000..00888482df25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> @@ -0,0 +1,31 @@
[...]
> +Optional properties:
> +- mux-controls: phandle to the multiplexer that controls selection of
> +		HBMC vs OSPI. Mux state of 1 indicates HBMC is selected.

   I thought this is usually done with the help of drivers/pinctrl/..

> +
> +Example:
> +	hbmc: hbmc@47034000 {
> +		compatible = "ti,am654-hbmc";
> +		reg = <0x0 0x47034000 0x0 0x100>,
> +			<0x5 0x00000000 0x1 0x0000000>;
> +		power-domains = <&k3_pds 55>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
> +			 <0x1 0x5 0x04000000 0x4000000>; /* CS1 - 64MB
> +
> +		/* Slave flash node */
> +		flash@0{

   Need space before {.

> +			compatible = "cypress,hyperflash";
> +			reg = <0x0 0x4000000>;
> +		};
> +	};
[...]

MBR, Sergei
