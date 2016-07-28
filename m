From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Patch v2 3/5] ARM: dts: qcom: msm8974: Add fixed regulator node
 for vph-pwr-reg
Date: Thu, 28 Jul 2016 10:01:47 -0700
Message-ID: <20160728170147.GQ13516@tuxbot>
References: <20160719050414.31704-1-bshah@kde.org>
 <20160719050414.31704-4-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160719050414.31704-4-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bhushan Shah <bshah@kde.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 18 Jul 22:04 PDT 2016, Bhushan Shah wrote:

> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bhushan Shah <bshah@kde.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 570028c..b5e80a4 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -615,4 +615,14 @@
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	vph_pwr_reg: vph-pwr-reg {

Please change this to:

vreg_vph_pwr: vreg-vph-pwr { ...

And you have my
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";

But this name is good.

> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };

Regards,
Bjorn
