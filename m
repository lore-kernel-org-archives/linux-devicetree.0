From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: sdm845: add UFS controller
Date: Wed, 21 Nov 2018 23:18:47 -0800
Message-ID: <20181122071847.GL2225@minitux>
References: <20181026173544.136037-1-evgreen@chromium.org>
 <20181026173544.136037-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181026173544.136037-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 26 Oct 10:35 PDT 2018, Evan Green wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b72bdb0a31a5..9c72edb678ec 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -808,6 +808,73 @@
>  			};
>  		};
>  
> +		ufshc1: ufshc@1d84000 {

There's only one ufshc and one ufsphy, so no need to include the index.

[..]
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";

I have this as well, but this is not used by the upstream driver nor is
it mentioned in the dt-binding.

> +
> +			status = "disabled";
> +		};
> +
> +		ufsphy1: phy@1d87000 {

With reservation for the "reset" issue:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
