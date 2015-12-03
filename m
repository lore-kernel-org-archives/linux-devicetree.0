From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH (v2) 1/2] reset: Add brcm,bcm6345-reset device tree
 binding
Date: Thu, 03 Dec 2015 09:39:03 +0100
Message-ID: <1449131943.3339.8.camel@pengutronix.de>
References: <565F5C96.5090700@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565F5C96.5090700-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

Am Mittwoch, den 02.12.2015, 21:03 +0000 schrieb Simon Arlott:
> Add device tree binding for the BCM6345 soft reset controller.
> 
> The BCM6345 contains a soft-reset controller activated by setting
> a bit (that must previously have cleared).
> 
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
> ---
> Renamed to bcm6345, removed "mask" property.
> 
>  .../bindings/reset/brcm,bcm6345-reset.txt          | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
> new file mode 100644
> index 0000000..bb9ca6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.txt
> @@ -0,0 +1,33 @@
> +Broadcom BCM6345 reset controller
> +
> +The BCM6345 contains a basic soft reset controller in the perf register
> +set which resets components using a bit in a register.
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +- compatible:	Should be "brcm,bcm<soc>-reset", "brcm,bcm6345-reset"

> +- regmap:	The register map phandle
> +- offset:	Offset in the register map for the reset register (in bytes)

Is this something the device tree maintainers are happy with?
I see there are already some regmap properties in the device tree, but
in this case it looks to me like the reset controller node should be a
child of the periph_cntl node as that register space is the only means
of controlling it.

> +- #reset-cells:	Must be set to 1
> +
> +Example:
> +
> +periph_soft_rst: reset-controller {
> +	compatible = "brcm,bcm63168-reset", "brcm,bcm6345-reset";
> +	regmap = <&periph_cntl>;
> +	offset = <0x10>;
> +
> +	#reset-cells = <1>;
> +};

I would have written it something like this:

periph_cntl: ... {
	compatible = "syscon", "simple-mfd";
	#address-cells = <1>;
	#size-cells = <1>;

	periph_soft_rst: reset-controller {
		compatible = "brcm,bcm6345-reset";
		reg = <0x10 0x4>;
		#reset-cells = <1>;
	};
};

for a device that is only controlled through a syscon.
The driver itself looks good to me.

best regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
