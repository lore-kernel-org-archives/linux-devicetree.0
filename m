From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v14 2/7] fpga: add bindings document for fpga area
Date: Fri, 11 Dec 2015 08:34:49 -0600
Message-ID: <20151211143449.GA19387@rob-hp-laptop>
References: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
 <1449790629-5517-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449790629-5517-3-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 05:37:04PM -0600, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> New bindings document for FPGA Area for reprogramming
> FPGA's under Device Tree control
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> ---
> v9:  initial version added to this patchset
> v10: s/fpga/FPGA/g
>      replace DT overlay example with slightly more complicated example
>      move to staging/simple-fpga-bus
> v11: No change in this patch for v11 of the patch set
> v12: Moved out of staging.
>      Changed to use FPGA bridges framework instead of resets
>      for bridges.
> v13: bridge@0xff20000 -> bridge@ff200000, etc
>      Leave out directly talking about overlays
>      Remove regs and clocks directly under simple-fpga-bus in example
>      Use common "firmware-name" binding instead of "fpga-firmware"
> v14: Use firmware-name in bindings description
>      Call it FPGA Area
>      Remove bindings that specify FPGA Manager and FPGA Bridges
> ---
>  .../devicetree/bindings/fpga/fpga-area.txt         |   70 ++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/fpga-area.txt
> 
> diff --git a/Documentation/devicetree/bindings/fpga/fpga-area.txt b/Documentation/devicetree/bindings/fpga/fpga-area.txt
> new file mode 100644
> index 0000000..d656e35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/fpga-area.txt
> @@ -0,0 +1,70 @@
> +FPGA Area
> +=========
> +
> +A FPGA Area details information about a section of an FPGA including the FPGA
> +image needed to program it and the hardware contained in this section of the
> +FPGA once it is programmed.
> +
> +A FPGA Area corresponds to the whole FPGA in the case of full reconfiguration
> +or a section of a FPGA in the case of partial reconfiguration.
> +
> +Required properties:
> +- compatible : should contain "fpga-area"

I'm not too sure about this. I think this needs to be FPGA specfic.

> +- #address-cells, #size-cells, ranges: must be present to handle address space
> +  mapping for children.
> +
> +Optional properties:
> +- firmware-name : should contain the name of a FPGA image file located on the
> +  firmware search path.
> +- partial-reconfig : boolean property should be defined if partial
> +  reconfiguration of the FPGA is to be done, otherwise full reconfiguration
> +  is done.
> +
> +Example:
> +
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	fragment@0 {
> +		target-path="/soc/fpgamgr@0/bridge@0";

Does the bus really go thru the fpgamgr and then the bridge as this 
implies? Or fpgamgr is a sideband controller? For example purposes, it 
would be better to show this not as an overlay so I get the complete 
picture.

Unit addresses of 0 look a bit questionable as I'd expect these to be 
addresses.

> +		__overlay__ {
> +			#address-cells = <1>;
> +	                #size-cells = <1>;
> +
> +			bridge@ff200000 {

2 levels of bridge devices/buses?

There is nothing programmable for this bridge? clocks, resets, etc.?

> +				compatible = "fpga-area";
> +
> +				#address-cells = <2>;
> +				#size-cells = <1>;
> +
> +				ranges = <0 0x00000000 0xc0000000 0x00010000>,
> +					 <1 0x00020000 0xff220000 0x00000008>,
> +					 <1 0x00010040 0xff210040 0x00000020>;
> +
> +				firmware-name = "soc_system.rbf";
> +
> +				onchip_memory2_0: memory@000000000 {
> +					device_type = "memory";
> +					compatible = "altr,onchipmem-15.1";
> +					reg = <0 0x00000000 0x00010000>;
> +				};
> +
> +				jtag_uart: serial@100020000 {
> +					compatible = "altr,juart-1.0";
> +					reg = <1 0x00020000 0x00000008>;
> +					interrupt-parent = <&intc>;
> +					interrupts = <0 42 4>;
> +				};
> +
> +				led_pio: gpio@100010040 {
> +					compatible = "altr,pio-1.0";
> +					reg = <1 0x00010040 0x00000020>;
> +					altr,gpio-bank-width = <4>;
> +					#gpio-cells = <2>;
> +					gpio-controller;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
