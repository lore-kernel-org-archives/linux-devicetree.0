From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/6] mfd: dt: Add Aspeed Low Pin Count Controller
 bindings
Date: Tue, 3 Jan 2017 17:49:17 +0000
Message-ID: <20170103174917.GC27589@dell>
References: <20161206025321.1792-1-andrew@aj.id.au>
 <20161206025321.1792-4-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161206025321.1792-4-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 06 Dec 2016, Andrew Jeffery wrote:

> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>

Applied with Acks, thanks.

> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> new file mode 100644
> index 000000000000..a97131aba446
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -0,0 +1,111 @@
> +======================================================================
> +Device tree bindings for the Aspeed Low Pin Count (LPC) Bus Controller
> +======================================================================
> +
> +The LPC bus is a means to bridge a host CPU to a number of low-bandwidth
> +peripheral devices, replacing the use of the ISA bus in the age of PCI[0]. The
> +primary use case of the Aspeed LPC controller is as a slave on the bus
> +(typically in a Baseboard Management Controller SoC), but under certain
> +conditions it can also take the role of bus master.
> +
> +The LPC controller is represented as a multi-function device to account for the
> +mix of functionality it provides. The principle split is between the register
> +layout at the start of the I/O space which is, to quote the Aspeed datasheet,
> +"basically compatible with the [LPC registers from the] popular BMC controller
> +H8S/2168[1]", and everything else, where everything else is an eclectic
> +collection of functions with a esoteric register layout. "Everything else",
> +here labeled the "host" portion of the controller, includes, but is not limited
> +to:
> +
> +* An IPMI Block Transfer[2] Controller
> +
> +* An LPC Host Controller: Manages LPC functions such as host vs slave mode, the
> +  physical properties of some LPC pins, configuration of serial IRQs, and
> +  APB-to-LPC bridging amonst other functions.
> +
> +* An LPC Host Interface Controller: Manages functions exposed to the host such
> +  as LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
> +  management and bus snoop configuration.
> +
> +* A set of SuperIO[3] scratch registers: Enables implementation of e.g. custom
> +  hardware management protocols for handover between the host and baseboard
> +  management controller.
> +
> +Additionally the state of the LPC controller influences the pinmux
> +configuration, therefore the host portion of the controller is exposed as a
> +syscon as a means to arbitrate access.
> +
> +[0] http://www.intel.com/design/chipsets/industry/25128901.pdf
> +[1] https://www.renesas.com/en-sg/doc/products/mpumcu/001/rej09b0078_h8s2168.pdf?key=7c88837454702128622bee53acbda8f4
> +[2] http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
> +[3] https://en.wikipedia.org/wiki/Super_I/O
> +
> +Required properties
> +===================
> +
> +- compatible:	One of:
> +		"aspeed,ast2400-lpc", "simple-mfd"
> +		"aspeed,ast2500-lpc", "simple-mfd"
> +
> +- reg:		contains the physical address and length values of the Aspeed
> +                LPC memory region.
> +
> +- #address-cells: <1>
> +- #size-cells:	<1>
> +- ranges: 	Maps 0 to the physical address and length of the LPC memory
> +                region
> +
> +Required LPC Child nodes
> +========================
> +
> +BMC Node
> +--------
> +
> +- compatible:	One of:
> +		"aspeed,ast2400-lpc-bmc"
> +		"aspeed,ast2500-lpc-bmc"
> +
> +- reg:		contains the physical address and length values of the
> +                H8S/2168-compatible LPC controller memory region
> +
> +Host Node
> +---------
> +
> +- compatible:   One of:
> +		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> +		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> +
> +- reg:		contains the address and length values of the host-related
> +                register space for the Aspeed LPC controller
> +
> +- #address-cells: <1>
> +- #size-cells:	<1>
> +- ranges: 	Maps 0 to the address and length of the host-related LPC memory
> +                region
> +
> +Example:
> +
> +lpc: lpc@1e789000 {
> +	compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +	reg = <0x1e789000 0x1000>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0x0 0x1e789000 0x1000>;
> +
> +	lpc_bmc: lpc-bmc@0 {
> +		compatible = "aspeed,ast2500-lpc-bmc";
> +		reg = <0x0 0x80>;
> +	};
> +
> +	lpc_host: lpc-host@80 {
> +		compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> +		reg = <0x80 0x1e0>;
> +		reg-io-width = <4>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x80 0x1e0>;
> +	};
> +};
> +

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
