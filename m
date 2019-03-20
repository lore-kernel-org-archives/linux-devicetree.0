From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/3] ARM: DTS: imx6q-logicpd: Reduce inrush current on
 start
Date: Wed, 20 Mar 2019 20:44:48 +0800
Message-ID: <20190320124446.GO4980@dragon>
References: <20190306140402.17122-1-aford173@gmail.com>
 <20190306140402.17122-2-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306140402.17122-2-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 06, 2019 at 08:04:00AM -0600, Adam Ford wrote:
> The main 3.3V regulator sources a series of additional regulators.
> This patch adds a small delay, so when the 3.3V regulator comes
> on it delays a bit before the subsequent regulators can come on.
> This reduces the inrush current a bit on the external DC power
> supply.
> 
> Fixes: 1c207f911fe9 ("ARM: dts: imx: Add support for Logic PD
> i.MX6QD EVM")

Same comment as patch #1.

> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

To match the convention, the 'DTS' in subject prefix should be
lowercase.

Shawn

> 
> diff --git a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> index fb01fa6e4224..e31b6923cb72 100644
> --- a/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> +++ b/arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi
> @@ -99,6 +99,7 @@
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <70000>;
>  		enable-active-high;
>  		regulator-always-on;
>  	};
> -- 
> 2.17.1
> 
