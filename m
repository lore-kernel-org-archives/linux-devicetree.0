From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 04/10] arm64: dts: hi3660: Add missing cooling device
 properties for CPUs
Date: Thu, 29 Nov 2018 15:44:39 +0000
Message-ID: <5C000967.7070103@hisilicon.com>
References: <cover.1542362530.git.viresh.kumar@linaro.org>
 <042e5e647a7b54f4322024f1b3e286b6b6d69175.1542362530.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <042e5e647a7b54f4322024f1b3e286b6b6d69175.1542362530.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org
Cc: devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On 2018/11/16 10:04, Viresh Kumar wrote:
> The cooling device properties, like "#cooling-cells" and
> "dynamic-power-coefficient", should either be present for all the CPUs
> of a cluster or none. If these are present only for a subset of CPUs of
> a cluster then things will start falling apart as soon as the CPUs are
> brought online in a different order. For example, this will happen
> because the operating system looks for such properties in the CPU node
> it is trying to bring up, so that it can register a cooling device.
> 
> Add such missing properties.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index f432b0a88c65..d943a96eedee 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -79,6 +79,7 @@
>  			capacity-dmips-mhz = <592>;
>  			clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER0>;
>  			operating-points-v2 = <&cluster0_opp>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu2: cpu@2 {
> @@ -91,6 +92,7 @@
>  			capacity-dmips-mhz = <592>;
>  			clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER0>;
>  			operating-points-v2 = <&cluster0_opp>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu3: cpu@3 {
> @@ -103,6 +105,7 @@
>  			capacity-dmips-mhz = <592>;
>  			clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER0>;
>  			operating-points-v2 = <&cluster0_opp>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu4: cpu@100 {
> @@ -129,6 +132,7 @@
>  			capacity-dmips-mhz = <1024>;
>  			clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER1>;
>  			operating-points-v2 = <&cluster1_opp>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu6: cpu@102 {
> @@ -141,6 +145,7 @@
>  			capacity-dmips-mhz = <1024>;
>  			clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER1>;
>  			operating-points-v2 = <&cluster1_opp>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		cpu7: cpu@103 {
> @@ -153,6 +158,7 @@
>  			capacity-dmips-mhz = <1024>;
>  			clocks = <&stub_clock HI3660_CLK_STUB_CLUSTER1>;
>  			operating-points-v2 = <&cluster1_opp>;
> +			#cooling-cells = <2>;
>  		};
>  
>  		idle-states {
> 
