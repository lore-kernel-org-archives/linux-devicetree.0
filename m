From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: i.MX6: Add BTicino i.MX6DL Mamoj
 initial support
Date: Mon, 16 Apr 2018 15:24:26 +0800
Message-ID: <20180416072425.GC25429@dragon>
References: <20180319194114.15349-1-jagan@amarulasolutions.com>
 <20180319194114.15349-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180319194114.15349-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio maggi <fabio.mauri@bticino.it>, lamiaposta71@gmail.com, Andrea CORTESE <andrea.cortese@bticino.it>, "davide . bonfanti" <davide.bonfanti@bticino.it>, Shyam Saini <shyam.saini@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, Simone CIANNI <simone.cianni@bticino.it>, Raffaele RECALCATI <raffaele.recalcati@bticino.it>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2018 at 01:11:14AM +0530, Jagan Teki wrote:
> +&i2c4 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c4>;
> +	status = "okay";
> +
> +	pmic: pfuze100@8 {

pfuze100: pmic@8

I fixed it up and applied both patches.

Shawn

> +		compatible = "fsl,pfuze100";
> +		reg = <0x08>;
