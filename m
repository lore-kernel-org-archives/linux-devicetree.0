From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 HyperBus memory controller
Date: Mon, 10 Jun 2019 19:25:21 +0300
Message-ID: <a808ffca-02a8-14b0-3422-c0905ab212a6@cogentembedded.com>
References: <20190609103227.24875-1-vigneshr@ti.com>
 <20190609103227.24875-5-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609103227.24875-5-vigneshr@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 06/09/2019 01:32 PM, Vignesh Raghavendra wrote:

> Add binding documentation for TI's HyperBus memory controller present on
> AM654 SoC.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v5:
> Update binding example to show MMIO mux
> Fix reg property for flash slave.
> 
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> new file mode 100644
> index 000000000000..c2a2c2b42a92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
> @@ -0,0 +1,51 @@
> +Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
> +
> +Required properties:
> +- compatible : "ti,am654-hbmc" for AM654 SoC
> +- reg : Two entries:
> +	First entry pointed to the register space of HBMC controller
> +	Second entry pointing to the memory map region dedicated for
> +	MMIO access to attached flash devices
> +- ranges : Address translation from offset within CS to allocated MMIO
> +	   space in SoC
> +
> +Optional properties:
> +- mux-controls : phandle to the multiplexer that controls selection of
> +		 HBMC vs OSPI inside Flash SubSystem. Default is OSPI,
> +		 if property is absent.
> +		 See Documentation/devicetree/bindings/mux/reg-mux.txt
> +		 for mmio-mux binding details
> +
> +Example:
> +
> +	fss: fss@47000000 {

   What's FSS?
   Regardless of the answer, the node names should be generic, like "memory-controller@".

> +		compatible = "syscon", "simple-mfd";

   If it's "sycon", the nme should probably be "system-controller".

> +		reg = <0x0 0x47000000 0x0 0x100>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		hbmc_mux: hbmc-mux {

   So, just "multiplexor"?

> +			compatible = "mmio-mux";
> +			#mux-control-cells = <1>;
> +			mux-reg-masks = <0x4 0x2>; /* 0: reg 0x4, bit 1 */
> +		};
> +
> +		hbmc: hbmc@47034000 {

   Should be named "memory-controller@47034000", according to the DT spec.

> +			compatible = "ti,am654-hbmc";
> +			reg = <0x0 0x47034000 0x0 0x100>,
> +				<0x5 0x00000000 0x1 0x0000000>;
> +			power-domains = <&k3_pds 55>;
> +			#address-cells = <2>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
> +				 <0x1 0x0 0x5 0x04000000 0x4000000>; /* CS1 - 64MB */
> +			mux-controls = <&hbmc_mux 0>;
> +
> +			/* Slave flash node */
> +			flash@0,0 {
> +				compatible = "cypress,hyperflash", "cfi-flash";
> +				reg = <0x0 0x0 0x4000000>;
> +			};
> +		};
> +	};
[...]

MBR, Sergei
