From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Mon, 10 Apr 2017 13:12:15 -0500
Message-ID: <20170410181215.e6cihbv2rfljbm3b@rob-hp-laptop>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491401247-7030-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1491401247-7030-4-git-send-email-jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 05, 2017 at 04:07:21PM +0200, Jacopo Mondi wrote:
> Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
> controller.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 218 +++++++++++++++++++++
>  1 file changed, 218 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> new file mode 100644
> index 0000000..46584ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> @@ -0,0 +1,218 @@
> +Renesas RZ/A1 combined Pin and GPIO controller
> +
> +The Renesas SoCs of RZ/A1 family feature a combined Pin and GPIO controller,
> +named "Ports" in the hardware reference manual.
> +Pin multiplexing and GPIO configuration is performed on a per-pin basis
> +writing configuration values to per-port register sets.
> +Each "port" features up to 16 pins, each of them configurable for GPIO
> +function (port mode) or in alternate function mode.
> +Up to 8 different alternate function modes exist for each single pin.
> +
> +Pin controller node
> +-------------------
> +
> +Required properties:
> +  - compatible
> +    this shall be "renesas,r7s72100-ports".
> +
> +  - reg
> +    address base and length of the memory area where pin controller
> +    hardware is mapped to.
> +
> +Example:
> +Pin controller node for RZ/A1H SoC (r7s72100)
> +
> +pinctrl: pin-controller@fcfe3000 {
> +	compatible = "renesas,r7s72100-ports";
> +
> +	reg = <0xfcfe3000 0x4230>;
> +};
> +
> +Sub-nodes
> +---------
> +
> +The child nodes of the pin controller node describe a pin multiplexing
> +function or a gpio controller alternatively.
> +
> +- Pin multiplexing sub-nodes:
> +  A pin multiplexing sub-node describes how to configure a set of
> +  (or a single) pin in some desired alternate function mode.
> +  A single sub-node may define several pin configurations.
> +  Some alternate functions require special pin configuration flags to be
> +  supplied along with the alternate function configuration number.
> +  When hardware reference manual specifies a pin function to be either
> +  "bi-directional" or "software IO driven", use the generic properties from
> +  <include/linux/pinctrl/pinconf_generic.h> header file to instruct the
> +  pin controller to perform the desired pin configuration operations.
> +  Please refer to pinctrl-bindings.txt to get to know more on generic
> +  pin properties usage.
> +
> +  The allowed generic formats for a pin multiplexing sub-node are the
> +  following ones:
> +
> +  node-1 {
> +      pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> +      GENERIC_PINCONFIG;

What's GENERIC_PINCONFIG? I see this in some other binding docs, but not 
used anywhere. If this is a boolean property then get rid of the all 
caps. If this is a define, then don't use complex defines that expand to 
dts source.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
