From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2] arm64: dts: fsl: imx8mq: enable the multi sensor TMU
Date: Tue, 19 Mar 2019 12:46:00 +0100
Message-ID: <1552995960.4806.5.camel@pengutronix.de>
References: <20190311213124.29325-1-angus@akkea.ca>
         <20190318184643.24025-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318184643.24025-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>, andrew.smirnov@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Abel Vesa <abel.vesa@nxp.com>, Baruch Siach <baruch@tkos.co.il>, Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Angus,

Am Montag, den 18.03.2019, 11:46 -0700 schrieb Angus Ainslie (Purism):
> Add the imx8mq TMU (Thermal mannagement unit) nodes for CPU,
> GPU, and VPU.
> 
> Changes since v1:
> 
> Removed references to multi sensor patch.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 118 ++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 9155bd4784eb..885395e74452 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi

[...]

> +			thermal-zones {
> +				cpu-thermal {
> +					polling-delay-passive = <250>;
> +					polling-delay = <2000>;
> +					thermal-sensors = <&tmu 0>;
> +
> +					trips {
> +						cpu_alert: cpu-alert {
> +							temperature = <85000>;
> +							hysteresis = <2000>;
> +							type = "passive";
> +						};
> +
> +						cpu_crit {
> +							temperature = <95000>;

All the critical trip points seem to be too high. The consumer parts
have a maximum junction temperature of 95°C, so the common DT
configuration used by all boards should have a crit trip point at least
a few degrees below this value. Boards that only use the industrial
parts can always overwrite the trip points if the designer wishes to do
so.

> +							hysteresis = <2000>;
> +							type = "critical";
> +						};
> +					};
> +
> +					cooling-maps {
> +						map0 {
> +							trip = <&cpu_alert>;
> +							cooling-device =
> +								<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +								<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +						};
> +					};
> +				};
> +
> +				gpu-thermal {
> +					polling-delay-passive = <250>;
> +					polling-delay = <2000>;
> +					thermal-sensors = <&tmu 1>;
> +
> +					trips {
> +						cpu-crit {

Should be gpu-crit.

> +							temperature = <95000>;
> +							hysteresis = <2000>;
> +							type = "critical";
> +						};
> +					};
> +				};
> +
> +				vpu-thermal {
> +					polling-delay-passive = <250>;
> +					polling-delay = <2000>;
> +					thermal-sensors = <&tmu 2>;
> +
> +					trips {
> +						cpu-crit {

Should be vpu-crit.

Regards,
Lucas
