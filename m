From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] doc/devicetree: Add Aspeed VIC bindings
Date: Wed, 11 May 2016 09:33:13 -0500
Message-ID: <20160511143313.GA7426@rob-hp-laptop>
References: <462797239-14765-1-git-send-email-joel@jms.id.au>
 <1462802317-27086-1-git-send-email-joel@jms.id.au>
 <1462802317-27086-2-git-send-email-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462802317-27086-2-git-send-email-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 09, 2016 at 11:28:36PM +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
> v2:
>   Fix device tree binding example, thanks Baruch and Arnd for pointing this out
> 
>  .../interrupt-controller/aspeed,ast2400-vic.txt    | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
> new file mode 100644
> index 000000000000..86dede1755a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
> @@ -0,0 +1,24 @@
> +Aspeed Vectored Interrupt Controller
> +
> +These bindings are for the Aspeed AST2400 interrupt controller register layout.
> +The SoC has an legacy register layout, but this driver does not support that
> +mode of operation.
> +
> +Required properties:
> +
> +- compatible : should be "aspeed,ast2400-vic".
> +
> +- interrupt-controller : Identifies the node as an interrupt controller
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +  interrupt source. The value shall be 1.

No need for level vs. edge flags?

> +- valid-sources : bitmask of valid irq sources

Drop this. Either all interrupt controllers need this or none of 
them do. The valid sources are the ones described in the DT.

> +
> +Example:
> +
> + vic: interrupt-controller {

Needs a unit address.

> +      compatible = "aspeed,ast2400-vic";
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +      valid-sources = < 0xffffffff 0x0007ffff>;
> +      reg = <0x1e6c0080 0x80>;
> + };
> -- 
> 2.8.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
