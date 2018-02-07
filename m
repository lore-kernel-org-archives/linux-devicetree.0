From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 06/16] arm64: dts: mt7622: add cpufreq related device
 nodes
Date: Wed, 7 Feb 2018 09:03:31 +0530
Message-ID: <20180207033331.GK28462@vireshk-i7>
References: <cover.1517910489.git.sean.wang@mediatek.com>
 <fc5bdf53b92bd7a96e94b714d8d13deebca95c28.1517910489.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fc5bdf53b92bd7a96e94b714d8d13deebca95c28.1517910489.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06-02-18, 17:52, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> @@ -26,6 +70,10 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53", "arm,armv8";
>  			reg = <0x0 0x0>;
> +			clocks = <&infracfg CLK_INFRA_MUX1_SEL>,
> +				 <&apmixedsys CLK_APMIXED_MAIN_CORE_EN>;
> +			clock-names = "cpu", "intermediate";
> +			operating-points-v2 = <&cpu_opp_table>;
>  			enable-method = "psci";
>  			clock-frequency = <1300000000>;
>  		};
> @@ -34,6 +82,7 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53", "arm,armv8";
>  			reg = <0x0 0x1>;
> +			operating-points-v2 = <&cpu_opp_table>;
>  			enable-method = "psci";
>  			clock-frequency = <1300000000>;
>  		};

Sorry for not picking this earlier, but you should probably add the same clock
related properties for both cpu nodes here. Things will break if CPU1 is used by
the cpufreq core to bring the cpufreq policy online.

This can happen if cpufreq driver is a module, CPU0 is hotplugged out and then
the cpufreq driver is inserted.

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
