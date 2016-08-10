From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] device-tree: aqp8064.dtsi: Remove usb phy dr_mode =
 "host"
Date: Tue, 9 Aug 2016 21:09:37 -0700
Message-ID: <20160810040937.GF26240@tuxbot>
References: <1470695643-32169-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470695643-32169-1-git-send-email-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 08 Aug 15:34 PDT 2016, John Stultz wrote:

Changes in this file is commonly prefixed "ARM: dts: apq8064:", please
follow that. Perhaps:

ARM: dts: apq8064: Drop dr_mode property from usb phy

> Most 8064 devices have micro-usb ports for phy1, so setting
> the dr_mode to host here seems incorrect.
> 
> Leaving it unspecified should default to otg, and then
> any boards that wish to specify something else, can
> override it in their dts file.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 9dc83b0..7e43416 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -750,7 +750,6 @@
>  			reg		= <0x12500000 0x400>;
>  			interrupts	= <GIC_SPI 100 IRQ_TYPE_NONE>;
>  			status		= "disabled";
> -			dr_mode		= "host";
>  
>  			clocks		= <&gcc USB_HS1_XCVR_CLK>,
>  					  <&gcc USB_HS1_H_CLK>;
> -- 
> 1.9.1
> 
