From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx7d: sbc imx7: add uart5
Date: Thu, 6 Dec 2018 11:15:21 +0800
Message-ID: <20181206031520.GE3987@dragon>
References: <20181204110741.6943-1-hohatzel@jusst.de>
 <20181204110741.6943-5-hohatzel@jusst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181204110741.6943-5-hohatzel@jusst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Ole Hatzel <hohatzel@jusst.de>
Cc: devicetree@vger.kernel.org, Julian Scheel <jscheel@jusst.de>, linux-arm-kernel@lists.infradead.org, fabio.estevam@nxp.com, ilya@compulab.co.il, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Dec 04, 2018 at 12:07:41PM +0100, Hans Ole Hatzel wrote:
> Adds uart5 connections as used on the sbc.
> In the sbc's reference material this is known as uart1, it does however
> connect to the som as uart5. This uart is connected via the soc's
> pins 11 (TX) and 13 (RX). On the sbc it is pinned out on P5
> using pins 15 (TX) and 17 (RX).
> 
> Signed-off-by: Hans Ole Hatzel <hohatzel@jusst.de>
> Signed-off-by: Julian Scheel <jscheel@jusst.de>
> ---
>  arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 16 ++++++++++++++++
>  arch/arm/boot/dts/imx7d-sbc-imx7.dts    |  4 ++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> index 6c2c844dc052..f7c002093c67 100644
> --- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> +++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> @@ -223,6 +223,15 @@
>  	fsl;
>  };
>  
> +&uart5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart5>;
> +	assigned-clocks = <&clks IMX7D_UART5_ROOT_SRC>;
> +	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;

Can we have some comments in the commit log on why we have to use this
particular clock source? 

Shawn

> +	status = "okay";
> +	fsl;
> +};
> +
>  &usbotg1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_usbotg1>;
> @@ -330,6 +339,13 @@
>  		>;
>  	};
>  
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			MX7D_PAD_I2C4_SCL__UART5_DCE_RX		0x79
> +			MX7D_PAD_I2C4_SDA__UART5_DCE_TX		0x79
> +		>;
> +	};
> +
>  	pinctrl_usdhc2: usdhc2grp {
>  		fsl,pins = <
>  			MX7D_PAD_SD2_CMD__SD2_CMD			0x59
> diff --git a/arch/arm/boot/dts/imx7d-sbc-imx7.dts b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
> index 74904127fbc6..d23d62aceb82 100644
> --- a/arch/arm/boot/dts/imx7d-sbc-imx7.dts
> +++ b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
> @@ -30,6 +30,10 @@
>  	status = "okay";
>  };
>  
> +&uart5 {
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
> -- 
> 2.19.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
