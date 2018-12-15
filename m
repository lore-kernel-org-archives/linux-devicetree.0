Return-Path: <SRS0=X4ub=OY=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 15 Dec 2018 08:27:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v3,3/3] arm64: dts: qcom: pm8916: Add PON watchdog node
Message-ID: <20181215162716.GA18695@roeck-us.net>
References: <1542962678-13697-3-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542962678-13697-3-git-send-email-loic.poulain@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, andy.gross@linaro.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Nov 23, 2018 at 09:44:38AM +0100, Loic Poulain wrote:
> Add watchdog child node to the PM8916 PON device.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

... with the assumption that this patch will be pushed through
an arm tree.

Guenter

> ---
>  v2: Add interrupts and timeout-sec props
>  v3: no change
> 
>  arch/arm64/boot/dts/qcom/pm8916.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> index a05ebaf..3230b88 100644
> --- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
> @@ -32,6 +32,12 @@
>  				bias-pull-up;
>  				linux,code = <KEY_POWER>;
>  			};
> +
> +			watchdog {
> +				compatible = "qcom,pm8916-wdt";
> +				interrupts = <0x0 0x8 6 IRQ_TYPE_EDGE_RISING>;
> +				timeout-sec = <60>;
> +			};
>  		};
>  
>  		pm8916_gpios: gpios@c000 {
