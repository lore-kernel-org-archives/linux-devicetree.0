From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v1 03/12] arm64: dts: msm8916: thermal: Add sensor for
 modem
Date: Tue, 19 Feb 2019 17:24:29 -0800
Message-ID: <20190220012428.GF2811@localhost.localdomain>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
 <b7a640640775f91956baebbd37a36201f93b78f8.1550493113.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b7a640640775f91956baebbd37a36201f93b78f8.1550493113.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 18, 2019 at 06:05:17PM +0530, Amit Kucheria wrote:
> On platforms that have a modem, sensor 0 monitors the modem.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 9e598ab438a1..9e4a82e5e0b4 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -278,7 +278,13 @@
>  					type = "critical";
>  				};
>  			};
> +		};
> +
> +		modem-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
>  
> +			thermal-sensors = <&tsens 0>;

A thermal zone with no trips no cooling? Please check the thermal.txt
binding for the required properties.

>  		};
>  
>  	};
> -- 
> 2.17.1
> 
