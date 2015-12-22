From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v1 5/6] ARM: dts: rockchip: add reboot-mode node
Date: Tue, 22 Dec 2015 12:23:23 +0100
Message-ID: <3977796.F76XlXnDRQ@diego>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com> <1450775812-24244-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450775812-24244-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Dienstag, 22. Dezember 2015, 17:16:52 schrieb Andy Yan:
> Add reboot mode driver DT node for rk3xxx,rk3288 platform

in general, I like that concept a lot :-) . Below some small issues.


> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> ---
> 
> Changes in v1:
> - correct the maskrom magic number
> - use macro defined in rockchip_boot-mode.h for reboot-mode DT node
> 
>  arch/arm/boot/dts/rk3288.dtsi | 26 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/rk3xxx.dtsi | 26 ++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 04ea209..c6ea207 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -45,6 +45,7 @@
>  #include <dt-bindings/clock/rk3288-cru.h>
>  #include <dt-bindings/thermal/thermal.h>
>  #include <dt-bindings/power/rk3288-power.h>
> +#include <dt-bindings/soc/rockchip_boot-mode.h>
>  #include "skeleton.dtsi"
> 
>  / {
> @@ -170,6 +171,31 @@
>  		};
>  	};
> 
> +	reboot_mode {

nodes are commonly written with a dash "-" instead of an underscore "_".


> +		compatible = "rockchip,reboot-mode";
> +		rockchip,regmap = <&pmu>;

I do believe this should be a sub-node of the pmu, similar to the power-
domains. Due to the "simple-mfd" compatible of the pmu, it will get probed 
automatically and the driver can than get the regmap via

	parent = dev->parent;
	regmap = syscon_node_to_regmap(parent->of_node);

as the power-domains do and therefore also doesn't need the rockchip,regmap 
property.


> +		offset = <0x94>;
> +		loader {
> +			linux,mode = "loader";
> +			linux,magic = <BOOT_LOADER>;

linux,mode seems correct, but the magic value is actually not linux-specific 
but instead firmware-specific, so I'm not sure about that linux-prefix there

But I guess that would be for the dt-people :-)


> +		};
> +
> +		maskrom {
> +			linux,mode = "maskrom";
> +			linux,magic = <BOOT_MASKROM>;
> +		};

Just for my understanding, while I expect the bootloader to interpret the 
other values, does the maskrom read and handle this one?


> +
> +		recovery {
> +			linux,mode = "recovery";
> +			linux,magic = <BOOT_RECOVERY>;
> +		};
> +
> +		fastboot {
> +			linux,mode = "fastboot";
> +			linux,magic = <BOOT_FASTBOOT>;
> +		};
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <1>;
>  		#size-cells = <1>;

I do believe rk3288-veyron.dtsi would need some sort of special handling.
I don't think coreboot interprets most of those handles, but I guess only the 
maskrom one would be handled by the maskrom?


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
