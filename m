From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v9 9/9] arm64: dts: qcom: msm8916: Add debug unit
Date: Thu, 11 May 2017 11:18:06 -0600
Message-ID: <20170511171806.GB22627@linaro.org>
References: <1494298202-6739-1-git-send-email-leo.yan@linaro.org>
 <1494298202-6739-10-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1494298202-6739-10-git-send-email-leo.yan@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 09, 2017 at 10:50:02AM +0800, Leo Yan wrote:
> Add debug unit on Qualcomm msm8916 based platforms, including the
> DragonBoard 410c board.
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 68a8e67..3af814b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1104,6 +1104,38 @@
>  			};
>  		};
>  
> +		debug@850000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x850000 0x1000>;
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +			cpu = <&CPU0>;
> +		};
> +
> +		debug@852000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x852000 0x1000>;
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +			cpu = <&CPU1>;
> +		};
> +
> +		debug@854000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x854000 0x1000>;
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +			cpu = <&CPU2>;
> +		};
> +
> +		debug@856000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x856000 0x1000>;
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +			cpu = <&CPU3>;
> +		};
> +
>  		etm@85c000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85c000 0x1000>;
> -- 
> 2.7.4
> 
