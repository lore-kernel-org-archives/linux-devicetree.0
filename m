From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: Move smem below hwlock
Date: Tue, 23 Feb 2016 17:29:47 +0000
Message-ID: <56CC970B.4080602@linaro.org>
References: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456248071-30547-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 23/02/16 17:21, Georgi Djakov wrote:
> When the SMEM is probed it defers as it depends on the hardware lock, which
> is not available yet. But the SMD bus and RPM regulators and clocks depend
> on SMEM and they defer too. The problem with this is that the order of
> registering the devices is not optimal and also we may end with messed
> up serial console as the RPM clocks are not registered yet..
I noticed the same issue but was wondering why would we end up with 
messed up serial console?

Could you add more details on why serial console is messed up?

I thought, serial driver has nothing to do with the rpm clocks directly!

--srini
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8916.dtsi |   19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 7705207872a5..c497c7b1ae70 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -113,15 +113,6 @@
>   		};
>   	};
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
>   	soc: soc {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> @@ -512,6 +503,16 @@
>   		};
>   	};
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
>   	smd {
>   		compatible = "qcom,smd";
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
