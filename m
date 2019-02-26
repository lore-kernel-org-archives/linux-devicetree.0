Return-Path: <robherring2@gmail.com>
Date: Tue, 26 Feb 2019 13:53:54 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: add register based devices' mux
 controller DT bindings
Message-ID: <20190226195354.GA19598@bogus>
References: <20190224135143.24770-1-pankaj.bansal@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190224135143.24770-1-pankaj.bansal@nxp.com>
To: Pankaj Bansal <pankaj.bansal@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Feb 24, 2019 at 08:27:23AM +0000, Pankaj Bansal wrote:
> This adds device tree binding documentation for generic register based
> multiplexer controlled by a bitfields in a parent device's register range.
> 
> Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
> ---
> 
> Notes:
>     V3:
>     - Added the patch in series with the driver patch
>     - Fixed the node value out of bitfield error
>     - removed the "parent register r/w functions" line
>     V2:
>     - Removed syscon reference from txt file
>     - Removed loading zeroes from hex numbers
>     - Fixed the depth of dts nodes
>     - fixed minor formatting errors
> 
>  .../devicetree/bindings/mux/reg-mux.txt      | 83 ++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mux/reg-mux.txt b/Documentation/devicetree/bindings/mux/reg-mux.txt
> new file mode 100644
> index 000000000000..8bea6129c113
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mux/reg-mux.txt
> @@ -0,0 +1,83 @@
> +Generic register bitfield-based multiplexer controller bindings
> +
> +Define register bitfields to be used to control multiplexers. The parent
> +device tree node must be a device node to provide register r/w access.

We generally avoid register bit level bindings like this...

What happens when I need 8 or 16-bit accesses. Or some quirky encoding 
of the bits. Or non-contiguous bit fields... It's an endless extending 
of the binding to try to handle different cases.

> +
> +Required properties:
> +- compatible : "reg-mux"
> +- #mux-control-cells : <1>
> +- mux-reg-masks : an array of register offset and pre-shifted bitfield mask
> +                  pairs, each describing a single mux control.
> +* Standard mux-controller bindings as decribed in mux-controller.txt
> +
> +Optional properties:
> +- idle-states : if present, the state the muxes will have when idle. The
> +		special state MUX_IDLE_AS_IS is the default.
> +
> +The multiplexer state of each multiplexer is defined as the value of the
> +bitfield described by the corresponding register offset and bitfield mask pair
> +in the mux-reg-masks array.
> +
> +Example:
> +
> +&i2c0 {
> +	fpga@66 { // fpga connected to i2c
> +		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
> +			     "simple-mfd";
> +		reg = <0x66>;
> +
> +		mux: mux-controller { // Mux Producer
> +			compatible = "reg-mux";

> +			#mux-control-cells = <1>;
> +			mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
> +					<0x54 0x07>; /* 1: reg 0x54, bits 2:0 */

You can accomplish the same thing by moving these 2 properties to the 
parent. The parent driver can register a generic mux if that's 
appropriate.

Rob
