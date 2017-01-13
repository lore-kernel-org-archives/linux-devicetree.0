From: Stefan Schmidt <stefan-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v7 2/3] ieee802154: Add device tree documentation for
 CA8210
Date: Fri, 13 Jan 2017 13:47:51 +0100
Message-ID: <4124e6b8-1eca-aee5-0f41-f56226ec9dae@osg.samsung.com>
References: <20170110154122.6724-1-h.morris@cascoda.com>
 <20170110154122.6724-3-h.morris@cascoda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110154122.6724-3-h.morris-viW/wkEPc65BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harry Morris <harrymorris12-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wpan-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: aar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, Harry Morris <h.morris-viW/wkEPc65BDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Harry.

Alex pointed out that we might want to run the addition to 
vendor-prefixes.txt through the devicetree list and maintainers.

Should really not be a problem but that way they are at least aware. I 
added them in CC for this patch.

On 10/01/17 16:41, Harry Morris wrote:
> Signed-off-by: Harry Morris <h.morris-viW/wkEPc65BDgjK7y7TUQ@public.gmane.org>
> Acked-by: Stefan Schmidt <stefan-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
>  .../devicetree/bindings/net/ieee802154/ca8210.txt  | 28 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
>
> diff --git a/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
> new file mode 100644
> index 0000000..a1046e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
> @@ -0,0 +1,28 @@
> +* CA8210 IEEE 802.15.4 *
> +
> +Required properties:
> +	- compatible:           Should be "cascoda,ca8210"
> +	- reg:                  Controlling chip select
> +	- spi-max-frequency:    Maximum clock speed, should be *less than*
> +	                        4000000
> +	- spi-cpol:             Requires inverted clock polarity
> +	- reset-gpio:           GPIO attached to reset
> +	- irq-gpio:             GPIO attached to IRQ
> +Optional properties:
> +	- extclock-enable:      Include for the ca8210 to route its 16MHz clock
> +	                        to an output
> +	- extclock-freq:        Frequency in Hz of the external clock
> +	- extclock-gpio:        GPIO of the ca8210 to output the clock on
> +
> +Example:
> +	ca8210@0 {
> +		compatible = "cascoda,ca8210";
> +		reg = <0>;
> +		spi-max-frequency = <3000000>;
> +		spi-cpol;
> +		reset-gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
> +		irq-gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
> +		extclock-enable;
> +		extclock-freq = 16000000;
> +		extclock-gpio = 2;
> +	};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 24c6f65..6c5609f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -47,6 +47,7 @@ brcm	Broadcom Corporation
>  buffalo	Buffalo, Inc.
>  calxeda	Calxeda
>  capella	Capella Microsystems, Inc
> +cascoda	Cascoda, Ltd.
>  cavium	Cavium, Inc.
>  cdns	Cadence Design Systems Inc.
>  ceva	Ceva, Inc.
>

regards
Stefan Schmidt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
