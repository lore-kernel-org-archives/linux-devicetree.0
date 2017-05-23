From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: marvell: mcbin: add sdhci
Date: Tue, 23 May 2017 16:20:55 +0200
Message-ID: <874lwby7qw.fsf@free-electrons.com>
References: <E1dAcn4-0004z2-Fl@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1dAcn4-0004z2-Fl-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org> (Russell King's
        message of "Tue, 16 May 2017 14:45:30 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
 
 On mar., mai 16 2017, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> Add sdhci support for MACCHIATOBin boards.  This uses the AP806 SDHCI
> for eMMC and CP110 master for the SD card slot.


Applied on mvebu/dt64

Thanks,

Gregory

>
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> ---
>
> This version labels up the uSD connector, adds the vqmmc regulator for
> the uSD (the regulator itself already present in the DT), and supports
> the card detect signal.
>
> For eMMC, this version adds the vqmmc regulator, which again is already
> present in the DT, marks it as not supporting SD or SDIO, and also
> includes "slow mode" since testing with previous versions of the driver
> have shown that selecting faster speeds results in errors.
>
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts |   23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> index cc167e05941a..60111ed3234a 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
> @@ -95,6 +95,21 @@
>  	status = "okay";
>  };
>  
> +&ap_sdhci0 {
> +	bus-width = <8>;
> +	/*
> +	 * Not stable in HS modes - phy needs "more calibration", so add
> +	 * the "slow-mode" and disable SDR104, SDR50 and DDR50 modes.
> +	 */
> +	marvell,xenon-phy-slow-mode;
> +	no-1-8-v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +	vqmmc-supply = <&v_vddo_h>;
> +};
> +
>  &cpm_i2c0 {
>  	clock-frequency = <100000>;
>  	status = "okay";
> @@ -105,6 +120,14 @@
>  	status = "okay";
>  };
>  
> +&cpm_sdhci0 {
> +	/* U6 */
> +	broken-cd;
> +	bus-width = <4>;
> +	status = "okay";
> +	vqmmc-supply = <&v_3_3>;
> +};
> +
>  &cpm_usb3_0 {
>  	/* J38? - USB2.0 only */
>  	status = "okay";
> -- 
> 2.7.4
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
