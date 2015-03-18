From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] ARM: dts: mt8173: Add psci-0.2 cpuidle support
Date: Wed, 18 Mar 2015 12:16:05 +0000
Message-ID: <20150318121604.GC19624@leverpostej>
References: <1426658432-29333-1-git-send-email-howard.chen@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426658432-29333-1-git-send-email-howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Mar 18, 2015 at 06:00:32AM +0000, Howard Chen wrote:
> add device tree for psci-0.2 on mt8173 platform

Are all the other mandatory PSCI 0.2 components implemented and working?

e.g. is MIGRATE_INFO_TYPE present, do SYSTEM_{OFF,RESET} work?

If they're not present and working, we can't describe this as having
PSCI 0.2.

Also, what FW does this require the system to have?

Mark.

> add device tree for cupidle-arm64 on mt8173 platform
> 
> Signed-off-by: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 8554ec3..96dff1e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -48,6 +48,8 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a53";
>  			reg = <0x000>;
> +			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -55,6 +57,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0x001>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu2: cpu@100 {
> @@ -62,6 +65,7 @@
>  			compatible = "arm,cortex-a57";
>  			reg = <0x100>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
>  		};
>  
>  		cpu3: cpu@101 {
> @@ -69,15 +73,33 @@
>  			compatible = "arm,cortex-a57";
>  			reg = <0x101>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&CPU_SLEEP_0_0 &CLUSTER_SLEEP_0>;
>  		};
> +
> +		idle-states {
> +			entry-method = "arm,psci-0.2";
> +
> +			CPU_SLEEP_0_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <600>;
> +				exit-latency-us = <600>;
> +				min-residency-us = <1200>;
> +			};
> +
> +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x1010000>;
> +				entry-latency-us = <800>;
> +				exit-latency-us = <1000>;
> +				min-residency-us = <2000>;
> +				wakeup-latency-us = <1000>;
> +			};
>  	};
>  
>  	psci {
> -		compatible = "arm,psci";
> +		compatible = "arm,psci-0.2";
>  		method = "smc";
> -		cpu_suspend   = <0x84000001>;
> -		cpu_off	      = <0x84000002>;
> -		cpu_on	      = <0x84000003>;
>  	};
>  
>  	uart_clk: dummy26m {
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
