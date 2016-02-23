From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 17:39:45 +0000
Message-ID: <20160223173944.GA10088@leverpostej>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: andy.gross@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 07:21:11PM +0200, Georgi Djakov wrote:
> When the SMEM is probed it defers as it depends on the hardware lock, which
> is not available yet. But the SMD bus and RPM regulators and clocks depend
> on SMEM and they defer too. The problem with this is that the order of
> registering the devices is not optimal and also we may end with messed
> up serial console as the RPM clocks are not registered yet..

Re-ordering the DT is fragile at best, and not a real solution to this
class of problem.

Why can the drivers not defer probing in this case?

Mark.

> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi |   19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 7705207872a5..c497c7b1ae70 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -113,15 +113,6 @@
>  		};
>  	};
>  
> -	smem {
> -		compatible = "qcom,smem";
> -
> -		memory-region = <&smem_mem>;
> -		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> -
> -		hwlocks = <&tcsr_mutex 3>;
> -	};
> -
>  	soc: soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -512,6 +503,16 @@
>  		};
>  	};
>  
> +	smem {
> +		compatible = "qcom,smem";
> +
> +		memory-region = <&smem_mem>;
> +		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +
> +		hwlocks = <&tcsr_mutex 3>;
> +	};
> +
> +
>  	smd {
>  		compatible = "qcom,smd";
>  
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
