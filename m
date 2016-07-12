From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] device-tree: nexus7: Set phy mode to otg instead of host
Date: Tue, 12 Jul 2016 11:36:28 -0700
Message-ID: <20160712183628.GF23833@tuxbot>
References: <1467437605-11691-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467437605-11691-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 01 Jul 22:33 PDT 2016, John Stultz wrote:

> In order to have the usb phy work in gadget mode, override
> the default host mode with otg mode.
> 
> This allows gadget mode to work w/o any hacks to the dtsi file.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
> index 7b05f07..94e9cbb 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
> @@ -253,6 +253,7 @@
>  			vddcx-supply	= <&pm8921_s3>;
>  			v3p3-supply	= <&pm8921_l3>;
>  			v1p8-supply	= <&pm8921_l4>;
> +			dr_mode		= "otg";

Wouldn't this be the standard case for the first/primary USB on most
8064s? Looks like both the ifc6410 and  sd600eval has OTG support on the
micro-usb.

Andy, how about we just change the dtsi instead?

Regards,
Bjorn
