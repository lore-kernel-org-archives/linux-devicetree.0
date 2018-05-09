From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add command DB node
Date: Wed, 9 May 2018 14:41:14 -0700
Message-ID: <20180509214114.GH14924@minitux>
References: <20180509213439.165623-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180509213439.165623-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: andy.gross@linaro.org, rnayak@codeaurora.org, evgreen@chromium.org, ilina@codeaurora.org, swboyd@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed 09 May 14:34 PDT 2018, Douglas Anderson wrote:

> Add command DB node based on the bindings example.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 486ace9a9e8b..7b5f2b3982a3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -21,6 +21,18 @@
>  		reg = <0 0x80000000 0 0>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		reserved-memory@85fe0000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x85fe0000 0x0 0x20000>;
> +			no-map;
> +		};
> +	};
> +
>  	cpus {
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> -- 
> 2.17.0.441.gb46fe60e1d-goog
> 
