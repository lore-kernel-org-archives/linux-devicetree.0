From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Patch v2 2/5] ARM: dts: msm8974: Move vreg_boost node from the
 honami to msm8974
Date: Thu, 28 Jul 2016 09:58:46 -0700
Message-ID: <20160728165846.GP13516@tuxbot>
References: <20160719050414.31704-1-bshah@kde.org>
 <20160719050414.31704-3-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160719050414.31704-3-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bhushan Shah <bshah@kde.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 18 Jul 22:04 PDT 2016, Bhushan Shah wrote:

> vreg_boost is Qualcomm platform specific and is also used in hammerhead
> device.
> 
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
>  arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts | 18 ++----------------
>  arch/arm/boot/dts/qcom-msm8974.dtsi                   | 11 +++++++++++
>  arch/arm/boot/dts/qcom-pm8941.dtsi                    |  6 ++++++
>  3 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> index a0398b6..8e33fc3 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> @@ -258,22 +258,13 @@
>  		};
>  	};
>  
> -	vreg_boost: vreg-boost {
> -		compatible = "regulator-fixed";
> -
> -		regulator-name = "vreg-boost";
> -		regulator-min-microvolt = <3150000>;
> -		regulator-max-microvolt = <3150000>;
> -
> -		regulator-always-on;
> -		regulator-boot-on;
> -
> +	vreg_boost {
>  		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&boost_bypass_n_pin>;
> -     };
> +	};

This part is Qualcomm reference design and I think we should just move
the entire node to the dtsi. Sorry if I wasn't clearer.

Regards,
Bjorn
