From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: brcmnand: Add brcm,bcm6368-nand device tree
 binding
Date: Fri, 4 Dec 2015 09:06:27 -0600
Message-ID: <20151204150627.GA29587@rob-hp-laptop>
References: <565F81A6.6060307@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <565F81A6.6060307-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 02, 2015 at 11:41:26PM +0000, Simon Arlott wrote:
> Add device tree binding for NAND on the BCM6368.
> 
> The BCM6368 has a NAND interrupt register with combined status and enable
> registers. It also requires a clock, so add an optional clock to the
> common brcmnand binding.
> 
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> Renamed from BCM63268, made clock a generic property.
> 
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index 4ff7128..16d7835 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -45,6 +45,8 @@ Required properties:
>  - #size-cells      : <0>
>  
>  Optional properties:
> +- clock                     : reference to the clock for the NAND controller
> +- clock-names               : "nand" (required for the above clock)
>  - brcm,nand-has-wp          : Some versions of this IP include a write-protect
>                                (WP) control bit. It is always available on >=
>                                v7.0. Use this property to describe the rare
> @@ -72,6 +74,12 @@ we define additional 'compatible' properties and associated register resources w
>         and enable registers
>       - reg-names: (required) "nand-int-base"
>  
> +   * "brcm,nand-bcm6368"
> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm6368"
> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
> +       and enable registers, and boot address registers
> +     - reg-names: (required) "nand-intr-base"
> +
>     * "brcm,nand-iproc"
>       - reg: (required) the "IDM" register range, for interrupt enable and APB
>         bus access endianness configuration, and the "EXT" register range,
> @@ -148,3 +156,27 @@ nand@f0442800 {
>  		};
>  	};
>  };
> +
> +nand@10000200 {
> +	compatible = "brcm,nand-bcm63168", "brcm,nand-bcm6368",
> +		"brcm,brcmnand-v4.0", "brcm,brcmnand";
> +	reg = <0x10000200 0x180>,
> +	      <0x10000600 0x200>,
> +	      <0x100000b0 0x10>;
> +	reg-names = "nand", "nand-cache", "nand-intr-base";
> +	interrupt-parent = <&periph_intc>;
> +	interrupts = <50>;
> +	clocks = <&periph_clk 20>;
> +	clock-names = "nand";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	nand0: nandcs@0 {
> +		compatible = "brcm,nandcs";
> +		reg = <0>;
> +		nand-on-flash-bbt;
> +		nand-ecc-strength = <1>;
> +		nand-ecc-step-size = <512>;
> +	};
> +};
> -- 
> 2.1.4
> 
> -- 
> Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
