From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: db820c: Add qcom,apq8096 to compatible
 string
Date: Mon, 3 Sep 2018 12:27:58 -0700
Message-ID: <20180903192758.GG3456@tuxbook-pro>
References: <20180829125803.11227-1-niklas.cassel@linaro.org>
 <20180829125803.11227-2-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180829125803.11227-2-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 29 Aug 05:58 PDT 2018, Niklas Cassel wrote:

> Add qcom,apq8096 to compatible string.
> This compatible is defined in Documentation/devicetree/bindings/arm/qcom.txt
> and is needed for e.g. drivers/cpufreq/qcom-cpufreq-kryo.c to be probed
> correctly (and for drivers/cpufreq/cpufreq-dt-platdev.c to work properly).
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Andy, please pick this independently of 1/2

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index 230e9c8484ac..da23bdafbd33 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -17,5 +17,5 @@
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. DB820c";
> -	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc";
> +	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc", "qcom,apq8096";
>  };
> -- 
> 2.17.1
> 
