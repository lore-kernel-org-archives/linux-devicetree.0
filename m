From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add reserve-memory nodes
Date: Sun, 28 Oct 2018 18:39:08 -0700
Message-ID: <20181029013908.GD1855@tuxbook-pro>
References: <20181026122745.5094-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181026122745.5094-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, dianders@chromium.org, evgreen@chromium.org, benchan@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Fri 26 Oct 05:27 PDT 2018, Sibi Sankar wrote:

> Add reserve-memory nodes for mpss and mba required for
> remoteproc mss pil.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d3fe012ad84e..f74892e447f9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -88,6 +88,16 @@
>  			reg = <0 0x86200000 0 0x2d00000>;
>  			no-map;
>  		};
> +
> +		mpss_region: reserved-memory@8e000000 {
> +			no-map;
> +			reg = <0 0x8e000000 0 0x7800000>;
> +		};
> +
> +		mba_region: reserved-memory@96500000 {
> +			no-map;
> +			reg = <0 0x96500000 0 0x200000>;
> +		};
>  	};
>  
>  	cpus {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
