From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 9/9] arm64: dts: msm8996: Add proper capacity scaling
 for the cpus
Date: Tue, 21 May 2019 12:14:29 +0200
Message-ID: <6636af52-4f29-2869-7f9f-6d6277af6712@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <5224535a7ef5b257e3baa698991bf6deeefccc36.1558430617.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5224535a7ef5b257e3baa698991bf6deeefccc36.1558430617.git.amit.kucheria@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, niklas.cassel@linaro.org, marc.w.gonzalez@free.fr, sibis@codeaurora.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 21/05/2019 11:35, Amit Kucheria wrote:
> msm8996 features 4 cpus - 2 in each cluster. However, all cpus implement
> the same microarchitecture and the two clusters only differ in the
> maximum frequency attainable by the CPUs.
> 
> Add capacity-dmips-mhz property to allow the topology code to determine
> the actual capacity by taking into account the highest frequency for
> each CPU.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 4f2fb7885f39..e0e8f30ce11a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -96,6 +96,7 @@
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {
>  			      compatible = "cache";
> @@ -109,6 +110,7 @@
>  			reg = <0x0 0x1>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_0>;
>  		};
>  
> @@ -118,6 +120,7 @@
>  			reg = <0x0 0x100>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_1>;
>  			L2_1: l2-cache {
>  			      compatible = "cache";
> @@ -131,6 +134,7 @@
>  			reg = <0x0 0x101>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SLEEP_0>;
> +			capacity-dmips-mhz = <1024>;
>  			next-level-cache = <&L2_1>;
>  		};
>  
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
