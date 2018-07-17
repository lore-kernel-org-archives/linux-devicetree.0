From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v3 2/3] ARM: dts: imx7s: add i.MX7 messaging unit support
Date: Tue, 17 Jul 2018 05:03:54 +0000
Message-ID: <AM0PR04MB421178D1CE16778CF9CEACA0805C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180716114209.25242-1-o.rempel@pengutronix.de>
 <20180716114209.25242-3-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180716114209.25242-3-o.rempel@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> Sent: Monday, July 16, 2018 7:42 PM
> To: Shawn Guo <shawnguo@kernel.org>; Fabio Estevam
> <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>; A.s. Dong <aisheng.dong@nxp.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-linux-
> imx <linux-imx@nxp.com>
> Subject: [PATCH v3 2/3] ARM: dts: imx7s: add i.MX7 messaging unit support
> 
> Define the Messaging Unit (MU) for i.MX7 in the processor's dtsi.
> The respective driver is added in the next commit.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index ce85b3ca1a55..5bc0d4109da1 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -1001,6 +1001,25 @@
>  				status = "disabled";
>  			};
> 
> +			mu0a: mailbox@30aa0000 {
> +				compatible = "fsl,imx7s-mu";
> +				reg = <0x30aa0000 0x10000>;
> +				interrupts = <GIC_SPI 88
> IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_MU_ROOT_CLK>;
> +				#mbox-cells = <1>;
> +				fsl,mu-side-a;

Excpet this property which I commented in patch 1, otherwise, this path
Is okay to me.

Regards
Dong Aisheng

> +				status = "disabled";
> +			};
> +
> +			mu0b: mailbox@30ab0000 {
> +				compatible = "fsl,imx7s-mu";
> +				reg = <0x30ab0000 0x10000>;
> +				interrupts = <GIC_SPI 97
> IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clks IMX7D_MU_ROOT_CLK>;
> +				#mbox-cells = <1>;
> +				status = "disabled";
> +			};
> +
>  			usbotg1: usb@30b10000 {
>  				compatible = "fsl,imx7d-usb", "fsl,imx27-usb";
>  				reg = <0x30b10000 0x200>;
> --
> 2.18.0
