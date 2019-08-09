From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 03/21] ARM: dts: imx7-colibri: prepare module device
 tree for FlexCAN
Date: Fri, 9 Aug 2019 14:07:14 +0000
Message-ID: <84c580aadaf4e3007cc43e5f73163bf24af4a1ca.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
 <20190807082556.5013-4-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190807082556.5013-4-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <DCEC0E53FD0F3D46901555E1035A3587@eurprd05.prod.outlook.com>
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
> Prepare FlexCAN use on SODIMM 55/63 178/188. Those SODIMM pins are
> compatible for CAN bus use with several modules from the Colibri
> family.
> Add Better drivestrength and also add flexcan2.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx7-colibri.dtsi | 35 ++++++++++++++++++++++++---
> --
>  1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi
> b/arch/arm/boot/dts/imx7-colibri.dtsi
> index f7c9ce5bed47..52046085ce6f 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -117,6 +117,18 @@
>  	fsl,magic-packet;
>  };
>  
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "disabled";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	status = "disabled";
> +};
> +
>  &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> @@ -330,12 +342,11 @@
>  
>  &iomuxc {
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_gpio1 &pinctrl_gpio2 &pinctrl_gpio3
> &pinctrl_gpio4>;
> +	pinctrl-0 = <&pinctrl_gpio1 &pinctrl_gpio2 &pinctrl_gpio3
> &pinctrl_gpio4
> +		     &pinctrl_gpio7>;
>  
>  	pinctrl_gpio1: gpio1-grp {
>  		fsl,pins = <
> -			MX7D_PAD_ENET1_RGMII_RD3__GPIO7_IO3	0x74
> /* SODIMM 55 */
> -			MX7D_PAD_ENET1_RGMII_RD2__GPIO7_IO2	0x74
> /* SODIMM 63 */
>  			MX7D_PAD_SAI1_RX_SYNC__GPIO6_IO16	0x14 /*
> SODIMM 77 */
>  			MX7D_PAD_EPDC_DATA09__GPIO2_IO9		0x14
> /* SODIMM 89 */
>  			MX7D_PAD_EPDC_DATA08__GPIO2_IO8		0x74
> /* SODIMM 91 */
> @@ -416,6 +427,13 @@
>  		>;
>  	};
>  
> +	pinctrl_gpio7: gpio7-grp { /* Alternatively CAN1 */
> +		fsl,pins = <
> +			MX7D_PAD_ENET1_RGMII_RD3__GPIO7_IO3	0x14
> /* SODIMM 55 */
> +			MX7D_PAD_ENET1_RGMII_RD2__GPIO7_IO2	0x14
> /* SODIMM 63 */
> +		>;
> +	};
> +
>  	pinctrl_i2c1_int: i2c1-int-grp { /* PMIC / TOUCH */
>  		fsl,pins = <
>  			MX7D_PAD_GPIO1_IO13__GPIO1_IO13	0x79
> @@ -459,10 +477,17 @@
>  		>;
>  	};
>  
> +	pinctrl_flexcan1: flexcan1-grp {
> +		fsl,pins = <
> +			MX7D_PAD_ENET1_RGMII_RD3__FLEXCAN1_TX	0x79
> /* SODIMM 55 */
> +			MX7D_PAD_ENET1_RGMII_RD2__FLEXCAN1_RX	0x79
> /* SODIMM 63 */
> +		>;
> +	};
> +
>  	pinctrl_flexcan2: flexcan2-grp {
>  		fsl,pins = <
> -			MX7D_PAD_GPIO1_IO14__FLEXCAN2_RX	0x59
> -			MX7D_PAD_GPIO1_IO15__FLEXCAN2_TX	0x59
> +			MX7D_PAD_GPIO1_IO14__FLEXCAN2_RX	0x79 /*
> SODIMM 188 */
> +			MX7D_PAD_GPIO1_IO15__FLEXCAN2_TX	0x79 /*
> SODIMM 178 */
>  		>;
>  	};
