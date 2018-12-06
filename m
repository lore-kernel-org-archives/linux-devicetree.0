From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 7/9] ARM: dts: imx7d-pico: Extend peripherals support
Date: Thu, 6 Dec 2018 09:38:19 +0800
Message-ID: <20181206013818.GU3987@dragon>
References: <20181202212520.16650-1-otavio@ossystems.com.br>
 <20181202212520.16650-8-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181202212520.16650-8-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 02, 2018 at 07:25:18PM -0200, Otavio Salvador wrote:
...
> +&uart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart6>;
> +	assigned-clocks = <&clks IMX7D_UART6_ROOT_SRC>;
> +	assigned-clock-parents = <&clks IMX7D_OSC_24M_CLK>;
> +	fsl,uart-has-rtscts;

Use uart-has-rtscts instead.

> +	status = "okay";
> +};
> +
> +&uart7 { /* Bluetooth */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart7>;
> +	assigned-clocks = <&clks IMX7D_UART7_ROOT_SRC>;
> +	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
> +	fsl,uart-has-rtscts;

Ditto

> +	status = "okay";
> +};

Shawn
