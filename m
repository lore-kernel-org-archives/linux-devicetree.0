From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: socfpga: DTS updates for stmmac driver
Date: Fri, 10 Jan 2014 21:00:09 +0100
Message-ID: <20140110200009.GD371@pengutronix.de>
References: <1389372599-14180-1-git-send-email-vbridgers2013@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389372599-14180-1-git-send-email-vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On Fri, Jan 10, 2014 at 10:49:59AM -0600, Vince Bridgers wrote:
> This change adds a parameter for the Synopsys 10/100/1000
> stmmac Ethernet driver to configure the maximum MTU supported
> by the EMAC instance. Synopsys allows the FIFO sizes to
> be configured when the cores are built for a particular
> device, but do not provide a way for the driver to read
> information from the device about the maximum MTU size
> supported as limited by the device's FIFO size.
> 
> This patch has been tested with changes being submitted
> seperately for the Synopsys 10/100/1000 stmmac driver.
> 
> Signed-off-by: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/stmmac.txt |    5 +++++
>  arch/arm/boot/dts/socfpga_cyclone5.dtsi          |   19 +++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
> index eba0e5e..7db314e 100644
> --- a/Documentation/devicetree/bindings/net/stmmac.txt
> +++ b/Documentation/devicetree/bindings/net/stmmac.txt
> @@ -30,6 +30,10 @@ Required properties:
>  
>  Optional properties:
>  - mac-address: 6 bytes, mac address
> +- snps,max-mtu:		Maximum MTU permitted. This parameter is useful since
> +			different implementations of the Synopsys MAC may have
> +			different FIFO sizes depending on the selections
> +			made in Synopsys Core Consultant.
>  
>  Examples:
>  
> @@ -40,5 +44,6 @@ Examples:
>  		interrupts = <24 23>;
>  		interrupt-names = "macirq", "eth_wake_irq";
>  		mac-address = [000000000000]; /* Filled in by U-Boot */
> +		snps,max-mtu = <3800>;
>  		phy-mode = "gmii";
>  	};
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dtsi b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
> index a8716f6..b6b39dd 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5.dtsi
> +++ b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
> @@ -63,3 +63,22 @@
>  		};
>  	};
>  };
> +
> +&gmac1 {
> +	phy-mode = "rgmii";
> +	snps,phy-addr = <0xffffffff>; /* probe for phy addr */
> +
> +	rxd0-skew-ps = <0>;
> +	rxd0-skew-ps = <0>;
> +	rxd1-skew-ps = <0>;
> +	rxd2-skew-ps = <0>;
> +	rxd3-skew-ps = <0>;
> +	txen-skew-ps = <0>;
> +	txc-skew-ps = <2600>;
> +	rxdv-skew-ps = <0>;
> +	rxc-skew-ps = <2000>;

This all seems to be unrelated to the patch description and there isn't even
any binding documentatation (or is that in another patch ?).
Additionally these don't seem to be properties that apply to all cyclone5 based
boards, so they don't belong here.

> +	snps,max-mtu = <3800>;
> +	altr,sysmgr-phy-mask = <0xC>;
> +	status = "okay";
                  ^^^^
At least this is only valid for boards that use gmac1.
Put this in a boardspecific DT.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
