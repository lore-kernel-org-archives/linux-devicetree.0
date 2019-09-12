From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] dts: arm64: imx8mq: Enable gpu passive throttling
Date: Wed, 11 Sep 2019 19:42:10 -0700
Message-ID: <20190912024210.GA13270@bogon.m.sigxcpu.org>
References: <cf1b114bcc6ef26e032c352b8c885aaf5f3594d0.1568254197.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cf1b114bcc6ef26e032c352b8c885aaf5f3594d0.1568254197.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Andrey Smirnov <andrew.smirnov@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,
On Wed, Sep 11, 2019 at 07:14:25PM -0700, Guido Günther wrote:
> Temperature and hysteresis were picked after the CPU.

I pulled that one from the wrong branch so please disregard. I've
sent out a v2.
Cheers,
 -- Guido

> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 564045927485..fda636085bb3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -235,12 +235,26 @@
>  			thermal-sensors = <&tmu 1>;
>  
>  			trips {
> +				gpu-alert {
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
> @@ -1006,6 +1020,7 @@
>  			         <&clk IMX8MQ_CLK_GPU_AXI>,
>  			         <&clk IMX8MQ_CLK_GPU_AHB>;
>  			clock-names = "core", "shader", "bus", "reg";
> +			#cooling-cells = <2>;
>  			assigned-clocks = <&clk IMX8MQ_CLK_GPU_CORE_SRC>,
>  			                  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
>  			                  <&clk IMX8MQ_CLK_GPU_AXI>,
> -- 
> 2.23.0.rc1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
