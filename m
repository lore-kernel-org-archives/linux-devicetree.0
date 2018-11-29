From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 05/10] ARM64: dts: hisilicon: Add all CPUs in cooling maps
Date: Thu, 29 Nov 2018 15:45:07 +0000
Message-ID: <5C000983.3030609@hisilicon.com>
References: <cover.1542362530.git.viresh.kumar@linaro.org>
 <89bb8c62404aa875d597da89c18852ce81fb9f26.1542362530.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <89bb8c62404aa875d597da89c18852ce81fb9f26.1542362530.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org
Cc: devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On 2018/11/16 10:04, Viresh Kumar wrote:
> Each CPU can (and does) participate in cooling down the system but the
> DT only captures a handful of them, normally CPU0, in the cooling maps.
> Things work by chance currently as under normal circumstances its the
> first CPU of each cluster which is used by the operating systems to
> probe the cooling devices. But as soon as this CPU ordering changes and
> any other CPU is used to bring up the cooling device, we will start
> seeing failures.
> 
> Also the DT is rather incomplete when we list only one CPU in the
> cooling maps, as the hardware doesn't have any such limitations.
> 
> Update cooling maps to include all devices affected by individual trip
> points.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 10 ++++++++--
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi |  9 ++++++++-
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index d943a96eedee..20ae40df61d5 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -1118,12 +1118,18 @@
>  					map0 {
>  						trip = <&target>;
>  						contribution = <1024>;
> -						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  					};
>  					map1 {
>  						trip = <&target>;
>  						contribution = <512>;
> -						cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +						cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  					};
>  				};
>  			};
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index 97d5bf2c6ec5..aec9e371c2a7 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -893,7 +893,14 @@
>  				cooling-maps {
>  					map0 {
>  						trip = <&target>;
> -						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +						cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  					};
>  				};
>  			};
> 
