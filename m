From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ARM: dts: msm8974: castor: Correct typo in touchscreen
 compatible string
Date: Mon, 12 Mar 2018 09:45:32 -0700
Message-ID: <20180312164532.GA1016@minitux>
References: <20180312160734.5606-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180312160734.5606-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 12 Mar 09:07 PDT 2018, Craig Tatlor wrote:

> This was mistakenly pulled from the downstream tree.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

Thanks Craig,

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
> index e87f2c99060d..d85311a0422c 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
> @@ -491,7 +491,7 @@
>  		pinctrl-0 = <&i2c8_pins>;
>  
>  		synaptics@2c {
> -			compatible = "syna,rmi-i2c";
> +			compatible = "syna,rmi4-i2c";
>  			reg = <0x2c>;
>  
>  			interrupt-parent = <&msmgpio>;
> -- 
> 2.16.1
> 
