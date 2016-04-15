From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: DTS: da850: add node for spi0
Date: Fri, 15 Apr 2016 15:54:54 +0530
Message-ID: <5710C176.3040304@ti.com>
References: <1460586628-25152-1-git-send-email-david@lechnology.com>
 <1460586628-25152-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460586628-25152-2-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 April 2016 04:00 AM, David Lechner wrote:
> Adds device definition for soc spi0 and also a aux data that is needed
> for clock matching.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850.dtsi     | 10 ++++++++++
>  arch/arm/mach-davinci/da8xx-dt.c |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index bbe7dd6..92b5f3c 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -295,6 +295,16 @@
>  			reg = <0x308000 0x80>;
>  			status = "disabled";
>  		};
> +		spi0: spi@41000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "ti,da830-spi";
> +			reg = <0x41000 0x1000>;
> +			num-cs = <6>;

This made me notice that num-cs is populated wrongly for spi1. It
actually has 8 chip selects. This is fine though.

Also, it will be nice to add pinctrl entries for spi0 like it is done
for spi1. You will need those anyway for using the interface.

> +			ti,davinci-spi-intr-line = <1>;
> +			interrupts = <20>;
> +			status = "disabled";
> +		};
>  		spi1: spi@30e000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
> index 64f3887..754f478 100644
> --- a/arch/arm/mach-davinci/da8xx-dt.c
> +++ b/arch/arm/mach-davinci/da8xx-dt.c
> @@ -28,6 +28,7 @@ static struct of_dev_auxdata da850_auxdata_lookup[] __initdata = {
>  	OF_DEV_AUXDATA("ti,da850-ecap", 0x01f06000, "ecap", NULL),
>  	OF_DEV_AUXDATA("ti,da850-ecap", 0x01f07000, "ecap", NULL),
>  	OF_DEV_AUXDATA("ti,da850-ecap", 0x01f08000, "ecap", NULL),
> +	OF_DEV_AUXDATA("ti,da830-spi", 0x01c41000, "spi_davinci.0", NULL),
>  	OF_DEV_AUXDATA("ti,da830-spi", 0x01f0e000, "spi_davinci.1", NULL),
>  	OF_DEV_AUXDATA("ns16550a", 0x01c42000, "serial8250.0", NULL),
>  	OF_DEV_AUXDATA("ns16550a", 0x01d0c000, "serial8250.1", NULL),

I prefer DT updates are patches of their own and not combined with code
updates like this. Can you please split this up?

Regards,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
