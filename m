From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv8 2/5] arm64: dts: qcom: msm8998: Add Coresight support
Date: Thu, 18 Jul 2019 09:28:48 +0100
Message-ID: <3b192063-f31f-b861-d913-61d737cecc57@arm.com>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <e510df23f741205fac9030f2c95d06d607549caa.1562940244.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e510df23f741205fac9030f2c95d06d607549caa.1562940244.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, mike.leach@linaro.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, david.brown@linaro.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, vivek.gautam@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, marc.w.gonzalez@free.fr
List-Id: devicetree@vger.kernel.org

Hi Sai,

On 12/07/2019 15:16, Sai Prakash Ranjan wrote:
> Enable coresight support by adding device nodes for the
> available source, sinks and channel blocks on MSM8998.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 435 ++++++++++++++++++++++++++
>   1 file changed, 435 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index c13ed7aeb1e0..ad9cb5e8675d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -822,6 +822,441 @@


		etr@6048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x06048000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +			arm,scatter-gather;

Please could you confirm that you have tested the scatter-gather mode with ETR ? 
Either via perf/sysfs. Please could you share your results ? Unless verified
this is going to be fatal for the system.

Similarly for other platforms.

Kind regards
Suzuki
