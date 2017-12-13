From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: hisilicon: Add hi3660 cpu capacity-dmips-mhz
 information
Date: Wed, 13 Dec 2017 22:53:11 +0800
Message-ID: <20171213145311.GA30463@leoy-ThinkPad-T440>
References: <1513174866-6678-1-git-send-email-valentin.schneider@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513174866-6678-1-git-send-email-valentin.schneider-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Schneider <valentin.schneider-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Valentin,

On Wed, Dec 13, 2017 at 02:21:06PM +0000, Valentin Schneider wrote:
> The following dt entries are added:
>  cpus [0-3] (Cortex A53):
>    - capacity-dmips-mhz = <592>;
> 
>  cpus [4-7] (Cortex A73):
>    - capacity-dmips-mhz = <1024>;
> 
> Those values were obtained by running dhrystone 2.1 on a
> HiKey960 with the following procedure:
> - Offline all CPUs but CPU0 (A53)
> - Set CPU0 frequency to maximum
> - Run Dhrystone 2.1 for 20 seconds
> 
> - Offline all CPUs but CPU4 (A73)
> - set CPU4 frequency to maximum
> - Run Dhrystone 2.1 for 20 seconds
> 
> The results are as follows:
> A53: 129633887 loops
> A73: 287034147 loops

Seems to me the capacity-dmips-mhz should be:

CA53: 129633887 / 20 / 1844 = 3515
CA73: 287034147 / 20 / 2362 = 6076

After normalized to range [0..1024], we could get:

CA53:  592
CA73: 1024

Reviewed-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> By scaling those values so that the A73s use 1024, we end up with 462
> for the A53s. However, they have different maximum frequencies:
> 1.844GHz for A53s and 2.362GHz for A73s. Thus, we can scale the A53
> value to truly represent dmips per MHz, and we end up with 592.
> 
> The impact of this change can be verified on HiKey960:
> 
> $ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
> 1844000
> 1844000
> 1844000
> 1844000
> 2362000
> 2362000
> 2362000
> 2362000
> 
> $ cat /sys/devices/system/cpu/cpu*/cpu_capacity
> 462
> 462
> 462
> 462
> 1024
> 1024
> 1024
> 1024
> 
> Signed-off-by: Valentin Schneider <valentin.schneider-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index ab0b95b..04a8d28 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -61,6 +61,7 @@
>  			enable-method = "psci";
>  			next-level-cache = <&A53_L2>;
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
> +			capacity-dmips-mhz = <592>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -70,6 +71,7 @@
>  			enable-method = "psci";
>  			next-level-cache = <&A53_L2>;
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
> +			capacity-dmips-mhz = <592>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -79,6 +81,7 @@
>  			enable-method = "psci";
>  			next-level-cache = <&A53_L2>;
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
> +			capacity-dmips-mhz = <592>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -88,6 +91,7 @@
>  			enable-method = "psci";
>  			next-level-cache = <&A53_L2>;
>  			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
> +			capacity-dmips-mhz = <592>;
>  		};
>  
>  		cpu4: cpu@100 {
> @@ -101,6 +105,7 @@
>  					&CPU_SLEEP
>  					&CLUSTER_SLEEP_1
>  			>;
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		cpu5: cpu@101 {
> @@ -114,6 +119,7 @@
>  					&CPU_SLEEP
>  					&CLUSTER_SLEEP_1
>  			>;
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		cpu6: cpu@102 {
> @@ -127,6 +133,7 @@
>  					&CPU_SLEEP
>  					&CLUSTER_SLEEP_1
>  			>;
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		cpu7: cpu@103 {
> @@ -140,6 +147,7 @@
>  					&CPU_SLEEP
>  					&CLUSTER_SLEEP_1
>  			>;
> +			capacity-dmips-mhz = <1024>;
>  		};
>  
>  		idle-states {
> --
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
