From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: add #cooling-cells to CPU nodes
Date: Thu, 11 Jan 2018 08:38:30 +0800
Message-ID: <1515631110.19513.5.camel@mhfsdcap03>
References: <20180110210706.2331225-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110210706.2331225-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew-sh Cheng <andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-01-10 at 22:06 +0100, Arnd Bergmann wrote:
> dtc complains about the lack of #coolin-cells properties for the
> CPU nodes that are referred to as "cooling-device":
> 
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (cooling_device_property): Missing property '#cooling-cells' in node /cpus/cpu@0 or bad phandle (referred from /thermal-zones/cpu_thermal/cooling-maps/map@0:cooling-device[0])
> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (cooling_device_property): Missing property '#cooling-cells' in node /cpus/cpu@100 or bad phandle (referred from /thermal-zones/cpu_thermal/cooling-maps/map@1:cooling-device[0])
> 
> Apparently this property must be '<2>' to match the binding.
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> If this looks ok, I'd apply it directly to the fixes branch
> for 4.15, as the warning is one that was introduced in this
> release.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index b477ad790071..9fbe4705ee88 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -155,6 +155,7 @@
>  			reg = <0x000>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			#cooling-cells = <2>;
>  			clocks = <&infracfg CLK_INFRA_CA53SEL>,
>  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
>  			clock-names = "cpu", "intermediate";
> @@ -179,6 +180,7 @@
>  			reg = <0x100>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			#cooling-cells = <2>;
>  			clocks = <&infracfg CLK_INFRA_CA57SEL>,
>  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
>  			clock-names = "cpu", "intermediate";

Tested-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
