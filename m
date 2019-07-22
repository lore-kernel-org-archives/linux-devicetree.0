From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V5 3/5] arm64: dts: imx8mm: Add system counter node
Date: Mon, 22 Jul 2019 11:15:18 +0800
Message-ID: <20190722031517.GT3738@dragon>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
 <20190710063056.35689-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710063056.35689-3-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, daniel.lezcano@linaro.org, tglx@linutronix.de, leonard.crestez@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com, angus@akkea.ca, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 10, 2019 at 02:30:54PM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Add i.MX8MM system counter node to enable timer-imx-sysctr
> broadcast timer driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Do I need to wait for patch #1 landing before I apply #3 ~ #5, or can
they be applied independently (no breaking on anything)?

Shawn

> ---
> Changes since V4:
> 	- update the clock info using fixed clock node;
> 	- correct the reg range;
> 	- update the interrupt number as the system counter driver ONLY uses 1 irq now.
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index b5637f8..8cf7f34 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -560,6 +560,14 @@
>  				#pwm-cells = <2>;
>  				status = "disabled";
>  			};
> +
> +			system_counter: timer@306a0000 {
> +				compatible = "nxp,sysctr-timer";
> +				reg = <0x306a0000 0x20000>;
> +				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&osc_24m>;
> +				clock-names = "per";
> +			};
>  		};
>  
>  		aips3: bus@30800000 {
> -- 
> 2.7.4
> 
