From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/2] dts: arm64: imx8mq: Enable gpu passive throttling
Date: Mon, 16 Sep 2019 16:33:37 +0200
Message-ID: <60da82b157be87d7a1050da47ace80adf2b638f3.camel@pengutronix.de>
References: <cover.1568255903.git.agx@sigxcpu.org>
         <0ab2ee7de9c2e24f6de860ffcbcdfc25b72c2c61.1568255903.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0ab2ee7de9c2e24f6de860ffcbcdfc25b72c2c61.1568255903.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel
List-Id: devicetree@vger.kernel.org

On Mi, 2019-09-11 at 19:40 -0700, Guido Günther wrote:
> Temperature and hysteresis were picked after the CPU.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 4fdd60f2c51e..5023a0e5068d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -235,12 +235,26 @@
>  			thermal-sensors = <&tmu 1>;
>  
>  			trips {
> +				gpu_alert: gpu-alert {
> +					temperature = <80000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>  				gpu-crit {
>  					temperature = <90000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&gpu_alert>;
> +					cooling-device =
> +						<&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		vpu-thermal {
> @@ -912,6 +926,7 @@
>  			         <&clk IMX8MQ_CLK_GPU_AXI>,
>  			         <&clk IMX8MQ_CLK_GPU_AHB>;
>  			clock-names = "core", "shader", "bus", "reg";
> +			#cooling-cells = <2>;
>  			assigned-clocks = <&clk IMX8MQ_CLK_GPU_CORE_SRC>,
>  			                  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
>  			                  <&clk IMX8MQ_CLK_GPU_AXI>,
