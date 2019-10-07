From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-evk: Add i2c3 support
Date: Mon, 7 Oct 2019 20:23:16 +0800
Message-ID: <20191007122313.GJ7150@dragon>
References: <1568886408-18168-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568886408-18168-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2019 at 05:46:47PM +0800, Anson Huang wrote:
> Enable i2c3 for i.MX8MM EVK board.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index f7a15f3..7758c1c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -306,6 +306,13 @@
>  	};
>  };
>  
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	status = "okay";
> +};
> +
>  &iomuxc {

The iomuxc node is being put at end of file because of its huge pinctrl
data.  I2C devices should be placed in alphabetical sort though.  Can
you please have a patch moving i2c1 and i2c2 to correct place first,
and then add i2c3?

Shawn

>  	pinctrl-names = "default";
>  
> @@ -355,6 +362,13 @@
>  		>;
>  	};
>  
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
> +			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
> +		>;
> +	};
> +
>  	pinctrl_pmic: pmicirq {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
> -- 
> 2.7.4
> 
