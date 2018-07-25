Return-Path: <robherring2@gmail.com>
Date: Wed, 25 Jul 2018 13:25:00 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt: bindings: Document ZynqMP DDRC in Synopsys
 documentation
Message-ID: <20180725192500.GA7228@rob-hp-laptop>
References: <1531995290-15643-1-git-send-email-manish.narani@xilinx.com>
 <1531995290-15643-3-git-send-email-manish.narani@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531995290-15643-3-git-send-email-manish.narani@xilinx.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, mdf@kernel.org, willw@xilinx.com, naga.sureshkumar.relli@xilinx.com, edgar.iglesias@xilinx.com, bharat.kumar.gogada@xilinx.com, shubhrajyoti.datta@xilinx.com, stefan.krsmanovic@aggios.com, anirudh@xilinx.com, sgoud@xilinx.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 19, 2018 at 03:44:48PM +0530, Manish Narani wrote:
> This patch documents Synopsys EDAC driver which reports the single bit

Bindings are for h/w, not drivers. I'm pretty sure Synopsys doesn't make 
an "EDAC driver".

> errors that are corrected and the double bit errors that are detected.
> 
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
>  .../bindings/memory-controllers/synopsys.txt       | 25 ++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/synopsys.txt b/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
> index a43d26d..5d20b76 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/synopsys.txt
> @@ -1,15 +1,32 @@
>  Binding for Synopsys IntelliDDR Multi Protocol Memory Controller
>  
> -This controller has an optional ECC support in half-bus width (16-bit)
> -configuration. The ECC controller corrects one bit error and detects
> +Synopsys EDAC driver, it does reports the DDR ECC single bit errors
> +that are corrected and double bit ecc errors that are detected by the DDR
> +ECC controller.

Describe the h/w, not drivers.

s/it does reports/it reports/
s/ecc/ECC/

> +
> +The Zynq DDR ECC controller has an optional ECC support in half-bus width
> +(16-bit) configuration. The ECC controller corrects one bit error and detects
>  two bit errors.
>  
>  Required properties:
> - - compatible: Should be 'xlnx,zynq-ddrc-a05'
> - - reg: Base address and size of the controllers memory area
> + - compatible: One of:
> +	- 'xlnx,zynq-ddrc-a05' : Zynq DDR ECC controller
> +	- 'xlnx,zynqmp-ddrc-2.40a' : ZynqMP DDR ECC controller
> + - reg: Should contain DDR controller registers location and length.
> +
> +Required properties for "xlnx,zynqmp-ddrc-2.40a":
> + - interrupt-parent: Should be core interrupt controller.

Drop this. It is implied.

> + - interrupts: Property with a value describing the interrupt number.

No interrupt for Zynq? That makes ECC reporting hard...

>  
>  Example:
>  	memory-controller@f8006000 {
>  		compatible = "xlnx,zynq-ddrc-a05";
>  		reg = <0xf8006000 0x1000>;
>  	};
> +
> +	mc: memory-controller@fd070000 {
> +		compatible = "xlnx,zynqmp-ddrc-2.40a";
> +		reg = <0x0 0xfd070000 0x0 0x30000>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 112 4>;
> +	};
> -- 
> 2.1.1
> 
