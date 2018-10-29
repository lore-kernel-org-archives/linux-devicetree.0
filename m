From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add SCM DT node
Date: Sun, 28 Oct 2018 18:35:56 -0700
Message-ID: <20181029013556.GB1855@tuxbook-pro>
References: <20181026122542.4714-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181026122542.4714-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, dianders@chromium.org, evgreen@chromium.org, benchan@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri 26 Oct 05:25 PDT 2018, Sibi Sankar wrote:

> Add SCM DT node to enable SCM functionality on SDM845.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b72bdb0a31a5..fad22acfda4d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -221,6 +221,12 @@
>  		};
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-sdm845", "qcom,scm";
> +		};
> +	};
> +
>  	tcsr_mutex: hwlock {
>  		compatible = "qcom,tcsr-mutex";
>  		syscon = <&tcsr_mutex_regs 0 0x1000>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
