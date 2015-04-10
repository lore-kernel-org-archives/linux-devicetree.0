From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 09/12] ARM: dts: apq8064: Add USB OTG support for CM
 QS-600
Date: Fri, 10 Apr 2015 10:26:39 -0700
Message-ID: <552807CF.4070600@codeaurora.org>
References: <1428669187-10775-1-git-send-email-srinivas.kandagatla@linaro.org> <1428669293-11165-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1428669293-11165-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, galak@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bjorn.andersson@sonymobile.com, Nicolas Dechesne <nicolas.dechesne@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 04/10/15 05:34, Srinivas Kandagatla wrote:
> From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> This patch adds USB OTG support on USB1 for Compulab QS-600 Board.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> [Srinivas Kandagatla: fixed up regulators and status properties]
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index fc69931..d353694 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -101,6 +101,14 @@
>  			};
>  		};
>  
> +		/* OTG */
> +		usb1_phy:phy@12500000 {

Space after that ':' please.

> +			status		= "okay";
> +			vddcx-supply	= <&pm8921_s3>;
> +			v3p3-supply	= <&pm8921_l3>;
> +			v1p8-supply	= <&pm8921_l4>;
> +		};
> +
>  		usb3_phy:phy@12520000 {
>  			status		= "okay";
>  			vddcx-supply	= <&pm8921_s3>;
> @@ -115,6 +123,15 @@
>  			v1p8-supply	= <&pm8921_l23>;
>  		};
>  
> +		gadget1:gadget@12500000 {
> +			status = "ok";
> +		};
> +
> +		/* OTG */
> +		usb1: usb@12500000 {

This one is good.

> +			status = "ok";
> +		};
> +
>  		usb3: usb@12520000 {
>  			status = "okay";
>  		};


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
