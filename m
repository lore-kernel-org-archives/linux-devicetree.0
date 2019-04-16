Return-Path: <SRS0=4Nci=SS=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH V12 5/5] arm64: dts: imx: add i.MX8QXP thermal support
References: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
 <1555384609-7030-5-git-send-email-Anson.Huang@nxp.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8f1c7e2b-2fd2-766c-7a75-8464361f7d1d@linaro.org>
Date: Tue, 16 Apr 2019 18:18:52 +0200
MIME-Version: 1.0
In-Reply-To: <1555384609-7030-5-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "agross@kernel.org" <agross@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 16/04/2019 05:22, Anson Huang wrote:
> Add i.MX8QXP CPU thermal zone support.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
> Changes since V11:
> 	- add cooling device for all secondary CPUs.
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 37 ++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 0683ee2..5eeaddc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/pinctrl/pads-imx8qxp.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	interrupt-parent = <&gic>;
> @@ -149,6 +150,11 @@
>  		rtc: rtc {
>  			compatible = "fsl,imx8qxp-sc-rtc";
>  		};
> +
> +		tsens: thermal-sensor {
> +			compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
> +			#thermal-sensor-cells = <1>;
> +		};
>  	};
>  
>  	timer {
> @@ -522,4 +528,35 @@
>  		compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
>  		timeout-sec = <60>;
>  	};
> +
> +	thermal_zones: thermal-zones {
> +		cpu-thermal0 {
> +			polling-delay-passive = <250>;
> +			polling-delay = <2000>;
> +			thermal-sensors = <&tsens IMX_SC_R_SYSTEM>;
> +			trips {
> +				cpu_alert0: trip0 {
> +					temperature = <107000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +				cpu_crit0: trip1 {
> +					temperature = <127000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_alert0>;
> +					cooling-device =
> +						<&A35_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A35_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A35_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&A35_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +
> +				};
> +			};
> +		};
> +	};
>  };
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
