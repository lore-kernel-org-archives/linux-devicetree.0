From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: dt: dove: add Dove PMU DT entry to dove.dtsi
Date: Mon, 16 Mar 2015 19:27:30 +0100
Message-ID: <55072092.9040207@free-electrons.com>
References: <20150312183020.GU8656@n2100.arm.linux.org.uk> <E1YW7tB-0003mM-1L@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1YW7tB-0003mM-1L-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,

On 12/03/2015 19:31, Russell King wrote:
> Add the PMU description to the Dove DT file.  The PMU provides multiple
> features, including an interrupt, reset, power and isolation controller.
> 
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/dove.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index a5441d5482a6..43d4ebf414be 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -380,6 +380,15 @@
>  				status = "disabled";
>  			};
>  
> +			pmu: power-management@d0000 {
> +				compatible = "marvell,dove-pmu";
> +				reg = <0xd0000 0x8000>, <0xd8000 0x8000>;

Here you overlap some other nodes such as the thermal one (from 0xd001c to 0xd0028),
the clock gate one (from 0xd0038 to 0xd003c), the gpio one, the pinctrl one ...

Could you be more specific?

Thanks,

Gregory

> +				interrupts = <33>;
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +				#reset-cells = <1>;
> +			};
> +
>  			thermal: thermal-diode@d001c {
>  				compatible = "marvell,dove-thermal";
>  				reg = <0xd001c 0x0c>, <0xd005c 0x08>;
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
