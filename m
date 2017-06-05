From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 5/5] ARM: dts: imx6: RIoTboard provide Standby to
 PowerOff option
Date: Mon, 5 Jun 2017 09:50:29 +0800
Message-ID: <20170605015027.GE4094@dragon>
References: <20170529170924.25488-1-o.rempel@pengutronix.de>
 <20170529170924.25488-5-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170529170924.25488-5-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux@rempel-orivat.de, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 29, 2017 at 07:09:24PM +0200, Oleksij Rempel wrote:
> This board, as well as some other boards with i.MX6 and a PMIC, uses a
> "MPIC_STBY_REQ" line to notify the PMIC about a state change.
> The PMIC is programmed for a specific state change before triggering the
> line.
> In this case, PMIC_STBY_REQ can be used for Stand by, Sleep
> and Power off modes.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: kernel@pengutronix.de
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/boot/dts/imx6dl-riotboard.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
> index 2cb72824e800..b5f25fe7b809 100644
> --- a/arch/arm/boot/dts/imx6dl-riotboard.dts
> +++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
> @@ -90,6 +90,10 @@
>  	status = "okay";
>  };
>  
> +&clks {
> +	fsl,pmic_stby_poweroff;
> +};
> +
>  &fec {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_enet>;
> @@ -125,6 +129,7 @@
>  		reg = <0x08>;
>  		interrupt-parent = <&gpio5>;
>  		interrupts = <16 8>;
> +		fsl,pmic_stby_poweroff;

Is this property supported by upstream kernel?

Shawn

>  
>  		regulators {
>  			reg_vddcore: sw1ab {				/* VDDARM_IN */
> -- 
> 2.11.0
> 
