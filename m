From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 11/14] arm64: dts: qcom: pm8998: add interrupt
 controller properties
Date: Mon, 14 Jan 2019 16:43:25 -0800
Message-ID: <20190115004325.GO9278@minitux>
References: <20190113154716.5145-1-masneyb@onstation.org>
 <20190113154716.5145-12-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113154716.5145-12-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 13 Jan 07:47 PST 2019, Brian Masney wrote:

> Add interrupt controller properties now that spmi-gpio is a proper
> hierarchical IRQ chip. The interrupts property is no longer needed so
> remove it.
> 
> This change was not tested on any hardware but the same change was
> tested on qcom-pm8941.dtsi using a LG Nexus 5 (hammerhead) phone with
> no issues.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> This is a new patch introduced in V4.
> 
>  arch/arm64/boot/dts/qcom/pm8998.dtsi | 28 ++--------------------------
>  1 file changed, 2 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index f1025a50c227..43cb5ea14089 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -94,32 +94,8 @@
>  			reg = <0xc000>;
>  			gpio-controller;
>  			#gpio-cells = <2>;
> -			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
> -				     <0 0xc1 0 IRQ_TYPE_NONE>,
> -				     <0 0xc2 0 IRQ_TYPE_NONE>,
> -				     <0 0xc3 0 IRQ_TYPE_NONE>,
> -				     <0 0xc4 0 IRQ_TYPE_NONE>,
> -				     <0 0xc5 0 IRQ_TYPE_NONE>,
> -				     <0 0xc6 0 IRQ_TYPE_NONE>,
> -				     <0 0xc7 0 IRQ_TYPE_NONE>,
> -				     <0 0xc8 0 IRQ_TYPE_NONE>,
> -				     <0 0xc9 0 IRQ_TYPE_NONE>,
> -				     <0 0xca 0 IRQ_TYPE_NONE>,
> -				     <0 0xcb 0 IRQ_TYPE_NONE>,
> -				     <0 0xcc 0 IRQ_TYPE_NONE>,
> -				     <0 0xcd 0 IRQ_TYPE_NONE>,
> -				     <0 0xce 0 IRQ_TYPE_NONE>,
> -				     <0 0xcf 0 IRQ_TYPE_NONE>,
> -				     <0 0xd0 0 IRQ_TYPE_NONE>,
> -				     <0 0xd1 0 IRQ_TYPE_NONE>,
> -				     <0 0xd2 0 IRQ_TYPE_NONE>,
> -				     <0 0xd3 0 IRQ_TYPE_NONE>,
> -				     <0 0xd4 0 IRQ_TYPE_NONE>,
> -				     <0 0xd5 0 IRQ_TYPE_NONE>,
> -				     <0 0xd6 0 IRQ_TYPE_NONE>,
> -				     <0 0xd7 0 IRQ_TYPE_NONE>,
> -				     <0 0xd8 0 IRQ_TYPE_NONE>,
> -				     <0 0xd9 0 IRQ_TYPE_NONE>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  		};
>  
>  	};
> -- 
> 2.17.2
> 
