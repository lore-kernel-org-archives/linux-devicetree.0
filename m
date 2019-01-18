From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv2 2/4] arm64: dts: qcom: msm8996: Add Coresight support
Date: Fri, 18 Jan 2019 10:57:09 +0000
Message-ID: <1311e78a-21f6-6470-7861-39b3499974ce@arm.com>
References: <cover.1547798966.git.saiprakash.ranjan@codeaurora.org>
 <552e408950525b1bac39d05b8b4f2ae1975397e0.1547798966.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <552e408950525b1bac39d05b8b4f2ae1975397e0.1547798966.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, robh+dt@kernel.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sai,

On 18/01/2019 08:25, Sai Prakash Ranjan wrote:
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
> 
> Enable coresight support by adding device nodes for the
> available source, sinks and channel blocks on msm8996.
> 
> This also adds coresight cpu debug nodes.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 447 ++++++++++++++++++++++++++
>   1 file changed, 447 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 99b7495455a6..96a16d5a258c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi

> +
> +		etr@3028000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x3028000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";

If you want to use the scatter-gather mode, you must add "arm,scatter-gather"
property to the node here.

Have you tested the scatter-gather mode on the chip ? Does that work at all ?
Note: You could try this by setting a buffer_size > 1M for the ETR and use
it as a sink from the sysfs mode.

Cheers
Suzuki
