From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] Documentation/devicetree: document OCTEON USB bindings
Date: Thu, 19 Nov 2015 08:38:33 -0600
Message-ID: <20151119143833.GA2756@rob-hp-laptop>
References: <1447802000-1637-1-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447802000-1637-1-git-send-email-aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 01:13:20AM +0200, Aaro Koskinen wrote:
> Document device-tree bindings for the USB controller on older
> OCTEON SOCs (OCTEON, OCTEON+).
> 
> Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> 
> 	v2: Deprecate "refclk-frequency" and "refclk-type".
> 
> 	v1: See http://www.spinics.net/lists/devicetree/msg78051.html
> 
>  .../devicetree/bindings/usb/octeon-usb.txt         | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/octeon-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/octeon-usb.txt b/Documentation/devicetree/bindings/usb/octeon-usb.txt
> new file mode 100644
> index 0000000..205c8d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/octeon-usb.txt
> @@ -0,0 +1,62 @@
> +OCTEON/OCTEON+ USB BLOCK
> +
> +1) Main node
> +
> +   Required properties:
> +
> +   - compatible: must be "cavium,octeon-5750-usbn"
> +
> +   - reg: specifies the physical base address of the USBN block and
> +     the length of the memory mapped region.
> +
> +   - #address-cells: specifies the number of cells needed to encode an
> +     address. The value must be 2.
> +
> +   - #size-cells: specifies the number of cells used to represent the size
> +     of an address. The value must be 2.
> +
> +   - ranges: specifies the translation between child address space and parent
> +     address space.
> +
> +   - clock-frequency: speed of the USB reference clock. Allowed values are
> +     12000000, 24000000 or 48000000.
> +
> +   - cavium,refclk-type: type of the USB reference clock. Allowed values are
> +     "crystal" or "external".
> +
> +   - refclk-frequency: deprecated, use "clock-frequency".
> +
> +   - refclk-type: deprecated, use "cavium,refclk-type".
> +
> +2) Child node
> +
> +   The main node must have one child node which describes the built-in
> +   USB controller.
> +
> +   Required properties:
> +
> +   - compatible: must be "cavium,octeon-5750-usbc"
> +
> +   - reg: specifies the physical base address of the USBC block and
> +     the length of the memory mapped region.
> +
> +   - interrupts: specifies the interrupt number for the USB controller.
> +
> +3) Example:
> +
> +	usbn: usbn@1180068000000 {
> +		compatible = "cavium,octeon-5750-usbn";
> +		reg = <0x11800 0x68000000 0x0 0x1000>;
> +		ranges; /* Direct mapping */
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		clock-frequency = <12000000>;
> +		cavium,refclk-type = "crystal";
> +
> +		usbc@16f0010000000 {
> +			compatible = "cavium,octeon-5750-usbc";
> +			reg = <0x16f00 0x10000000 0x0 0x80000>;
> +			interrupts = <0 56>;
> +		};
> +	};
> +
> -- 
> 2.4.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
