From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 14/21] ARM: dts: imx6ull-colibri: Add sleep mode to fec
Date: Fri, 9 Aug 2019 15:38:58 +0000
Message-ID: <a2350a640f613bc7e41fa56f3909d462941125b6.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
 <20190807082556.5013-15-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190807082556.5013-15-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <F8771B20DCCFC64687326A1AB7862887@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-07 at 08:26 +0000, Philippe Schenker wrote:
> Do not change the clock as the power for this phy is switched
> with that clock.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx6ull-colibri.dtsi | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi
> b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> index d56728f03c35..1019ce69a242 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> @@ -62,8 +62,9 @@
>  };
>  
>  &fec2 {
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_enet2>;
> +	pinctrl-1 = <&pinctrl_enet2_sleep>;
>  	phy-mode = "rmii";
>  	phy-handle = <&ethphy1>;
>  	status = "okay";
> @@ -220,6 +221,21 @@
>  		>;
>  	};
>  
> +	pinctrl_enet2_sleep: enet2sleepgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO06__GPIO1_IO06	0x0
> +			MX6UL_PAD_GPIO1_IO07__GPIO1_IO07	0x0
> +			MX6UL_PAD_ENET2_RX_DATA0__GPIO2_IO08	0x0
> +			MX6UL_PAD_ENET2_RX_DATA1__GPIO2_IO09	0x0
> +			MX6UL_PAD_ENET2_RX_EN__GPIO2_IO10	0x0
> +			MX6UL_PAD_ENET2_RX_ER__GPIO2_IO15	0x0
> +			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x400
> 1b031
> +			MX6UL_PAD_ENET2_TX_DATA0__GPIO2_IO11	0x0
> +			MX6UL_PAD_ENET2_TX_DATA1__GPIO2_IO12	0x0
> +			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x0
> +		>;
> +	};
> +
>  	pinctrl_ecspi1_cs: ecspi1-cs-grp {
>  		fsl,pins = <
>  			MX6UL_PAD_LCD_DATA21__GPIO3_IO26	0x000a0
