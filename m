From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8916: normalize I2C bindings
Date: Thu, 9 Nov 2017 08:56:05 -0800
Message-ID: <20171109165605.GB28761@minitux>
References: <20171101175335.22123-1-damien.riegel@savoirfairelinux.com>
 <20171101175335.22123-4-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171101175335.22123-4-damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 01 Nov 10:53 PDT 2017, Damien Riegel wrote:

> The QUP core can be used either for I2C or SPI, so the same IP is mapped
> by a driver or the other. SPI bindings use a leading 0 for the start
> address and a size of 0x600, I2C bindings don't have the leading 0 and
> have a size 0x1000.
> 
> To make them more similar, add the leading 0 to I2C bindings and changes
> the size to 0x600, as the driver only accesses registers up to address
> 0x408. Also align the second entry of the clocks array.
> 

The correct size for these blocks are 0x500, please update this. Other
than that this looks good.

Regards,
Bjorn

> Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index e16ba8334518..de25bd6070f5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -457,10 +457,10 @@
>  
>  		blsp_i2c2: i2c@78b6000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
> -			reg = <0x78b6000 0x1000>;
> +			reg = <0x078b6000 0x600>;
>  			interrupts = <GIC_SPI 96 0>;
>  			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> -				<&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
> +				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
>  			clock-names = "iface", "core";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c2_default>;
> @@ -472,10 +472,10 @@
>  
>  		blsp_i2c4: i2c@78b8000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
> -			reg = <0x78b8000 0x1000>;
> +			reg = <0x078b8000 0x600>;
>  			interrupts = <GIC_SPI 98 0>;
>  			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> -				<&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
> +				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
>  			clock-names = "iface", "core";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c4_default>;
> @@ -487,10 +487,10 @@
>  
>  		blsp_i2c6: i2c@78ba000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
> -			reg = <0x78ba000 0x1000>;
> +			reg = <0x078ba000 0x600>;
>  			interrupts = <GIC_SPI 100 0>;
>  			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
> -				<&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
> +				 <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>;
>  			clock-names = "iface", "core";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c6_default>;
> -- 
> 2.15.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
